# Simple M-GS (Multi-Glottal Synthesizer)

A very small program that makes computer sounds. It reads text files and writes WAV files. That's it.

## Features

*   Reads ASCII text.
*   Writes 16-bit or 32-bit audio.
*   Has a few knobs for pitch.
*   Written in C. No dependencies.

## Specifications

| Parameter | Value |
| :--- | :--- |
| **Input** | Text file |
| **Output** | `.wav` or `.raw` |
| **Sample Rate** | 22050 Hz (usually) |
| **Voice Types** | 3 presets |
| **Code Size** | One file |
| **Complexity** | Low |

## Usage

Compile it with whatever C compiler you have:

```bash
gcc mg1.c -o mgs -lm
```

Run it in "demo" mode to hear a default voice:

```bash
./mgs --demo natural output.wav
```

Type `./mgs --help` to see the list of basic flags.

---

## Advanced Phoneme Synthesis (The Nerd Stuff)

Okay, the "simple" description above is technically true, but if you want to actually **specify speech** instead of just... AAAAA, you need to use the **Phoneme Mode** or the **Phoneme specification mode**, or (I swear this the last one) **Specification Frames Mode**. 

### How to Create a Voice

You don't just type English sentences. You create a **Phoneme Specification File** (e.g., `hello.txt`). This gives you sample-accurate control over the vocal tract.

#### 1. The Phoneme File Format

Create a file called `speech.txt`.

```text
sil 100
h 100
e 100
l 100
o 100
w 100
sil 100
# For "HELLO"
e 100
v 100
er 50
y 100
w 100
a 200
n 50
sil 100
# For "EVERYONE"
```

**Key Syntax Details:**
*   **Phoneme Name**: Use standard ARPABET-like keys (`ae`, `ih`, `sh`, `dh`, etc.). See the source code `g_phoneme_db` for the full list of 40+ supported sounds.
*   **Duration**: Time in milliseconds.

#### 2. Running the Synthesizer

Once your script is ready, run the engine in phoneme mode using the `--phoneme` flag:

```bash
# Generate speech from your script
./mgs --phoneme speech.txt output.wav

# Customize the voice character
./mgs --phoneme speech.txt --voice breathy --f0 90 --jitter 2.0 --shimmer 3.0 output.wav

# High fidelity output
./mgs --phoneme speech.txt --sample-rate 44100 --output-format wav32 output.wav
```

#### 3. Understanding the Engine Parameters

When using phoneme mode, these flags change how the physics are simulated:

*   `--voice TYPE`: Selects the glottal wave shape.
    *   `natural`: Standard triangular-ish pulse.
    *   `breathy`: Adds significant white noise to the glottal pulse (simulates air leakage).
    *   `impulsive`: Sharp, click-like pulses (good for robotic effects).
*   `--synthesis MODE`: Choose how formant filters are arranged.
    *   `cascade` (Default): Formants are in series. More natural for vowels, standard Klatt model.
    *   `parallel`: Formants are mixed independently. Better for nasal sounds and fricatives, but doesn't sound as good.
*   `--no-lip-radiation`: Disables the high-pass filter that simulates sound radiation from the lips. Turns the voice into a muffled, internal sound.

## Examples

Check out the `examples/` directory to hear the difference between the voice types:

*   [`examples/example_natural.wav`](examples/example_natural.wav) - Standard, clear voice.
*   [`examples/example_breathy.wav`](examples/example_breathy.wav) - Soft, airy voice with added noise.
*   [`examples/example_impulsive.wav`](examples/example_impulsive.wav) - Robotic, sharp, clicky voice.

## License

MIT License. Do whatever you want with it. Just credit me if you can, though it's not required.
