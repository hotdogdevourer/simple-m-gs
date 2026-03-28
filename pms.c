
#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <time.h>
#include <stdint.h>
#include <ctype.h>
#include <errno.h>
#include <math.h>

#define VERSION_STR         "2.|.5-26032026"
#define VERSION_FMT         "R.I.B-DDMMYYYY (R meaning Release, I meaning 1 character version identification, and B meaning bugfix, DD meaning 2 digit day, MM meaning 2 digit month and YYYY meaning 4 digit year.)"
#define MAX_SPEC_FRAMES     8192
#define MAX_PHONEMES        1024
#define MAX_PITCH_POINTS    32
#define MAX_ANCHORS         64
#define MAX_CONTOUR_PTS     8192
#define MAX_SAMPLES         (48000 * 120)
#define MAX_FORMANTS        10                          
#define MAX_RULES           512
#define MAX_GRAPHEME_LEN    8
#define MAX_PHONEME_LEN     16
#define MAX_CONTEXT_LEN     8
#define MAX_EXCEPTIONS      256
#define MAX_WORD_LEN        64
int FORMANTS              = 10;

#define PI_F                3.14159265358979323846f
#define TWO_PI_F            (2.0f * PI_F)


typedef enum { MODE_DEMO = 0, MODE_SPEC = 1, MODE_PHONEME = 2 } SynthMode;
typedef enum { VOICE_NATURAL = 0, VOICE_WHISPER = 1, VOICE_IMPULSIVE = 2 } VoiceType;
typedef enum { FILTER_CASCADE = 0, FILTER_PARALLEL = 1 } FilterMode;
typedef enum { FMT_WAV16 = 0, FMT_WAV32 = 1, FMT_RAW16 = 2, FMT_RAW32 = 3 } OutFormat;

/* Text-to-Phoneme Rule-Based Engine */
typedef enum { CTX_ANY = 0, CTX_START = 1, CTX_END = 2 } ContextType;

typedef struct {
    char grapheme[MAX_GRAPHEME_LEN];
    ContextType left_ctx;
    char left_pattern[MAX_CONTEXT_LEN];
    ContextType right_ctx;
    char right_pattern[MAX_CONTEXT_LEN];
    char phoneme[MAX_PHONEME_LEN];
    int priority;
    int grapheme_len;
} GraphemeRule;

typedef struct {
    char word[MAX_WORD_LEN];
    char phonemes[MAX_PHONEMES];
} ExceptionEntry;

static const GraphemeRule g_default_rules[];
static const int g_default_rules_count;
static const ExceptionEntry g_exception_list[];
static const int g_exception_count;


typedef struct {
    float freq;                                     
    float bw;                                       
    float gain;                                     
    float b0, a1, a2;
    float z1, z2;
} Formant;

static void formant_reset(Formant *f) { f->z1 = f->z2 = 0.0f; }

static void formant_update(Formant *f, float freq, float bw,
                            float gain, float sr, int cascade)
{
    f->freq = freq;
    f->bw   = bw;
    f->gain = gain;

    if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
        f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
        return;
    }
    float r     = expf(-PI_F * bw / sr);
    float theta = TWO_PI_F * freq / sr;
    f->a1 = -2.0f * r * cosf(theta);
    f->a2 =  r * r;
    if (cascade) {
        f->b0 = 1.0f + f->a1 + f->a2;
        if (f->b0 < 1e-9f) f->b0 = 1e-9f;
    } else {
        f->b0 = (1.0f - r);                                             
    }
}

static float formant_process(Formant *f, float x)
{
    if (f->b0 == 0.0f) return 0.0f;
    float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
    f->z2 = f->z1;
    f->z1 = y;
    return y * f->gain;
}


typedef struct {
    float b0, b1, b2, a1, a2;
    float z1, z2;
} Biquad;

static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }

static float biquad_process(Biquad *b, float x)
{
    float y = b->b0 * x + b->z1;
    b->z1   = b->b1 * x - b->a1 * y + b->z2;
    b->z2   = b->b2 * x - b->a2 * y;
    return y;
}

static void make_highpass(Biquad *b, float fc, float sr)
{
    float k    = tanf(PI_F * fc / sr);
    float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
    b->b0 =  norm;
    b->b1 = -2.0f * norm;
    b->b2 =  norm;
    b->a1 =  2.0f * (k * k - 1.0f) * norm;
    b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
    biquad_reset(b);
}

static void make_bandpass(Biquad *b, float fc, float bw_hz, float sr)
{
    float r     = expf(-PI_F * bw_hz / sr);
    float theta = TWO_PI_F * fc / sr;
    b->b0 =  (1.0f - r);
    b->b1 =  0.0f;
    b->b2 =  0.0f;
    b->a1 = -2.0f * r * cosf(theta);
    b->a2 =  r * r;
    biquad_reset(b);
}


static uint32_t g_noise_state = 0xABCDEF01u;

static float white_noise(void)
{
    g_noise_state ^= g_noise_state << 13;
    g_noise_state ^= g_noise_state >> 17;
    g_noise_state ^= g_noise_state <<  5;
    return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
}


static inline float clampf(float v, float lo, float hi)
    { return v < lo ? lo : v > hi ? hi : v; }

static inline float lerpf(float a, float b, float t)
    { return a + (b - a) * t; }

static float interp(float v0, float v1, float t0, float t1, float t)
{
    if (t1 <= t0) return v0;
    float alpha = (t - t0) / (t1 - t0);
    return lerpf(v0, v1, clampf(alpha, 0.0f, 1.0f));
}


typedef struct {
    char    name[16];
    float   dur_ms;
    float   freq[MAX_FORMANTS];
    float   bw  [MAX_FORMANTS];
    float   voicing_amp;
    float   aspiration_amp;
    float   frication_amp;
    float   f0_default;
} PhonemeDBEntry;

static const PhonemeDBEntry g_phoneme_db[] = {
    {"a",  250,{700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
               {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,120},
    {"e",  220,{550,1770,2300,3260,4300,5300,6300,7300,8300,9300},
               {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,120},
    {"i",  200,{280,2230,2900,3300,4300,5300,6300,7300,8300,9300},
               { 60, 100, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,120},
    {"o",  250,{600, 800,2500,3300,4300,5300,6300,7300,8300,9300},
               {120, 150, 120, 140, 150, 160, 170, 180, 190, 200},0.90f,0.10f,0.00f,115},
    {"u",  220,{300, 800,2200,3200,4200,5200,6200,7200,8200,9200},
               { 80, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,115},
    {"ae", 240,{750,1400,2700,3600,4600,5600,6600,7600,8600,9600},
               {120, 150, 120, 140, 150, 160, 170, 180, 190, 200},0.90f,0.10f,0.00f,120},
    {"ah", 230,{800,1200,2700,3500,4500,5500,6500,7500,8500,9500},
               {130, 150, 120, 140, 150, 160, 170, 180, 190, 200},0.90f,0.10f,0.00f,118},
    {"aw", 260,{600, 900,2500,3300,4300,5300,6300,7300,8300,9300},
               {120, 150, 120, 140, 150, 160, 170, 180, 190, 200},0.90f,0.10f,0.00f,115},
    {"er", 220,{500,1500,1900,3400,4300,5300,6300,7300,8300,9300},
               {100, 140, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,118},
    {"ih", 180,{400,1700,2600,3300,4300,5300,6300,7300,8300,9300},
               {100, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,120},
    {"uh", 200,{600,1000,2400,3300,4300,5300,6300,7300,8300,9300},
               {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.90f,0.10f,0.00f,118},
    {"m",   80,{280, 700,2200,3000,4200,5200,6200,7200,8200,9200},
                { 80, 250, 300, 300, 400, 400, 400, 400, 400, 400},0.90f,0.00f,0.00f,115},
    {"n",   80,{280,1700,2400,3200,4200,5200,6200,7200,8200,9200},
                { 80, 250, 300, 300, 400, 400, 400, 400, 400, 400},0.90f,0.00f,0.00f,115},
    {"ng", 100,{280,1000,2700,3500,4300,5300,6300,7300,8300,9300},
            { 80, 200, 300, 300, 400, 400, 400, 400, 400, 400},0.90f,0.00f,0.00f,115},
    {"l",  120,{360,1000,2500,3400,4400,5400,6400,7400,8400,9400},
               { 80, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.85f,0.05f,0.00f,115},
    {"r",  120,{460,1100,1650,3400,4400,5400,6400,7400,8400,9400},
               { 80, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.85f,0.05f,0.00f,115},
    {"w",  100,{300, 600,2200,3200,4200,5200,6200,7200,8200,9200},
               { 80, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.85f,0.05f,0.00f,115},
    {"y",  100,{240,2100,3100,3600,4500,5500,6500,7500,8500,9500},
               { 80, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.85f,0.05f,0.00f,115},
    {"v",  120,{220, 700,2200,3200,4200,5200,6200,7200,8200,9200},
               {100, 120, 110, 130, 140, 150, 160, 170, 180, 190},0.50f,0.10f,0.50f,110},
    {"z",  120,{220,1700,2400,3200,4200,5200,6200,7200,8200,9200},
               {100, 120, 200, 300, 400, 400, 400, 400, 400, 400},0.50f,0.10f,0.60f,110},
    {"zh", 120,{220,1000,2200,3200,4200,5200,6200,7200,8200,9200},
               {100, 200, 300, 300, 400, 400, 400, 400, 400, 400},0.50f,0.10f,0.60f,110},
    {"dh", 100,{220,1100,2200,3200,4200,5200,6200,7200,8200,9200},
               {100, 200, 300, 300, 400, 400, 400, 400, 400, 400},0.50f,0.10f,0.40f,110},
    {"f",  120,{200, 900,2100,3000,4000,5000,6000,7000,8000,9000},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.30f,0.80f,  0},
    {"s",  130,{200,1700,2400,3200,4200,5200,6200,7200,8200,9200},
               {200, 400, 500, 500, 500, 500, 500, 500, 500, 500},0.00f,0.10f,0.90f,  0},
    {"sh", 130,{200,1000,2200,3200,4200,5200,6200,7200,8200,9200},
               {200, 400, 500, 500, 500, 500, 500, 500, 500, 500},0.00f,0.20f,0.80f,  0},
    {"th", 130,{200, 900,2200,3200,4200,5200,6200,7200,8200,9200},
               {300, 400, 500, 500, 500, 500, 500, 500, 500, 500},0.00f,0.20f,0.60f,  0},
    {"h",   80,{700,1200,2600,3500,4500,5500,6500,7500,8500,9500},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.20f,0.00f,  0},
    {"b",   80,{200, 900,2100,3100,4100,5100,6100,7100,8100,9100},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.70f,0.40f,0.60f, 80},
    {"d",   80,{300,1700,2500,3300,4300,5300,6300,7300,8300,9300},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.70f,0.40f,0.50f, 80},
    {"g",   80,{260,1600,2200,3200,4200,5200,6200,7200,8200,9200},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.70f,0.40f,0.50f, 80},
    {"p",   80,{200, 900,2100,3100,4100,5100,6100,7100,8100,9100},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.80f,0.80f,  0},
    {"t",   80,{200,1700,2500,3300,4300,5300,6300,7300,8300,9300},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.80f,0.70f,  0},
    {"k",   80,{200,1600,2200,3200,4200,5200,6200,7200,8200,9200},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.80f,0.70f,  0},
    {"ch", 100,{200,1600,2200,3200,4200,5200,6200,7200,8200,9200},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.00f,0.60f,0.80f,  0},
    {"jh", 100,{200,1600,2200,3200,4200,5200,6200,7200,8200,9200},
               {200, 300, 300, 400, 400, 400, 400, 400, 400, 400},0.50f,0.50f,0.70f, 80},
    {"_",   80,{700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
               {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.00f,0.00f,0.00f,  0},
    {"SIL", 80,{700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
               {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},0.00f,0.00f,0.00f,  0},
};
static const int g_phoneme_db_size =
    (int)(sizeof(g_phoneme_db) / sizeof(g_phoneme_db[0]));

static const PhonemeDBEntry *find_phoneme_db(const char *name)
{
    for (int i = 0; i < g_phoneme_db_size; i++)
        if (strcasecmp(g_phoneme_db[i].name, name) == 0)
            return &g_phoneme_db[i];
    return NULL;
}

/* ========== Text-to-Phoneme Rule Engine ========== */

/* Default exception list for irregular words */
static const ExceptionEntry g_exception_list[] = {
    {"the", "dh ah"}, {"was", "w ah z"}, {"have", "h ae v"}, {"had", "h ae d"},
    {"does", "d ah z"}, {"done", "d ah n"}, {"one", "w ah n"}, {"two", "t uw"},
    {"read", "r eh d"}, {"been", "b ih n"}, {"colonel", "k er n ah l"},
    {"through", "th r uw"}, {"though", "dh ow"}, {"thought", "th ao t"},
    {"enough", "ih n ah f"}, {"cough", "k ao f"}, {"rough", "r ah f"},
    {"laugh", "l ae f"}, {"people", "p iy p ah l"}, {"woman", "w uh m ah n"},
    {"women", "w ih m ih n"}, {"friend", "f r eh n d"}, {"said", "s eh d"},
    {"says", "s eh z"}, {"give", "g ih v"}, {"given", "g ih v ah n"},
    {"come", "k ah m"}, {"some", "s ah m"}, {"home", "h ow m"},
    {"love", "l ah v"}, {"move", "m uw v"}, {"prove", "p r uw v"},
    {"word", "w er d"}, {"work", "w er k"}, {"world", "w er l d"},
    {"first", "f er s t"}, {"third", "th er d"}, {"bird", "b er d"},
    {"eye", "ay"}, {"ear", "ih r"}, {"heart", "h aa r t"},
    {"water", "w ao t er"}, {"what", "w ah t"}, {"where", "w eh r"},
    {"there", "dh eh r"}, {"here", "h ih r"}, {"their", "dh eh r"},
    {"they", "dh ey"}, {"them", "dh eh m"}, {"then", "dh eh n"},
    {"than", "dh ae n"}, {"this", "dh ih s"}, {"that", "dh ae t"},
    {"those", "dh ow z"}, {"these", "dh iy z"}, {"which", "w ih ch"},
    {"who", "h uw"}, {"whom", "h uw m"}, {"whose", "h uw z"},
    {"know", "n ow"}, {"known", "n ow n"}, {"knowledge", "n ao l ih jh"},
    {"knife", "n ay f"}, {"knight", "n ay t"}, {"gnome", "n ow m"},
    {"island", "ay l ah n d"}, {"debt", "d eh t"}, {"doubt", "d aw t"},
    {"subtle", "s ah t ah l"}, {"muscle", "m ah s ah l"}, {"scene", "s iy n"},
    {"scissors", "s ih z er z"}, {"schedule", "sh eh d uw l"}, {"machine", "m ah sh iy n"},
    {"chef", "sh eh f"}, {"chaos", "k ey ao s"}, {"character", "k ae r ih k t er"},
    {"choir", "k w ay er"}, {"yacht", "y ao t"}, {"psychology", "s ay k ao l ah jh iy"},
    {"pneumonia", "n uw m ow n iy ah"}, {"receipt", "r ih s iy t"}, {"corps", "k or"},
    {"queue", "k y uw"}, {"unique", "y uw n iy k"}, {"build", "b ih l d"},
    {"built", "b ih l t"}, {"guilt", "g ih l t"}, {"circuit", "s er k ih t"},
    {"leopard", "l eh p er d"}, {"business", "b ih z n ih s"}, {"forfeit", "f or f ih t"},
    {"sovereign", "s ao v r ih n"}, {"blood", "b l ah d"}, {"flood", "f l ah d"},
    {"good", "g uh d"}, {"foot", "f uh t"}, {"door", "d or"}, {"floor", "f l or"},
    {"poor", "p uh r"}, {"sure", "sh uh r"}, {"sugar", "sh uh g er"},
    {"nation", "n ey sh ah n"}, {"action", "ae k sh ah n"}, {"station", "s tay sh ah n"},
    {"ocean", "ow sh ah n"}, {"special", "s p eh sh ah l"}, {"official", "ah f ih sh ah l"},
    {"mission", "m ih sh ah n"}, {"passion", "p ae sh ah n"}, {"tension", "t eh n sh ah n"},
};
static const int g_exception_count = (int)(sizeof(g_exception_list) / sizeof(g_exception_list[0]));

/* Default rule set - compiled from rules.txt format */
static const GraphemeRule g_default_rules[] = {
    /* Suffix rules (high priority) */
    {"ing", CTX_ANY, "", CTX_END, "", "ih ng", 10, 3},
    {"ed", CTX_ANY, "", CTX_END, "", "d", 10, 2},
    {"es", CTX_ANY, "", CTX_END, "", "z", 10, 2},
    {"tion", CTX_ANY, "", CTX_ANY, "", "sh ah n", 10, 4},
    {"sion", CTX_ANY, "", CTX_ANY, "", "zh ah n", 10, 4},
    {"ture", CTX_ANY, "", CTX_ANY, "", "ch er", 10, 4},
    {"sure", CTX_ANY, "", CTX_ANY, "", "zh er", 10, 4},
    {"ous", CTX_ANY, "", CTX_END, "", "ah s", 10, 3},
    {"ful", CTX_ANY, "", CTX_END, "", "f ah l", 10, 3},
    {"less", CTX_ANY, "", CTX_END, "", "l ih s", 10, 4},
    {"ness", CTX_ANY, "", CTX_END, "", "n ih s", 10, 4},
    {"ment", CTX_ANY, "", CTX_END, "", "m ah n t", 10, 4},
    {"ly", CTX_ANY, "", CTX_END, "", "l iy", 10, 2},
    {"er", CTX_ANY, "", CTX_END, "", "er", 10, 2},
    {"est", CTX_ANY, "", CTX_END, "", "ih s t", 10, 3},
    
    /* Silent E rules */
    {"e", CTX_ANY, "", CTX_END, "", "", 9, 1},  /* silent e at end */
    
    /* Vowel teams (digraphs and trigraphs) */
    {"ea", CTX_ANY, "", CTX_ANY, "", "iy", 8, 2},
    {"ee", CTX_ANY, "", CTX_ANY, "", "iy", 8, 2},
    {"ei", CTX_ANY, "", CTX_ANY, "", "iy", 8, 2},
    {"ie", CTX_ANY, "", CTX_ANY, "", "iy", 8, 2},
    {"eo", CTX_ANY, "", CTX_ANY, "", "iy ow", 8, 2},
    {"eu", CTX_ANY, "", CTX_ANY, "", "y uw", 8, 2},
    {"ey", CTX_ANY, "", CTX_ANY, "", "iy", 8, 2},
    {"oo", CTX_ANY, "", CTX_ANY, "", "uw", 8, 2},
    {"oa", CTX_ANY, "", CTX_ANY, "", "ow", 8, 2},
    {"oe", CTX_ANY, "", CTX_ANY, "", "ow", 8, 2},
    {"ou", CTX_ANY, "", CTX_ANY, "", "aw", 8, 2},
    {"ow", CTX_ANY, "", CTX_ANY, "", "ow", 8, 2},
    {"ai", CTX_ANY, "", CTX_ANY, "", "ey", 8, 2},
    {"ay", CTX_ANY, "", CTX_ANY, "", "ey", 8, 2},
    {"au", CTX_ANY, "", CTX_ANY, "", "ao", 8, 2},
    {"aw", CTX_ANY, "", CTX_ANY, "", "ao", 8, 2},
    {"oi", CTX_ANY, "", CTX_ANY, "", "oy", 8, 2},
    {"oy", CTX_ANY, "", CTX_ANY, "", "oy", 8, 2},
    {"ui", CTX_ANY, "", CTX_ANY, "", "uw", 8, 2},
    {"ue", CTX_ANY, "", CTX_ANY, "", "uw", 8, 2},
    {"uo", CTX_ANY, "", CTX_ANY, "", "uw ow", 8, 2},
    {"ia", CTX_ANY, "", CTX_ANY, "", "ay ah", 8, 2},
    {"io", CTX_ANY, "", CTX_ANY, "", "ay ow", 8, 2},
    {"ieu", CTX_ANY, "", CTX_ANY, "", "uw", 8, 3},
    {"eau", CTX_ANY, "", CTX_ANY, "", "ow", 8, 3},
    
    /* Consonant digraphs */
    {"th", CTX_ANY, "", CTX_ANY, "", "th", 7, 2},
    {"sh", CTX_ANY, "", CTX_ANY, "", "sh", 7, 2},
    {"ch", CTX_ANY, "", CTX_ANY, "", "ch", 7, 2},
    {"ph", CTX_ANY, "", CTX_ANY, "", "f", 7, 2},
    {"wh", CTX_ANY, "", CTX_ANY, "", "w", 7, 2},
    {"wr", CTX_START, "", CTX_ANY, "", "r", 7, 2},
    {"kn", CTX_START, "", CTX_ANY, "", "n", 7, 2},
    {"gn", CTX_START, "", CTX_ANY, "", "n", 7, 2},
    {"mb", CTX_ANY, "", CTX_END, "", "m", 7, 2},
    {"ck", CTX_ANY, "", CTX_ANY, "", "k", 7, 2},
    {"ng", CTX_ANY, "", CTX_ANY, "", "ng", 7, 2},
    {"gh", CTX_ANY, "", CTX_ANY, "", "", 7, 2},  /* often silent */
    {"rh", CTX_START, "", CTX_ANY, "", "r", 7, 2},
    
    /* R-controlled vowels */
    {"ar", CTX_ANY, "", CTX_ANY, "", "aa r", 6, 2},
    {"er", CTX_ANY, "", CTX_ANY, "", "er", 6, 2},
    {"ir", CTX_ANY, "", CTX_ANY, "", "er", 6, 2},
    {"or", CTX_ANY, "", CTX_ANY, "", "ao r", 6, 2},
    {"ur", CTX_ANY, "", CTX_ANY, "", "er", 6, 2},
    {"air", CTX_ANY, "", CTX_ANY, "", "eh r", 6, 3},
    {"ear", CTX_ANY, "", CTX_ANY, "", "ih r", 6, 3},
    {"oor", CTX_ANY, "", CTX_ANY, "", "ao r", 6, 3},
    {"our", CTX_ANY, "", CTX_ANY, "", "aw r", 6, 3},
    
    /* Special combinations */
    {"qu", CTX_ANY, "", CTX_ANY, "", "k w", 5, 2},
    {"ci", CTX_ANY, "", CTX_ANY, "a,e,i,y", "sh", 5, 2},
    {"ce", CTX_ANY, "", CTX_ANY, "a,o,u", "s", 5, 2},
    {"ge", CTX_ANY, "", CTX_ANY, "a,o,u", "jh", 5, 2},
    {"gi", CTX_ANY, "", CTX_ANY, "", "jh", 5, 2},
    {"gy", CTX_ANY, "", CTX_ANY, "", "jh", 5, 2},
    {"ti", CTX_ANY, "", CTX_ANY, "o", "sh", 5, 2},
    {"si", CTX_ANY, "", CTX_ANY, "o", "zh", 5, 2},
    
    /* Initial H */
    {"h", CTX_START, "", CTX_ANY, "", "h", 4, 1},
    {"h", CTX_ANY, "", CTX_ANY, "", "h", 3, 1},
    
    /* Single consonants */
    {"b", CTX_ANY, "", CTX_ANY, "", "b", 3, 1},
    {"c", CTX_ANY, "", CTX_ANY, "e,i,y", "s", 3, 1},
    {"c", CTX_ANY, "", CTX_ANY, "", "k", 3, 1},
    {"d", CTX_ANY, "", CTX_ANY, "", "d", 3, 1},
    {"f", CTX_ANY, "", CTX_ANY, "", "f", 3, 1},
    {"g", CTX_ANY, "", CTX_ANY, "e,i,y", "jh", 3, 1},
    {"g", CTX_ANY, "", CTX_ANY, "", "g", 3, 1},
    {"j", CTX_ANY, "", CTX_ANY, "", "jh", 3, 1},
    {"k", CTX_ANY, "", CTX_ANY, "", "k", 3, 1},
    {"l", CTX_ANY, "", CTX_ANY, "", "l", 3, 1},
    {"m", CTX_ANY, "", CTX_ANY, "", "m", 3, 1},
    {"n", CTX_ANY, "", CTX_ANY, "", "n", 3, 1},
    {"p", CTX_ANY, "", CTX_ANY, "", "p", 3, 1},
    {"q", CTX_ANY, "", CTX_ANY, "", "k", 3, 1},
    {"r", CTX_ANY, "", CTX_ANY, "", "r", 3, 1},
    {"s", CTX_ANY, "", CTX_ANY, "", "s", 3, 1},
    {"t", CTX_ANY, "", CTX_ANY, "", "t", 3, 1},
    {"v", CTX_ANY, "", CTX_ANY, "", "v", 3, 1},
    {"w", CTX_ANY, "", CTX_ANY, "", "w", 3, 1},
    {"x", CTX_ANY, "", CTX_ANY, "", "k s", 3, 1},
    {"y", CTX_ANY, "", CTX_ANY, "", "y", 3, 1},
    {"z", CTX_ANY, "", CTX_ANY, "", "z", 3, 1},
    
    /* Single vowels */
    {"a", CTX_ANY, "", CTX_END, "", "ey", 2, 1},  /* open syllable */
    {"a", CTX_ANY, "", CTX_ANY, "", "ae", 2, 1},
    {"e", CTX_ANY, "", CTX_END, "", "iy", 2, 1},
    {"e", CTX_ANY, "", CTX_ANY, "", "eh", 2, 1},
    {"i", CTX_ANY, "", CTX_END, "", "ay", 2, 1},
    {"i", CTX_ANY, "", CTX_ANY, "", "ih", 2, 1},
    {"o", CTX_ANY, "", CTX_END, "", "ow", 2, 1},
    {"o", CTX_ANY, "", CTX_ANY, "", "aa", 2, 1},
    {"u", CTX_ANY, "", CTX_END, "", "y uw", 2, 1},
    {"u", CTX_ANY, "", CTX_ANY, "", "ah", 2, 1},
    {"y", CTX_ANY, "", CTX_END, "", "ay", 2, 1},
    {"y", CTX_ANY, "", CTX_ANY, "", "ih", 2, 1},
};
static const int g_default_rules_count = (int)(sizeof(g_default_rules) / sizeof(g_default_rules[0]));

/* Forward declarations for TTP functions */
static int ttp_load_rules(const char *filename, GraphemeRule *rules, int max_rules);
static int ttp_text_to_phonemes(const char *text, char *output, int max_output, 
                                 const GraphemeRule *rules, int rule_count);
static const char* ttp_lookup_exception(const char *word);
static void ttp_lowercase(char *str);
static int ttp_match_context(const char *text, int pos, const GraphemeRule *rule, int text_len);
static int ttp_parse_rule_line(const char *line, GraphemeRule *rule);

/* Load rules from file or use defaults */
static int ttp_load_rules(const char *filename, GraphemeRule *rules, int max_rules)
{
    FILE *fp = fopen(filename, "r");
    if (!fp) {
        /* Use default rules */
        if (max_rules < g_default_rules_count) return -1;
        memcpy(rules, g_default_rules, sizeof(GraphemeRule) * g_default_rules_count);
        return g_default_rules_count;
    }
    
    int count = 0;
    char line[1024];
    while (fgets(line, sizeof(line), fp) && count < max_rules) {
        /* Skip comments and empty lines */
        char *p = line;
        while (*p == ' ' || *p == '\t') p++;
        if (*p == '#' || *p == '\n' || *p == '\r' || *p == '\0') continue;
        
        GraphemeRule rule;
        memset(&rule, 0, sizeof(rule));
        if (ttp_parse_rule_line(p, &rule)) {
            rules[count++] = rule;
        }
    }
    fclose(fp);
    
    if (count == 0) {
        /* Fall back to defaults */
        if (max_rules < g_default_rules_count) return -1;
        memcpy(rules, g_default_rules, sizeof(GraphemeRule) * g_default_rules_count);
        return g_default_rules_count;
    }
    return count;
}

/* Parse a rule line: (left) grapheme (right) -> phoneme [priority] */
static int ttp_parse_rule_line(const char *line, GraphemeRule *rule)
{
    const char *p = line;
    
    /* Skip leading whitespace */
    while (*p == ' ' || *p == '\t') p++;
    
    /* Check for left context */
    if (*p == '(') {
        p++;
        const char *end = strchr(p, ')');
        if (!end) return 0;
        size_t len = end - p;
        if (len >= MAX_CONTEXT_LEN) len = MAX_CONTEXT_LEN - 1;
        
        if (len == 1 && *p == '_') rule->left_ctx = CTX_ANY;
        else if (len == 1 && *p == '^') rule->left_ctx = CTX_START;
        else if (len == 1 && *p == '$') rule->left_ctx = CTX_END;
        else {
            rule->left_ctx = CTX_ANY;
            strncpy(rule->left_pattern, p, len);
            rule->left_pattern[len] = '\0';
        }
        p = end + 1;
    } else {
        rule->left_ctx = CTX_ANY;
    }
    
    /* Skip whitespace */
    while (*p == ' ' || *p == '\t') p++;
    
    /* Get grapheme */
    const char *g_start = p;
    while (*p && *p != ' ' && *p != '\t' && *p != '(' && *p != '-' && *p != '>') p++;
    size_t glen = p - g_start;
    if (glen == 0 || glen >= MAX_GRAPHEME_LEN) return 0;
    strncpy(rule->grapheme, g_start, glen);
    rule->grapheme[glen] = '\0';
    rule->grapheme_len = (int)glen;
    
    /* Skip whitespace */
    while (*p == ' ' || *p == '\t') p++;
    
    /* Check for right context */
    if (*p == '(') {
        p++;
        const char *end = strchr(p, ')');
        if (!end) return 0;
        size_t len = end - p;
        if (len >= MAX_CONTEXT_LEN) len = MAX_CONTEXT_LEN - 1;
        
        if (len == 1 && *p == '_') rule->right_ctx = CTX_ANY;
        else if (len == 1 && *p == '^') rule->right_ctx = CTX_START;
        else if (len == 1 && *p == '$') rule->right_ctx = CTX_END;
        else {
            rule->right_ctx = CTX_ANY;
            strncpy(rule->right_pattern, p, len);
            rule->right_pattern[len] = '\0';
        }
        p = end + 1;
    } else {
        rule->right_ctx = CTX_ANY;
    }
    
    /* Skip whitespace and find -> */
    while (*p == ' ' || *p == '\t') p++;
    if (*p == '-') p++;
    if (*p == '>') p++;
    while (*p == ' ' || *p == '\t') p++;
    
    /* Get phoneme */
    const char *ph_start = p;
    while (*p && *p != ' ' && *p != '\t' && *p != '[' && *p != '\n' && *p != '\r') p++;
    size_t phlen = p - ph_start;
    if (phlen == 0 || phlen >= MAX_PHONEME_LEN) return 0;
    strncpy(rule->phoneme, ph_start, phlen);
    rule->phoneme[phlen] = '\0';
    
    /* Check for optional priority */
    while (*p == ' ' || *p == '\t') p++;
    if (*p == '[') {
        p++;
        rule->priority = atoi(p);
    } else {
        rule->priority = 5;  /* Default priority */
    }
    
    return 1;
}

/* Lookup exception word */
static const char* ttp_lookup_exception(const char *word)
{
    char lower_word[MAX_WORD_LEN];
    strncpy(lower_word, word, MAX_WORD_LEN - 1);
    lower_word[MAX_WORD_LEN - 1] = '\0';
    ttp_lowercase(lower_word);
    
    for (int i = 0; i < g_exception_count; i++) {
        if (strcmp(g_exception_list[i].word, lower_word) == 0) {
            return g_exception_list[i].phonemes;
        }
    }
    return NULL;
}

/* Convert string to lowercase */
static void ttp_lowercase(char *str)
{
    for (; *str; str++) {
        if (*str >= 'A' && *str <= 'Z') *str += 'a' - 'A';
    }
}

/* Check if context matches */
static int ttp_match_context(const char *text, int pos, const GraphemeRule *rule, int text_len)
{
    /* Check left context */
    if (rule->left_ctx == CTX_START && pos != 0) return 0;
    if (rule->left_ctx == CTX_END) return 0;  /* Doesn't make sense for left */
    
    if (rule->left_pattern[0] != '\0') {
        int plen = (int)strlen(rule->left_pattern);
        if (pos < plen) return 0;
        if (strncmp(text + pos - plen, rule->left_pattern, plen) != 0) return 0;
    }
    
    /* Check right context */
    if (rule->right_ctx == CTX_END && pos + rule->grapheme_len != text_len) return 0;
    if (rule->right_ctx == CTX_START) return 0;  /* Doesn't make sense for right */
    
    if (rule->right_pattern[0] != '\0') {
        int plen = (int)strlen(rule->right_pattern);
        if (pos + rule->grapheme_len + plen > text_len) return 0;
        if (strncmp(text + pos + rule->grapheme_len, rule->right_pattern, plen) != 0) return 0;
    }
    
    return 1;
}

/* Main text-to-phoneme conversion using longest-match left-to-right */
static int ttp_text_to_phonemes(const char *text, char *output, int max_output,
                                 const GraphemeRule *rules, int rule_count)
{
    output[0] = '\0';
    int out_pos = 0;
    
    /* Process word by word */
    char word[MAX_WORD_LEN];
    int word_pos = 0;
    int i = 0;
    int text_len = (int)strlen(text);
    
    while (i <= text_len) {
        char c = (i < text_len) ? text[i] : ' ';
        
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '\'' || c == '-') {
            if (word_pos < MAX_WORD_LEN - 1) {
                word[word_pos++] = c;
            }
            i++;
        } else {
            /* Process accumulated word */
            if (word_pos > 0) {
                word[word_pos] = '\0';
                
                /* Check exception list first */
                const char *exc = ttp_lookup_exception(word);
                if (exc) {
                    int elen = (int)strlen(exc);
                    if (out_pos + elen + 2 < max_output) {
                        if (out_pos > 0) output[out_pos++] = ' ';
                        strcpy(output + out_pos, exc);
                        out_pos += elen;
                    }
                } else {
                    /* Apply rule-based conversion */
                    ttp_lowercase(word);
                    int wlen = (int)strlen(word);
                    int wi = 0;
                    
                    while (wi < wlen) {
                        int best_len = 0;
                        const GraphemeRule *best_rule = NULL;
                        
                        /* Find longest matching rule */
                        for (int r = 0; r < rule_count; r++) {
                            const GraphemeRule *rule = &rules[r];
                            
                            /* Check if grapheme matches at current position */
                            if (wi + rule->grapheme_len > wlen) continue;
                            if (strncmp(word + wi, rule->grapheme, rule->grapheme_len) != 0) continue;
                            
                            /* Check context */
                            if (!ttp_match_context(word, wi, rule, wlen)) continue;
                            
                            /* Prefer longer match, then higher priority */
                            if (rule->grapheme_len > best_len ||
                                (rule->grapheme_len == best_len && 
                                 best_rule && rule->priority > best_rule->priority)) {
                                best_len = rule->grapheme_len;
                                best_rule = rule;
                            }
                        }
                        
                        if (best_rule && best_len > 0) {
                            /* Add phoneme to output */
                            if (best_rule->phoneme[0] != '\0') {
                                int plen = (int)strlen(best_rule->phoneme);
                                if (out_pos + plen + 2 < max_output) {
                                    if (out_pos > 0 && output[out_pos-1] != ' ') 
                                        output[out_pos++] = ' ';
                                    strcpy(output + out_pos, best_rule->phoneme);
                                    out_pos += plen;
                                }
                            }
                            wi += best_len;
                        } else {
                            /* No rule matched, skip character */
                            wi++;
                        }
                    }
                }
                word_pos = 0;
            }
            
            /* Add space between words */
            if (c != ' ' && out_pos > 0 && output[out_pos-1] != ' ') {
                if (out_pos < max_output - 1) output[out_pos++] = ' ';
            }
            i++;
        }
    }
    
    output[out_pos] = '\0';
    return out_pos;
}

/* Coarticulation: smooth transitions between phonemes */
static void ttp_apply_coarticulation(char *phonemes, int len)
{
    /* Simple coarticulation: adjust vowel formants based on neighboring consonants */
    /* This is a placeholder for more sophisticated coarticulation */
    (void)phonemes;
    (void)len;
}

/* GCI (Glottal Closure Instant) detection for voiced sounds */
static float ttp_estimate_gci(const char *phoneme, float duration_ms, float sample_rate)
{
    /* Estimate GCI timing based on phoneme type */
    /* Returns offset in samples from phoneme start */
    const PhonemeDBEntry *entry = find_phoneme_db(phoneme);
    if (!entry) return duration_ms * sample_rate / 1000.0f * 0.5f;
    
    /* Voiced sounds have regular GCI at F0 period */
    if (entry->voicing_amp > 0.5f && entry->f0_default > 0) {
        return sample_rate / entry->f0_default;  /* One glottal period */
    }
    return duration_ms * sample_rate / 1000.0f * 0.5f;
}


typedef struct {
    float time_ms;
    float freq[MAX_FORMANTS];
    float bw  [MAX_FORMANTS];
    float voicing_amp;
    float aspiration_amp;
    float frication_amp;
    float f0;
    float gain_mult;
    float fgain[MAX_FORMANTS];                                  
    int   has_fgain;
} SpecFrame;

typedef struct {
    SpecFrame *frames;
    int        nframes;
    int        sample_rate;
    FilterMode filter_mode;
    float      duration_ms;
} SpecData;


typedef struct {
    float time_percent;                             
    float f0_hz;
} PitchPoint;

typedef struct {
    float time_percent;
    float frequency;
    float bandwidth;
} FormantAnchor;

typedef struct {
    char  name[16];
    float duration_ms;

    PitchPoint pitch_points[MAX_PITCH_POINTS];
    int        n_pitch;

    float target_freq[MAX_FORMANTS];
    float target_bw  [MAX_FORMANTS];

    FormantAnchor anchors[MAX_FORMANTS][MAX_ANCHORS];
    int           n_anchors[MAX_FORMANTS];
    int           has_anchors;                                 

    float voicing_amp;
    float aspiration_amp;
    float frication_amp;
    int   plosive_type;                                                    
} PhonemeInst;

typedef struct {
    PhonemeInst *phonemes;
    int          nphon;
    int          sample_rate;
    FilterMode   filter_mode;
    float        tempo;
    char         phoneme_set[16];
} PhonemeData;


typedef struct { float time_ms; float f0_hz; } ContourPt;

static float contour_f0(const ContourPt *pts, int n, float t_ms)
{
    if (n == 0) return 120.0f;
    if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
    if (t_ms >= pts[n-1].time_ms) return pts[n-1].f0_hz;
    for (int i = 0; i < n-1; i++)
        if (t_ms >= pts[i].time_ms && t_ms <= pts[i+1].time_ms)
            return interp(pts[i].f0_hz, pts[i+1].f0_hz,
                          pts[i].time_ms, pts[i+1].time_ms, t_ms);
    return pts[n-1].f0_hz;
}


typedef struct {
    float freq[MAX_FORMANTS];
    float bw  [MAX_FORMANTS];
    float voicing_amp, aspiration_amp, frication_amp;
    float f0;
    float vibrato_depth, vibrato_rate;
    float jitter_pct, shimmer_pct;
} VoicePreset;

static const VoicePreset g_preset_natural = {
    {700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
    {110, 130, 110, 130, 140, 150, 160, 170, 180, 190},
    2.5f, 0.12f, 0.00f, 120.0f, 1.5f, 5.5f, 1.0f, 2.0f
};
static const VoicePreset g_preset_whisper = {
    {700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
    {150, 200, 150, 180, 200, 200, 200, 200, 200, 220},
    0.45f, 0.65f, 0.05f,  95.0f, 0.5f, 4.5f, 4.0f, 4.0f
};
static const VoicePreset g_preset_impulsive = {
    {700,1220,2600,3540,4500,5500,6500,7500,8500,9500},
    { 80, 100,  80, 100, 110, 120, 130, 140, 150, 160},
    0.85f, 0.08f, 0.00f, 150.0f, 0.0f, 5.0f, 0.5f, 1.0f
};


typedef struct {
    SynthMode  mode;
    FilterMode filter_mode;
    VoiceType  voice_type;

    int   sample_rate;
    float duration_sec;
    float f0_hz;
    float output_amplitude;

    Formant formants[MAX_FORMANTS];
    float   formant_gains[MAX_FORMANTS];

    float voicing_amp, aspiration_amp, frication_amp;

    float vibrato_depth_hz, vibrato_rate_hz;
    float jitter_percent, shimmer_percent;

    float aspiration_cutoff;
    float frication_center, frication_bandwidth;

    ContourPt *pitch_contour;
    int        n_contour;

    SpecData    spec;
    PhonemeData phon;

    char      output_filename[512];
    char      input_filename [512];
    char      demo_voice     [32];
    char      rules_filename [512];  /* For custom text-to-phoneme rules */
    char      ttp_text_input[MAX_PHONEMES * 4];  /* Converted phonemes from text */
    OutFormat output_format;
    int       normalize_output;
    int       lip_radiation_enabled;
    int       verbose;

    float pitch_phase;
    float vibrato_phase;
    float lip_rad_z1;
} SynthState;


static void w16(FILE *f, uint16_t v) {
    uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
    fwrite(b,1,2,f);
}
static void w32(FILE *f, uint32_t v) {
    uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
                  (uint8_t)((v>>16)&0xFF),(uint8_t)(v>>24)};
    fwrite(b,1,4,f);
}

static int wav16_write(const char *path, const float *s, int n, int sr)
{
    FILE *fp = fopen(path,"wb");
    if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
    w32(fp,0x46464952u);                           
    w32(fp,(uint32_t)(36 + n*2));
    w32(fp,0x45564157u);                           
    w32(fp,0x20746D66u);                           
    w32(fp,16); w16(fp,1); w16(fp,1);                
    w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*2);
    w16(fp,2); w16(fp,16);
    w32(fp,0x61746164u); w32(fp,(uint32_t)n*2);             
    for (int i=0;i<n;i++){
        float v = clampf(s[i],-1.f,1.f);
        int16_t iv = (int16_t)(v * 32767.0f);
        uint8_t b[2]={(uint8_t)(iv&0xFF),(uint8_t)((iv>>8)&0xFF)};
        fwrite(b,1,2,fp);
    }
    fclose(fp); return 0;
}

static int wav32_write(const char *path, const float *s, int n, int sr)
{
    FILE *fp = fopen(path,"wb");
    if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
    uint32_t dsz = (uint32_t)n * 4;
    w32(fp,0x46464952u);
    w32(fp, 36 + 4 + 12 + dsz);                     
    w32(fp,0x45564157u);
    w32(fp,0x20746d66u);
    w32(fp,18); w16(fp,3); w16(fp,1);                       
    w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*4);
    w16(fp,4); w16(fp,32); w16(fp,0);               
    w32(fp,0x74636166u); w32(fp,4); w32(fp,(uint32_t)n);           
    w32(fp,0x61746164u); w32(fp,dsz);
    fwrite(s,4,n,fp);
    fclose(fp); return 0;
}

static int raw16_write(const char *path, const float *s, int n)
{
    FILE *fp = fopen(path,"wb");
    if (!fp) return -1;
    for (int i=0;i<n;i++){
        int16_t v=(int16_t)(clampf(s[i],-1.f,1.f)*32767.f);
        uint8_t b[2]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF)};
        fwrite(b,1,2,fp);
    }
    fclose(fp); return 0;
}
static int raw32_write(const char *path, const float *s, int n)
{
    FILE *fp = fopen(path,"wb");
    if (!fp) return -1;
    fwrite(s,4,n,fp);
    fclose(fp); return 0;
}


static char *nxtok(char **p)
{
    char *q = *p;
    while (*q==' '||*q=='\t') q++;
    if (!*q||*q=='\n'||*q=='\r'||*q=='#'){*p=q;return NULL;}
    char *s = q;
    while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
    if (*q){*q='\0';q++;}
    *p = q;
    return s;
}

static int spec_parse(const char *path, SpecData *sd)
{
    FILE *fp = fopen(path,"r");
    if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }

    sd->frames   = (SpecFrame*)calloc(MAX_SPEC_FRAMES, sizeof(SpecFrame));
    if (!sd->frames){ fclose(fp); return -1; }
    sd->nframes      = 0;
    sd->sample_rate  = 22050;
    sd->filter_mode  = FILTER_CASCADE;
    sd->duration_ms  = 0.0f;

    char line[8192];
    int  lno = 0;
    while (fgets(line, sizeof(line), fp)) {
        lno++;
        char *p = line;
        while (*p==' '||*p=='\t') p++;
        if (*p=='#'||*p=='\n'||*p=='\r'||!*p) continue;

        if (strncasecmp(p,"SAMPLE_RATE",11)==0){
            sd->sample_rate = atoi(p+12); continue;
        }
        if (strncasecmp(p,"SYNTHESIS_MODE",14)==0){
            char *v=p+15; while(*v==' '||*v=='\t')v++;
            sd->filter_mode = strncasecmp(v,"parallel",8)==0 ? FILTER_PARALLEL : FILTER_CASCADE;
            continue;
        }
        if (strncasecmp(p,"DURATION",8)==0){
            sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
        }
        if (strncasecmp(p,"NORMALIZE",9)==0||
            strncasecmp(p,"LIP_RADIATION",13)==0) continue;

        if (sd->nframes >= MAX_SPEC_FRAMES){
            fprintf(stderr,"Warning: spec file too many frames; truncating at %d\n",MAX_SPEC_FRAMES);
            break;
        }

        SpecFrame *fr = &sd->frames[sd->nframes];
        memset(fr,0,sizeof(*fr));
        for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
        fr->gain_mult = 1.0f;

        char *ptr = p;
        char *tok;

        #define NEED(label) \
            tok=nxtok(&ptr); if(!tok){ fprintf(stderr,"Warning: line %d incomplete\n",lno); goto label; }

        NEED(skip) fr->time_ms = (float)atof(tok);
        int ok = 1;
        for(int k=0;k<FORMANTS&&ok;k++){
            tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->freq[k]=(float)atof(tok);
            tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
        }
        if(!ok){ fprintf(stderr,"Warning: line %d: incomplete formant columns\n",lno); goto skip; }

        NEED(push) fr->voicing_amp    = (float)atof(tok);
        NEED(push) fr->aspiration_amp = (float)atof(tok);
        NEED(push) fr->frication_amp  = (float)atof(tok);
        NEED(push) fr->f0             = (float)atof(tok);
        NEED(push) fr->gain_mult      = (float)atof(tok);
        if(fr->gain_mult < 1e-6f) fr->gain_mult = 1.0f;

        {
            int ng = 0;
            for(int k=0;k<FORMANTS;k++){
                tok=nxtok(&ptr); if(!tok) break;
                fr->fgain[k]=(float)atof(tok); ng++;
            }
            if(ng>0) fr->has_fgain=1;
        }
        push:
        sd->nframes++;
        continue;
        skip: continue;
        #undef NEED
    }
    fclose(fp);

    if (sd->nframes==0){
        fprintf(stderr,"Error: no valid frames in spec file '%s'\n",path); return -1;
    }
    if (sd->duration_ms <= 0.0f)
        sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
    return 0;
}

static void spec_at(const SpecData *sd, float t_ms,
                    float *freq, float *bw,
                    float *voicing, float *aspiration, float *frication,
                    float *f0, float *gain_mult, float *fgain)
{
    if (sd->nframes == 0) return;

    int lo = 0, hi = sd->nframes-1;
    if (t_ms <= sd->frames[0].time_ms) { lo = hi = 0; }
    else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
    else {
        for (int i = 0; i < sd->nframes-1; i++) {
            if (t_ms >= sd->frames[i].time_ms && t_ms <= sd->frames[i+1].time_ms) {
                lo = i; hi = i+1; break;
            }
        }
    }

    const SpecFrame *A = &sd->frames[lo];
    const SpecFrame *B = &sd->frames[hi];
    float t0 = A->time_ms, t1 = B->time_ms;

    for (int k=0;k<FORMANTS;k++){
        freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
        bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
        float ga = A->has_fgain ? A->fgain[k] : 1.0f;
        float gb = B->has_fgain ? B->fgain[k] : 1.0f;
        fgain[k] = interp(ga, gb, t0,t1,t_ms);
    }
    *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
    *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
    *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
    *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
    *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
}


static int parse_pitch_pt(const char *tok, PitchPoint *pp)
{
    char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
    char *c = strchr(buf,':'); if(!c) return 0;
    *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
    return 1;
}

static int parse_formant_pair(const char *tok, float *fr, float *bw)
{
    char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
    char *sl = strchr(buf,'/');
    if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
    *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
    return 1;
}

static int phoneme_parse(const char *path, PhonemeData *pd)
{
    FILE *fp = fopen(path,"r");
    if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }

    pd->phonemes    = (PhonemeInst*)calloc(MAX_PHONEMES, sizeof(PhonemeInst));
    if (!pd->phonemes){ fclose(fp); return -1; }
    pd->nphon       = 0;
    pd->sample_rate = 22050;
    pd->filter_mode = FILTER_CASCADE;
    pd->tempo       = 1.0f;
    strcpy(pd->phoneme_set,"ipa");

    char line[4096];
    int lno = 0;
    while (fgets(line,sizeof(line),fp)){
        lno++;
        char *p = line;
        while(*p==' '||*p=='\t') p++;
        if (*p=='#'||*p=='\n'||*p=='\r'||!*p) continue;

        if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
        if (strncasecmp(p,"SYNTHESIS_MODE",14)==0){
            char *v=p+15; while(*v==' '||*v=='\t')v++;
            pd->filter_mode=strncasecmp(v,"parallel",8)==0?FILTER_PARALLEL:FILTER_CASCADE;
            continue;
        }
        if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
        if (strncasecmp(p,"PHONEME_SET",11)==0){
            char *v=p+12; while(*v==' '||*v=='\t')v++;
            sscanf(v,"%15s",pd->phoneme_set); continue;
        }
        if (strncasecmp(p,"VOICE_TYPE",10)==0) continue;

        if (pd->nphon >= MAX_PHONEMES){
            fprintf(stderr,"Warning: too many phonemes; truncating at %d\n",MAX_PHONEMES);
            break;
        }

        PhonemeInst *ph = &pd->phonemes[pd->nphon];
        memset(ph,0,sizeof(*ph));

        char *ptr = p;
        char *tok = nxtok(&ptr); if (!tok) continue;
        strncpy(ph->name, tok, sizeof(ph->name)-1);

        tok = nxtok(&ptr); if (!tok) continue;
        ph->duration_ms = (float)atof(tok);
        if (pd->tempo > 1e-4f) ph->duration_ms /= pd->tempo;

        const PhonemeDBEntry *dbe = find_phoneme_db(ph->name);
        if (dbe) {
            for(int k=0;k<FORMANTS;k++){
                ph->target_freq[k]=dbe->freq[k];
                ph->target_bw  [k]=dbe->bw  [k];
            }
            ph->voicing_amp    = dbe->voicing_amp;
            ph->aspiration_amp = dbe->aspiration_amp;
            ph->frication_amp  = dbe->frication_amp;
            {
                const char *n = ph->name;
                if (strcasecmp(n,"p")==0||strcasecmp(n,"t")==0||strcasecmp(n,"k")==0)
                    ph->plosive_type = 1;                 
                else if (strcasecmp(n,"b")==0||strcasecmp(n,"d")==0||strcasecmp(n,"g")==0)
                    ph->plosive_type = 2;              
                else
                    ph->plosive_type = 0;
            }
        } else {
            float df[]={700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
            float db[]={110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
            for(int k=0;k<FORMANTS;k++){ph->target_freq[k]=df[k];ph->target_bw[k]=db[k];}
            ph->voicing_amp=0.8f; ph->aspiration_amp=0.2f;
        }

        int fi = 0;
        while ((tok = nxtok(&ptr)) != NULL) {
            if (strchr(tok,':') && !strchr(tok,'/')) {
                if (ph->n_pitch < MAX_PITCH_POINTS)
                    parse_pitch_pt(tok, &ph->pitch_points[ph->n_pitch++]);
            } else if (strchr(tok,'/')) {
                if (fi < FORMANTS) {
                    parse_formant_pair(tok,
                        &ph->target_freq[fi], &ph->target_bw[fi]);
                    fi++;
                }
            }
        }

        if (ph->n_pitch == 0) {
            float f0d = (dbe && dbe->f0_default>0) ? dbe->f0_default : 120.0f;
            ph->pitch_points[0] = (PitchPoint){0.0f,   f0d};
            ph->pitch_points[1] = (PitchPoint){100.0f, f0d};
            ph->n_pitch = 2;
        }

        pd->nphon++;
    }
    fclose(fp);

    if (pd->nphon == 0){
        fprintf(stderr,"Error: no phonemes parsed from '%s'\n",path); return -1;
    }
    return 0;
}

static int contour_parse(const char *path, ContourPt **out, int *cnt)
{
    FILE *fp = fopen(path,"r");
    if (!fp){ fprintf(stderr,"Error: cannot open contour '%s'\n",path); return -1; }
    *out = (ContourPt*)malloc(MAX_CONTOUR_PTS * sizeof(ContourPt));
    *cnt = 0;
    char line[256];
    while (fgets(line,sizeof(line),fp) && *cnt < MAX_CONTOUR_PTS) {
        char *p=line; while(*p==' '||*p=='\t')p++;
        if(*p=='#'||*p=='\n'||*p=='\r') continue;
        float t,f;
        if (sscanf(p,"%f %f",&t,&f)==2){
            (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
        }
    }
    fclose(fp); return 0;
}


static float phon_pitch(const PhonemeInst *ph, float t_within_ms)
{
    if (ph->n_pitch == 0) return 120.0f;
    float dur = ph->duration_ms > 0 ? ph->duration_ms : 1.0f;
    float pct = t_within_ms / dur * 100.0f;
    const PitchPoint *pts = ph->pitch_points;
    int np = ph->n_pitch;
    if (pct <= pts[0].time_percent) return pts[0].f0_hz;
    if (pct >= pts[np-1].time_percent) return pts[np-1].f0_hz;
    for (int i=0;i<np-1;i++){
        if (pct>=pts[i].time_percent && pct<=pts[i+1].time_percent){
            float a=(pct-pts[i].time_percent)/(pts[i+1].time_percent-pts[i].time_percent);
            return lerpf(pts[i].f0_hz, pts[i+1].f0_hz, a);
        }
    }
    return pts[np-1].f0_hz;
}


static float glottal_wave(float phase, VoiceType vt)
{
    float v;
    if (vt == VOICE_IMPULSIVE) {
        v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
    } else {
        if (phase < 0.7f)
            v = phase / 0.7f;
        else
            v = 1.0f - (phase - 0.7f) / 0.3f;
        v = 2.0f * v - 1.0f;
        if (vt == VOICE_WHISPER)
            v = white_noise() * 0.45f;                                 
    }
    return v;
}

static void normalize_buf(float *buf, int n, float target)
{
    float peak = 0.0f;
    for (int i=0;i<n;i++){ float a=fabsf(buf[i]); if(a>peak) peak=a; }
    if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
}

static int synthesize(SynthState *st, float **out, int *out_n)
{
    int   sr  = st->sample_rate;
    float dur = st->duration_sec;

    if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
        float total = 0.0f;
        for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
        float needed = total/1000.0f + 0.05f;
        if (dur < needed) dur = needed;
    }
    if (st->mode == MODE_SPEC) {
        float needed = st->spec.duration_ms/1000.0f + 0.1f;
        if (dur < needed) dur = needed;
    }

    int N = (int)(dur * sr);
    if (N <= 0) N = sr * 2;
    if (N > MAX_SAMPLES) N = MAX_SAMPLES;

    float *buf = (float*)calloc(N, sizeof(float));
    if (!buf){ fprintf(stderr,"Error: out of memory (%d samples)\n",N); return -1; }

    Biquad asp, fric, burst_filt;
    make_highpass(&asp,
                  st->aspiration_cutoff > 10.0f ? st->aspiration_cutoff : 500.0f,
                  (float)sr);
    make_bandpass(&fric,
                  st->frication_center      > 10.0f ? st->frication_center      : 4000.0f,
                  st->frication_bandwidth   > 10.0f ? st->frication_bandwidth   : 2000.0f,
                  (float)sr);
    make_highpass(&burst_filt, 800.0f, (float)sr);

    for (int k=0;k<FORMANTS;k++) formant_reset(&st->formants[k]);
    st->pitch_phase   = 0.0f;
    st->vibrato_phase = 0.0f;
    st->lip_rad_z1    = 0.0f;

    float  *phon_t0   = NULL;                                      
    float (*phon_sf)[MAX_FORMANTS] = NULL;
    float (*phon_sb)[MAX_FORMANTS] = NULL;

    if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
        int np = st->phon.nphon;
        phon_t0 = (float*)malloc((np+1)*sizeof(float));
        phon_sf = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sf));
        phon_sb = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sb));

        phon_t0[0] = 0.0f;
        for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;

        for (int k=0;k<FORMANTS;k++){
            phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
            phon_sb[0][k] = st->formants[k].bw   > 0 ? st->formants[k].bw  : 110.0f;
        }
        for (int i=1;i<np;i++){
            const char *prev_name = st->phon.phonemes[i-1].name;
            int prev_is_sil = (strcasecmp(prev_name,"sil")==0 ||
                               strcmp(prev_name,"_")==0);
            for(int k=0;k<FORMANTS;k++){
                if (prev_is_sil) {
                    phon_sf[i][k] = st->phon.phonemes[i].target_freq[k];
                    phon_sb[i][k] = st->phon.phonemes[i].target_bw  [k];
                } else {
                    phon_sf[i][k] = st->phon.phonemes[i-1].target_freq[k];
                    phon_sb[i][k] = st->phon.phonemes[i-1].target_bw  [k];
                }
            }
        }
    }

    int ramp_on  = (int)(0.006f * sr);
    int ramp_off = (int)(0.012f * sr);

    float sm_coef = expf(-1.0f / (0.008f * sr));                                
    float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
    float sm_a    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].aspiration_amp : st->aspiration_amp;
    float sm_fr   = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].frication_amp  : st->frication_amp;
    int   is_burst = 0;                                          

    for (int n = 0; n < N; n++) {
        float t_ms = (float)n / sr * 1000.0f;

        float f0        = st->f0_hz;
        float v_amp     = st->voicing_amp;
        float a_amp     = st->aspiration_amp;
        float fr_amp    = st->frication_amp;
        float gain_mult = 1.0f;
        float freq[MAX_FORMANTS], bw[MAX_FORMANTS], fgain[MAX_FORMANTS];
        for(int k=0;k<FORMANTS;k++){
            freq [k] = st->formants[k].freq;
            bw   [k] = st->formants[k].bw;
            fgain[k] = st->formant_gains[k];
        }

        if (st->pitch_contour && st->n_contour > 0)
            f0 = contour_f0(st->pitch_contour, st->n_contour, t_ms);

        if (st->mode == MODE_SPEC) {
            spec_at(&st->spec, t_ms, freq, bw,
                    &v_amp, &a_amp, &fr_amp, &f0, &gain_mult, fgain);
            if (st->pitch_contour && st->n_contour > 0)
                f0 = contour_f0(st->pitch_contour, st->n_contour, t_ms);

        } else if (st->mode == MODE_PHONEME && phon_t0) {
            int pi = -1;
            float t_within = 0.0f;
            int np = st->phon.nphon;

            if (t_ms < phon_t0[np]) {
                int lo=0, hi=np-1;
                while (lo<=hi) {
                    int mid=(lo+hi)/2;
                    if (t_ms < phon_t0[mid])         hi=mid-1;
                    else if (t_ms >= phon_t0[mid+1]) lo=mid+1;
                    else { pi=mid; break; }
                }
            } else {
                pi = -1;                                                              
            }

            if (pi >= 0) {
                const PhonemeInst *ph = &st->phon.phonemes[pi];
                t_within = t_ms - phon_t0[pi];
                float dur_ph = ph->duration_ms > 1.0f ? ph->duration_ms : 1.0f;
                float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);

                f0     = phon_pitch(ph, t_within);
                v_amp  = ph->voicing_amp    * st->voicing_amp;   
                a_amp  = ph->aspiration_amp;
                fr_amp = ph->frication_amp;

                if (ph->plosive_type > 0) {
                    float burst_env = 0.0f;
                    if (pct < 0.40f) {
                        if (ph->plosive_type == 2) {
                            v_amp  = 0.18f;
                            a_amp  = 0.0f;
                            fr_amp = 0.0f;
                        } else {
                            v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f;
                        }
                        f0 = (ph->plosive_type == 2) ? phon_pitch(ph, t_within) : 0.0f;
                        is_burst = 0;
                    } else if (pct < 0.55f) {
                        float bp = (pct - 0.40f) / 0.15f;                              
                        burst_env = sinf(bp * PI_F);                               
                        v_amp  = 0.0f;
                        a_amp  = 0.0f;
                        fr_amp = 1.4f * burst_env;
                        f0     = 0.0f;
                        is_burst = 1;
                    } else {
                        float rp = (pct - 0.55f) / 0.45f;                                 
                        if (ph->plosive_type == 1) {
                            v_amp  = 0.0f;
                            a_amp  = ph->aspiration_amp * rp;
                            fr_amp = 0.0f;
                        } else {
                            v_amp  = ph->voicing_amp * rp;
                            a_amp  = ph->aspiration_amp * (1.0f - rp);
                            fr_amp = 0.0f;
                        }
                        is_burst = 0;
                    }
                    (void)burst_env;
                } else {
                    is_burst = 0;
                }

                for (int k=0;k<FORMANTS;k++){
                    freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
                    bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
                    fgain[k] = 1.0f;
                }

                if (st->pitch_contour && st->n_contour > 0)
                    f0 = contour_f0(st->pitch_contour, st->n_contour, t_ms);

            } else {
                v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
                for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
            }
        }

        if (st->vibrato_depth_hz > 0.0f) {
            st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
            if (st->vibrato_phase >= TWO_PI_F) st->vibrato_phase -= TWO_PI_F;
            f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
        }

        if (st->jitter_percent > 0.0f)
            f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);

        float shimmer = 1.0f;
        if (st->shimmer_percent > 0.0f)
            shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);

        if (f0 > 0.0f) f0 = clampf(f0, 40.0f, 500.0f);

        int cascade = (st->filter_mode == FILTER_CASCADE);
        for(int k=0;k<FORMANTS;k++){
            formant_update(&st->formants[k], freq[k], bw[k],
                           fgain[k] > 0.0f ? fgain[k] : 1.0f,
                           (float)sr, cascade);
        }

        float prev_sm_v = sm_v;
        sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
        sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
        sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
        if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
            st->pitch_phase = 0.0f;

        float v_sig = 0.0f;
        if (f0 > 0.0f && sm_v > 1e-5f) {
            float period = (float)sr / f0;
            st->pitch_phase += 1.0f / period;
            if (st->pitch_phase >= 1.0f) st->pitch_phase -= 1.0f;
            v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
        }

        float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
        float fr_sig = sm_fr > 1e-5f
            ? (is_burst ? biquad_process(&burst_filt, white_noise())
                        : biquad_process(&fric,       white_noise())) * sm_fr
            : 0.0f;

        float excitation = v_sig + a_sig;

        float samp;
        if (cascade) {
            samp = excitation;
            for(int k=0;k<FORMANTS;k++)
                if(st->formants[k].freq > 0.0f)
                    samp = formant_process(&st->formants[k], samp);
            samp += fr_sig * 0.25f;                                    
        } else {
            samp = 0.0f;
            for(int k=0;k<FORMANTS;k++)
                if(st->formants[k].freq > 0.0f)
                    samp += formant_process(&st->formants[k], excitation);
            samp += fr_sig * 0.35f;
        }

        if (st->lip_radiation_enabled) {
            float y = samp - 0.97f * st->lip_rad_z1;
            st->lip_rad_z1 = samp;
            samp = y;
        }

        samp *= gain_mult * st->output_amplitude;

        if (n < ramp_on)
            samp *= (float)n / (float)ramp_on;
        if (n >= N - ramp_off && ramp_off > 0)
            samp *= (float)(N - n) / (float)ramp_off;

        buf[n] = samp;
    }

    if (st->normalize_output)
        normalize_buf(buf, N, 0.707f);                

    for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);

    free(phon_t0);
    free(phon_sf);
    free(phon_sb);

    *out   = buf;
    *out_n = N;
    return 0;
}


static void print_help(void)
{
    puts("Klatt-Style Formant Speech Synthesizer\n");
    puts("Usage: pms [OPTIONS] [OUTPUT_FILE]\n");
    puts("Mode Selection (mutually exclusive):");
    puts("  --spec FILE              Load specification frames from file");
    puts("  --phon-spec FILE         Load detailed phoneme specifications from file");
    puts("  --phoneme FILE           Load simple phoneme sequence from file");
    puts("  --text TEXT              Convert text directly to speech (uses rule-based TTP)");
    puts("  --demo VOICE_TYPE        Demo mode (natural|whisper|impulsive)\n");
    puts("Text-to-Phoneme Options:");
    puts("  --rules FILE             Custom rules file for text-to-phoneme (default: rules.txt or built-in)");
    puts("                           If no rules file found with --text, error is raised\n");
    puts("Global Parameters:");
    puts("  --sample-rate SR         Sample rate (16000|22050|44100|48000|88200|96000|176400|192000, default: 22050)");
    puts("  --duration SEC           Duration in seconds (default: 2.0)");
    puts("  --f0 HZ                  Fundamental frequency (default: 120)");
    puts("  --synthesis MODE         Synthesis mode (cascade|parallel, default: cascade)");
    puts("  --amplitude LEVEL        Output amplitude 0.0-1.0 (default: 0.8)");
    printf("  --formants INT           Amount of formants to use, 1-%d\n\n", MAX_FORMANTS);
    puts("Voice Parameters:");
    puts("  --voice TYPE             Voice type (natural|whisper|impulsive)");
    puts("  --voicing-amp AMP        Voicing amplitude (default: 0.7)");
    puts("  --aspiration-amp AMP     Aspiration amplitude (default: 0.3)");
    puts("  --frication-amp AMP      Frication amplitude (default: 0.0)\n");
    puts("Pitch Control:");
    puts("  --vibrato-depth HZ       Vibrato depth (default: 0.0)");
    puts("  --vibrato-rate HZ        Vibrato rate (default: 5.0)");
    puts("  --jitter PERCENT         Pitch jitter (default: 1.0)");
    puts("  --shimmer PERCENT        Amplitude shimmer (default: 2.0)");
    puts("  --pitch-contour FILE     Load F0 contour from file (time_ms f0_hz per line)\n");
    puts("Formant Parameters (demo mode only):");
    puts("  --f1-10 HZ               Formant 1-10 frequencies");
    puts("  --bw1-10 HZ              Formant 1-10 bandwidths");
    puts("  --bw6-10 HZ              Set bandwidths 6-10 to same value\n");
    puts("Aspiration / Frication:");
    puts("  --aspiration-cutoff HZ   High-pass cutoff for aspiration noise (default: 500)");
    puts("  --frication-center HZ    Centre frequency of frication noise (default: 4000)");
    puts("  --frication-bandwidth HZ Bandwidth of frication noise (default: 2000)\n");
    puts("Output Options:");
    puts("  --output FILE            Output filename (default: output.wav)");
    puts("  --output-format FORMAT   wav16|wav32|raw16|raw32 (default: wav16)");
    puts("  --normalize              Enable loudness normalization (default: enabled)");
    puts("  --no-lip-radiation       Disable lip radiation filter");
    puts("  --verbose                Print debug information");
    puts("  --help                   Display this help message");
}

static void print_version(void) {
    printf("poor man's synthesizer version %s version format %s\n", VERSION_STR, VERSION_FMT);
}


static int valid_sr(int sr)
{
    static const int ok[]={8000,16000,22050,44100,48000,88200,96000,176400,192000};
    for(int i=0;i<5;i++) if(sr==ok[i]) return 1;
    return 0;
}

static void apply_preset(SynthState *st, const VoicePreset *vp)
{
    for(int k=0;k<FORMANTS;k++){
        st->formants[k].freq = vp->freq[k];
        st->formants[k].bw   = vp->bw  [k];
    }
    st->voicing_amp       = vp->voicing_amp;
    st->aspiration_amp    = vp->aspiration_amp;
    st->frication_amp     = vp->frication_amp;
    st->f0_hz             = vp->f0;
    st->vibrato_depth_hz  = vp->vibrato_depth;
    st->vibrato_rate_hz   = vp->vibrato_rate;
    st->jitter_percent    = vp->jitter_pct;
    st->shimmer_percent   = vp->shimmer_pct;
}

static int match_fi_arg(const char *arg, const char *prefix)
{
    if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
    const char *p = arg + strlen(prefix);
    if (!*p || !isdigit((unsigned char)*p)) return 0;
    int fi = atoi(p);
    return (fi>=1 && fi<=FORMANTS) ? fi : 0;
}

static int parse_args(int argc, char **argv, SynthState *st)
{
    int mode_set = 0;
    int explicit_formant[MAX_FORMANTS]={0};
    int explicit_bw     [MAX_FORMANTS]={0};
    int explicit_voicing=0, explicit_asp=0, explicit_fric=0;
    int explicit_f0=0, explicit_vibdepth=0, explicit_vibrate=0;
    int explicit_jitter=0, explicit_shimmer=0;

    for (int i=1;i<argc;i++) {
        const char *a = argv[i];
        #define NEED_VAL(flag) \
            if (i+1>=argc){fprintf(stderr,"Error: %s requires a value\n",flag);return -1;}

        if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
        if (!strcmp(a,"--version"))              { print_version(); exit(0); }

        if (!strcmp(a,"--spec")||!strcmp(a,"--phon-spec")) {
            NEED_VAL(a);
            if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
            st->mode=MODE_SPEC; strncpy(st->input_filename,argv[++i],511);
            mode_set=1; continue;
        }
        if (!strcmp(a,"--phoneme")) {
            NEED_VAL(a);
            if(mode_set&&st->mode!=MODE_PHONEME){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
            st->mode=MODE_PHONEME; strncpy(st->input_filename,argv[++i],511);
            mode_set=1; continue;
        }
        if (!strcmp(a,"--text")) {
            NEED_VAL(a);
            /* Text-to-phoneme mode: convert text directly to phonemes and synthesize */
            if(mode_set&&st->mode!=MODE_PHONEME){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
            st->mode=MODE_PHONEME;
            /* Store text in input_filename temporarily, will be converted */
            strncpy(st->input_filename, argv[++i], 511);
            mode_set=1; continue;
        }
        if (!strcmp(a,"--rules")) {
            NEED_VAL(a);
            /* Custom rules file for text-to-phoneme */
            strncpy(st->rules_filename, argv[++i], 511);
            continue;
        }
        if (!strcmp(a,"--demo")) {
            NEED_VAL(a);
            if(mode_set&&st->mode!=MODE_DEMO){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
            st->mode=MODE_DEMO;
            const char *vt=argv[++i];
            strncpy(st->demo_voice,vt,31);
            if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
            else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
            else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
            else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
            mode_set=1; continue;
        }

        if (!strcmp(a,"--sample-rate")){
            NEED_VAL(a); st->sample_rate=atoi(argv[++i]);
            if(!valid_sr(st->sample_rate)){fprintf(stderr,"Error: invalid sample rate %d\n",st->sample_rate);return -1;}
            continue;
        }
        if (!strcmp(a,"--duration")){
            NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
        }
        if (!strcmp(a,"--f0")){
            NEED_VAL(a); st->f0_hz=(float)atof(argv[++i]); explicit_f0=1; continue;
        }
        if (!strcmp(a,"--synthesis")){
            NEED_VAL(a); const char *m=argv[++i];
            if(!strcasecmp(m,"cascade"))       st->filter_mode=FILTER_CASCADE;
            else if(!strcasecmp(m,"parallel")) st->filter_mode=FILTER_PARALLEL;
            else{fprintf(stderr,"Error: unknown synthesis mode '%s'\n",m);return -1;}
            continue;
        }
        if (!strcmp(a,"--amplitude")){
            NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
        }

        if (!strcmp(a,"--voice")){
            NEED_VAL(a); const char *vt=argv[++i];
            if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
            else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
            else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
            else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
            continue;
        }
        if (!strcmp(a,"--voicing-amp")){
            NEED_VAL(a); st->voicing_amp=clampf((float)atof(argv[++i]),0.f,1.f);
            explicit_voicing=1; continue;
        }
        if (!strcmp(a,"--aspiration-amp")){
            NEED_VAL(a); st->aspiration_amp=clampf((float)atof(argv[++i]),0.f,1.f);
            explicit_asp=1; continue;
        }
        if (!strcmp(a,"--frication-amp")){
            NEED_VAL(a); st->frication_amp=clampf((float)atof(argv[++i]),0.f,1.f);
            explicit_fric=1; continue;
        }

        if (!strcmp(a,"--vibrato-depth")){
            NEED_VAL(a); st->vibrato_depth_hz=clampf((float)atof(argv[++i]),0.f,10.f);
            explicit_vibdepth=1; continue;
        }
        if (!strcmp(a,"--vibrato-rate")){
            NEED_VAL(a); st->vibrato_rate_hz=clampf((float)atof(argv[++i]),0.5f,20.f);
            explicit_vibrate=1; continue;
        }
        if (!strcmp(a,"--jitter")){
            NEED_VAL(a); st->jitter_percent=clampf((float)atof(argv[++i]),0.f,10.f);
            explicit_jitter=1; continue;
        }
        if (!strcmp(a,"--shimmer")){
            NEED_VAL(a); st->shimmer_percent=clampf((float)atof(argv[++i]),0.f,10.f);
            explicit_shimmer=1; continue;
        }
        if (!strcmp(a,"--pitch-contour")){
            NEED_VAL(a);
            if(contour_parse(argv[++i],&st->pitch_contour,&st->n_contour)<0) return -1;
            continue;
        }

        {
            int fi;
            if ((fi=match_fi_arg(a,"--f"))  > 0){
                NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
                explicit_formant[fi-1]=1; continue;
            }
            if ((fi=match_fi_arg(a,"--bw")) > 0){
                NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
                explicit_bw[fi-1]=1; continue;
            }
            if ((fi=match_fi_arg(a,"--gain")) > 0){
                NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
            }
        }
        if (!strcmp(a,"--bw6-10")){
            NEED_VAL(a); float bw=(float)atof(argv[++i]);
            for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
            continue;
        }

        if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }

        if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
        if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
        if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }

        if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }

        if (!strcmp(a,"--output-format")){
            NEED_VAL(a); const char *f=argv[++i];
            if(!strcasecmp(f,"wav16"))  st->output_format=FMT_WAV16;
            else if(!strcasecmp(f,"wav32")) st->output_format=FMT_WAV32;
            else if(!strcasecmp(f,"raw16")) st->output_format=FMT_RAW16;
            else if(!strcasecmp(f,"raw32")) st->output_format=FMT_RAW32;
            else{fprintf(stderr,"Error: unknown output format '%s'\n",f);return -1;}
            continue;
        }
        if (!strcmp(a,"--normalize"))        { st->normalize_output=1;      continue; }
        if (!strcmp(a,"--no-normalize"))     { st->normalize_output=0;      continue; }
        if (!strcmp(a,"--no-lip-radiation")) { st->lip_radiation_enabled=0; continue; }
        if (!strcmp(a,"--verbose"))          { st->verbose=1;               continue; }

        if (a[0] != '-') {
            strncpy(st->output_filename, a, 511); continue;
        }

        fprintf(stderr,"Warning: unknown argument '%s' (ignored)\n", a);
        #undef NEED_VAL
    }

    if (mode_set || st->voice_type != VOICE_NATURAL) {
        const VoicePreset *vp = &g_preset_natural;
        if (st->voice_type == VOICE_WHISPER)   vp = &g_preset_whisper;
        if (st->voice_type == VOICE_IMPULSIVE) vp = &g_preset_impulsive;
        apply_preset(st, vp);
        for(int k=0;k<FORMANTS;k++){
            if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
            if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
        }
        if(!explicit_voicing)  st->voicing_amp      = vp->voicing_amp;
        if(!explicit_asp)      st->aspiration_amp   = vp->aspiration_amp;
        if(!explicit_fric)     st->frication_amp    = vp->frication_amp;
        if(!explicit_f0)       st->f0_hz            = vp->f0;
        if(!explicit_vibdepth) st->vibrato_depth_hz = vp->vibrato_depth;
        if(!explicit_vibrate)  st->vibrato_rate_hz  = vp->vibrato_rate;
        if(!explicit_jitter)   st->jitter_percent   = vp->jitter_pct;
        if(!explicit_shimmer)  st->shimmer_percent  = vp->shimmer_pct;
    }

    return 0;
}


static void verbose_print(const SynthState *st)
{
    printf("Poor Man's Synthesizer v%s version format %s\n", VERSION_STR, VERSION_FMT);
    printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
    printf("Filters   : %s\n", st->filter_mode==FILTER_CASCADE?"cascade":"parallel");
    printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
                               st->voice_type==VOICE_WHISPER?"whisper":"impulsive");
    printf("Sample-rt : %d Hz\n", st->sample_rate);
    printf("Duration  : %.2f s\n", st->duration_sec);
    printf("F0        : %.1f Hz\n", st->f0_hz);
    printf("Voicing   : %.2f   Asp: %.2f   Fric: %.2f\n",
           st->voicing_amp, st->aspiration_amp, st->frication_amp);
    printf("Vibrato   : %.1f Hz depth @ %.1f Hz rate\n",
           st->vibrato_depth_hz, st->vibrato_rate_hz);
    printf("Jitter    : %.1f%%  Shimmer: %.1f%%\n",
           st->jitter_percent, st->shimmer_percent);
    printf("Formants  :\n");
    for(int k=0;k<FORMANTS;k++)
        printf("  F%2d : %6.0f Hz  BW %4.0f Hz  Gain %.2f\n",
               k+1, st->formants[k].freq, st->formants[k].bw, st->formant_gains[k]);
    printf("Output    : %s\n", st->output_filename);
    printf("===================================\n");
}


int main(int argc, char **argv)
{
    SynthState st;
    memset(&st, 0, sizeof(st));

    st.mode                  = MODE_DEMO;
    st.filter_mode           = FILTER_CASCADE;
    st.voice_type            = VOICE_NATURAL;
    st.sample_rate           = 22050;
    st.duration_sec          = 2.0f;
    st.f0_hz                 = 120.0f;
    st.output_amplitude      = 0.8f;
    st.voicing_amp           = 0.70f;
    st.aspiration_amp        = 0.25f;
    st.frication_amp         = 0.00f;
    st.vibrato_depth_hz      = 0.0f;
    st.vibrato_rate_hz       = 5.0f;
    st.jitter_percent        = 1.0f;
    st.shimmer_percent       = 2.0f;
    st.aspiration_cutoff     = 500.0f;
    st.frication_center      = 4000.0f;
    st.frication_bandwidth   = 2000.0f;
    st.normalize_output      = 1;
    st.lip_radiation_enabled = 1;
    st.output_format         = FMT_WAV16;
    strcpy(st.output_filename, "output.wav");

    float def_f[] = {700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
    float def_b[] = {110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
    for(int k=0;k<FORMANTS;k++){
        st.formants[k].freq = def_f[k];
        st.formants[k].bw   = def_b[k];
        st.formants[k].gain = 1.0f;
        st.formant_gains[k] = 1.0f;
    }

    if (argc < 2) { print_help(); return 0; }

    if (parse_args(argc, argv, &st) < 0) return 1;

    if (FORMANTS > MAX_FORMANTS || FORMANTS < 1) {
        fprintf(stderr, "ERROR: FORMANTS (%d) must be between 1 and MAX_FORMANTS (%d)\n", FORMANTS, MAX_FORMANTS);
        return 1;
    }

    for(int k=0;k<FORMANTS;k++){
        if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
        st.formants[k].gain = st.formant_gains[k];
    }

    if (st.mode == MODE_SPEC) {
        if (spec_parse(st.input_filename, &st.spec) < 0) return 1;
        if (st.spec.sample_rate != 22050) st.sample_rate = st.spec.sample_rate;
        if (st.spec.filter_mode != FILTER_CASCADE) st.filter_mode = st.spec.filter_mode;
        float needed = st.spec.duration_ms / 1000.0f + 0.1f;
        if (st.duration_sec < needed) st.duration_sec = needed;
    } else if (st.mode == MODE_PHONEME) {
        /* Check if we have text input (from --text flag) that needs conversion */
        if (strlen(st.rules_filename) > 0 || strlen(st.input_filename) > 0) {
            /* Try to detect if input_filename contains raw text (not a file path) */
            /* For now, assume --text was used if rules_filename is set or input looks like text */
            GraphemeRule rules[MAX_RULES];
            int rule_count;
            
            /* Load rules from custom file, default file, or use built-in defaults */
            if (strlen(st.rules_filename) > 0) {
                rule_count = ttp_load_rules(st.rules_filename, rules, MAX_RULES);
                if (rule_count < 0 && st.verbose) {
                    fprintf(stderr, "Warning: Could not load rules from '%s', using defaults\n", st.rules_filename);
                }
            } else {
                /* Try rules.txt in current directory first */
                rule_count = ttp_load_rules("rules.txt", rules, MAX_RULES);
                if (rule_count < 0) {
                    /* Use built-in defaults */
                    if (MAX_RULES < g_default_rules_count) {
                        fprintf(stderr, "Error: MAX_RULES too small for default rules\n");
                        return 1;
                    }
                    memcpy(rules, g_default_rules, sizeof(GraphemeRule) * g_default_rules_count);
                    rule_count = g_default_rules_count;
                }
            }
            
            if (rule_count <= 0) {
                fprintf(stderr, "Error: No rules available for text-to-phoneme conversion\n");
                return 1;
            }
            
            /* Convert text to phonemes */
            char phoneme_output[MAX_PHONEMES * 4];
            int plen = ttp_text_to_phonemes(st.input_filename, phoneme_output, 
                                            sizeof(phoneme_output), rules, rule_count);
            
            if (plen <= 0) {
                fprintf(stderr, "Error: Text-to-phoneme conversion produced no output\n");
                return 1;
            }
            
            if (st.verbose) {
                printf("Text: %s\n", st.input_filename);
                printf("Phonemes: %s\n", phoneme_output);
            }
            
            /* Now create a temporary phoneme file or parse directly */
            /* For simplicity, write to a temp buffer and modify parsing */
            strncpy(st.ttp_text_input, phoneme_output, sizeof(st.ttp_text_input) - 1);
            st.ttp_text_input[sizeof(st.ttp_text_input) - 1] = '\0';
        }
        
        if (phoneme_parse(st.input_filename, &st.phon) < 0) return 1;
        if (st.phon.sample_rate != 22050) st.sample_rate = st.phon.sample_rate;
        if (st.phon.filter_mode != FILTER_CASCADE) st.filter_mode = st.phon.filter_mode;
    }

    if (st.verbose) verbose_print(&st);

    if (st.verbose) printf("Synthesising...\n");
    g_noise_state = (uint32_t)time(NULL) ^ 0xDEADC0DEu;

    float *samples  = NULL;
    int    nsamples = 0;
    if (synthesize(&st, &samples, &nsamples) < 0) {
        fprintf(stderr,"Error: synthesis failed\n"); return 1;
    }
    if (st.verbose)
        printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);

    int ret = 0;
    switch(st.output_format){
        case FMT_WAV16: ret=wav16_write(st.output_filename,samples,nsamples,st.sample_rate); break;
        case FMT_WAV32: ret=wav32_write(st.output_filename,samples,nsamples,st.sample_rate); break;
        case FMT_RAW16: ret=raw16_write(st.output_filename,samples,nsamples); break;
        case FMT_RAW32: ret=raw32_write(st.output_filename,samples,nsamples); break;
    }
    if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
    if (st.verbose) printf("Output written to '%s'\n", st.output_filename);

    free(samples);
    free(st.spec.frames);
    free(st.phon.phonemes);
    free(st.pitch_contour);
    return 0;
}
