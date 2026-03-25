	.file	"pms.c"
 # GNU C23 (x86_64-posix-seh-rev0, Built by MinGW-Builds project) version 15.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 15.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.27-GMP

 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -mtune=core2 -march=nocona -O3
	.text
	.p2align 4
	.def	nxtok;	.scl	3;	.type	32;	.endef
	.seh_proc	nxtok
nxtok:
	.seh_endprologue
 # pms.c:486:     char *q = *p;
	movq	(%rcx), %rdx	 # *p_18(D), <retval>
 # pms.c:487:     while (*q==' '||*q=='\t') q++;
	movzbl	(%rdx), %eax	 #* <retval>, _20
 # pms.c:487:     while (*q==' '||*q=='\t') q++;
	cmpb	$32, %al	 #, _20
	jne	.L32	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L25:
 # pms.c:487:     while (*q==' '||*q=='\t') q++;
	movzbl	1(%rdx), %eax	 #, _20
 # pms.c:487:     while (*q==' '||*q=='\t') q++;
	addq	$1, %rdx	 #, <retval>
 # pms.c:487:     while (*q==' '||*q=='\t') q++;
	cmpb	$32, %al	 #, _20
	je	.L25	 #,
.L32:
	cmpb	$9, %al	 #, _20
	je	.L25	 #,
	cmpb	$35, %al	 #, _20
	ja	.L5	 #,
	movabsq	$34359747585, %r8	 #, tmp124
	btq	%rax, %r8	 # _20, tmp124
	jc	.L12	 #,
.L5:
 # pms.c:490:     while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
	testb	$-33, %al	 #, _20
	movq	%rdx, %r8	 # <retval>, q
	je	.L6	 #,
.L7:
	cmpb	$10, %al	 #, _20
	je	.L10	 #,
	cmpb	$13, %al	 #, _20
	je	.L10	 #,
	cmpb	$9, %al	 #, _20
	je	.L10	 #,
 # pms.c:490:     while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
	movzbl	1(%r8), %eax	 # MEM[(char *)q_22], _20
 # pms.c:490:     while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
	addq	$1, %r8	 #, q
 # pms.c:490:     while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
	testb	$-33, %al	 #, _20
	jne	.L7	 #,
 # pms.c:491:     if (*q){*q='\0';q++;}
	testb	%al, %al	 # _20
	jne	.L10	 #,
.L6:
 # pms.c:494: }
	movq	%rdx, %rax	 # <retval>,
 # pms.c:488:     if (!*q||*q=='\n'||*q=='\r'||*q=='#'){*p=q;return NULL;}
	movq	%r8, (%rcx)	 # q, *p_18(D)
 # pms.c:494: }
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
 # pms.c:491:     if (*q){*q='\0';q++;}
	movb	$0, (%r8)	 #, *q_39
 # pms.c:494: }
	movq	%rdx, %rax	 # <retval>,
 # pms.c:491:     if (*q){*q='\0';q++;}
	addq	$1, %r8	 #, q
 # pms.c:488:     if (!*q||*q=='\n'||*q=='\r'||*q=='#'){*p=q;return NULL;}
	movq	%r8, (%rcx)	 # q, *p_18(D)
 # pms.c:494: }
	ret	
	.p2align 4,,10
	.p2align 3
.L12:
 # pms.c:490:     while (*q&&*q!=' '&&*q!='\t'&&*q!='\n'&&*q!='\r') q++;
	movq	%rdx, %r8	 # <retval>, q
	xorl	%edx, %edx	 # <retval>
 # pms.c:494: }
	movq	%rdx, %rax	 # <retval>,
 # pms.c:488:     if (!*q||*q=='\n'||*q=='\r'||*q=='#'){*p=q;return NULL;}
	movq	%r8, (%rcx)	 # q, *p_18(D)
 # pms.c:494: }
	ret	
	.seh_endproc
	.p2align 4
	.def	phon_pitch;	.scl	3;	.type	32;	.endef
	.seh_proc	phon_pitch
phon_pitch:
	.seh_endprologue
 # pms.c:766:     if (ph->n_pitch == 0) return 120.0f;
	movl	276(%rcx), %edx	 # ph_26(D)->n_pitch, _1
 # pms.c:766:     if (ph->n_pitch == 0) return 120.0f;
	testl	%edx, %edx	 # _1
	je	.L45	 #,
 # pms.c:767:     float dur = ph->duration_ms > 0 ? ph->duration_ms : 1.0f;
	movss	16(%rcx), %xmm0	 # ph_26(D)->duration_ms, _2
 # pms.c:767:     float dur = ph->duration_ms > 0 ? ph->duration_ms : 1.0f;
	pxor	%xmm2, %xmm2	 # tmp131
	comiss	%xmm2, %xmm0	 # tmp131, _2
	jbe	.L36	 #,
 # pms.c:768:     float pct = t_within_ms / dur * 100.0f;
	divss	%xmm0, %xmm1	 # _2, t_within_ms
.L36:
 # pms.c:768:     float pct = t_within_ms / dur * 100.0f;
	mulss	.LC2(%rip), %xmm1	 #, pct
 # pms.c:771:     if (pct <= pts[0].time_percent) return pts[0].f0_hz;
	movss	20(%rcx), %xmm0	 # MEM[(const struct PitchPoint *)ph_26(D) + 20B].time_percent, MEM[(const struct PitchPoint *)ph_26(D) + 20B].time_percent
	comiss	%xmm1, %xmm0	 # pct, MEM[(const struct PitchPoint *)ph_26(D) + 20B].time_percent
	jnb	.L52	 #,
 # pms.c:769:     const PitchPoint *pts = ph->pitch_points;
	leaq	20(%rcx), %rax	 #, pts_29
 # pms.c:772:     if (pct >= pts[np-1].time_percent) return pts[np-1].f0_hz;
	movslq	%edx, %r8	 # _1, _5
	leaq	12(%rcx,%r8,8), %r8	 #, _7
 # pms.c:772:     if (pct >= pts[np-1].time_percent) return pts[np-1].f0_hz;
	comiss	(%r8), %xmm1	 # _7->time_percent, pct
	jnb	.L40	 #,
 # pms.c:773:     for (int i=0;i<np-1;i++){
	cmpl	$1, %edx	 #, _1
	jle	.L40	 #,
	subl	$2, %edx	 #, _59
	leaq	28(%rcx,%rdx,8), %rdx	 #, _48
	.p2align 4,,10
	.p2align 3
.L44:
 # pms.c:774:         if (pct>=pts[i].time_percent && pct<=pts[i+1].time_percent){
	movss	(%rax), %xmm2	 # MEM[(float *)_11], _12
 # pms.c:774:         if (pct>=pts[i].time_percent && pct<=pts[i+1].time_percent){
	comiss	%xmm2, %xmm1	 # _12, pct
	jb	.L41	 #,
 # pms.c:774:         if (pct>=pts[i].time_percent && pct<=pts[i+1].time_percent){
	movss	8(%rax), %xmm3	 # MEM[(float *)_11 + 8B], _16
 # pms.c:774:         if (pct>=pts[i].time_percent && pct<=pts[i+1].time_percent){
	comiss	%xmm1, %xmm3	 # pct, _16
	jnb	.L53	 #,
.L41:
 # pms.c:773:     for (int i=0;i<np-1;i++){
	addq	$8, %rax	 #, ivtmp.137
	cmpq	%rax, %rdx	 # ivtmp.137, _48
	jne	.L44	 #,
.L40:
 # pms.c:779:     return pts[np-1].f0_hz;
	movss	4(%r8), %xmm0	 # _7->f0_hz, <retval>
 # pms.c:780: }
	ret	
	.p2align 4,,10
	.p2align 3
.L52:
 # pms.c:771:     if (pct <= pts[0].time_percent) return pts[0].f0_hz;
	movss	24(%rcx), %xmm0	 # MEM[(const struct PitchPoint *)ph_26(D) + 20B].f0_hz, <retval>
 # pms.c:780: }
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
 # pms.c:766:     if (ph->n_pitch == 0) return 120.0f;
	movss	.LC0(%rip), %xmm0	 #, <retval>
 # pms.c:780: }
	ret	
	.p2align 4,,10
	.p2align 3
.L53:
 # pms.c:775:             float a=(pct-pts[i].time_percent)/(pts[i+1].time_percent-pts[i].time_percent);
	movaps	%xmm1, %xmm0	 # pct, pct
 # pms.c:775:             float a=(pct-pts[i].time_percent)/(pts[i+1].time_percent-pts[i].time_percent);
	subss	%xmm2, %xmm3	 # _12, _18
 # pms.c:776:             return lerpf(pts[i].f0_hz, pts[i+1].f0_hz, a);
	movss	4(%rax), %xmm4	 # _11->f0_hz, _20
 # pms.c:775:             float a=(pct-pts[i].time_percent)/(pts[i+1].time_percent-pts[i].time_percent);
	subss	%xmm2, %xmm0	 # _12, pct
 # pms.c:161:     { return a + (b - a) * t; }
	movss	12(%rax), %xmm1	 # _15->f0_hz, _15->f0_hz
	subss	%xmm4, %xmm1	 # _20, _32
 # pms.c:775:             float a=(pct-pts[i].time_percent)/(pts[i+1].time_percent-pts[i].time_percent);
	divss	%xmm3, %xmm0	 # _18, a_31
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _32, _36
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # _20, <retval>
 # pms.c:780: }
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Klatt-Style Formant Speech Synthesizer\12\0"
	.align 8
.LC4:
	.ascii "Usage: pms [OPTIONS] [OUTPUT_FILE]\12\0"
	.align 8
.LC5:
	.ascii "Mode Selection (mutually exclusive):\0"
	.align 8
.LC6:
	.ascii "  --spec FILE              Load specification frames from file\0"
	.align 8
.LC7:
	.ascii "  --phon-spec FILE         Load detailed phoneme specifications from file\0"
	.align 8
.LC8:
	.ascii "  --phoneme FILE           Load simple phoneme sequence from file\0"
	.align 8
.LC9:
	.ascii "  --demo VOICE_TYPE        Demo mode (natural|whisper|impulsive)\12\0"
.LC10:
	.ascii "Global Parameters:\0"
	.align 8
.LC11:
	.ascii "  --sample-rate SR         Sample rate (16000|22050|44100|48000|88200|96000|176400|192000, default: 22050)\0"
	.align 8
.LC12:
	.ascii "  --duration SEC           Duration in seconds (default: 2.0)\0"
	.align 8
.LC13:
	.ascii "  --f0 HZ                  Fundamental frequency (default: 120)\0"
	.align 8
.LC14:
	.ascii "  --synthesis MODE         Synthesis mode (cascade|parallel, default: cascade)\0"
	.align 8
.LC15:
	.ascii "  --amplitude LEVEL        Output amplitude 0.0-1.0 (default: 0.8)\0"
	.align 8
.LC16:
	.ascii "  --formants INT           Amount of formants to use, 1-%d\12\12\0"
.LC17:
	.ascii "Voice Parameters:\0"
	.align 8
.LC18:
	.ascii "  --voice TYPE             Voice type (natural|whisper|impulsive)\0"
	.align 8
.LC19:
	.ascii "  --voicing-amp AMP        Voicing amplitude (default: 0.7)\0"
	.align 8
.LC20:
	.ascii "  --aspiration-amp AMP     Aspiration amplitude (default: 0.3)\0"
	.align 8
.LC21:
	.ascii "  --frication-amp AMP      Frication amplitude (default: 0.0)\12\0"
.LC22:
	.ascii "Pitch Control:\0"
	.align 8
.LC23:
	.ascii "  --vibrato-depth HZ       Vibrato depth (default: 0.0)\0"
	.align 8
.LC24:
	.ascii "  --vibrato-rate HZ        Vibrato rate (default: 5.0)\0"
	.align 8
.LC25:
	.ascii "  --jitter PERCENT         Pitch jitter (default: 1.0)\0"
	.align 8
.LC26:
	.ascii "  --shimmer PERCENT        Amplitude shimmer (default: 2.0)\0"
	.align 8
.LC27:
	.ascii "  --pitch-contour FILE     Load F0 contour from file (time_ms f0_hz per line)\12\0"
	.align 8
.LC28:
	.ascii "Formant Parameters (demo mode only):\0"
	.align 8
.LC29:
	.ascii "  --f1-10 HZ               Formant 1-10 frequencies\0"
	.align 8
.LC30:
	.ascii "  --bw1-10 HZ              Formant 1-10 bandwidths\0"
	.align 8
.LC31:
	.ascii "  --bw6-10 HZ              Set bandwidths 6-10 to same value\12\0"
.LC32:
	.ascii "Aspiration / Frication:\0"
	.align 8
.LC33:
	.ascii "  --aspiration-cutoff HZ   High-pass cutoff for aspiration noise (default: 500)\0"
	.align 8
.LC34:
	.ascii "  --frication-center HZ    Centre frequency of frication noise (default: 4000)\0"
	.align 8
.LC35:
	.ascii "  --frication-bandwidth HZ Bandwidth of frication noise (default: 2000)\12\0"
.LC36:
	.ascii "Output Options:\0"
	.align 8
.LC37:
	.ascii "  --output FILE            Output filename (default: output.wav)\0"
	.align 8
.LC38:
	.ascii "  --output-format FORMAT   wav16|wav32|raw16|raw32 (default: wav16)\0"
	.align 8
.LC39:
	.ascii "  --normalize              Enable loudness normalization (default: enabled)\0"
	.align 8
.LC40:
	.ascii "  --no-lip-radiation       Disable lip radiation filter\0"
	.align 8
.LC41:
	.ascii "  --verbose                Print debug information\0"
	.align 8
.LC42:
	.ascii "  --help                   Display this help message\0"
	.text
	.p2align 4
	.def	print_help;	.scl	3;	.type	32;	.endef
	.seh_proc	print_help
print_help:
	subq	$40, %rsp	 #,
	.seh_stackalloc	40
	.seh_endprologue
 # pms.c:1085:     puts("Klatt-Style Formant Speech Synthesizer\n");
	leaq	.LC3(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1086:     puts("Usage: pms [OPTIONS] [OUTPUT_FILE]\n");
	leaq	.LC4(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1087:     puts("Mode Selection (mutually exclusive):");
	leaq	.LC5(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1088:     puts("  --spec FILE              Load specification frames from file");
	leaq	.LC6(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1089:     puts("  --phon-spec FILE         Load detailed phoneme specifications from file");
	leaq	.LC7(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1090:     puts("  --phoneme FILE           Load simple phoneme sequence from file");
	leaq	.LC8(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1091:     puts("  --demo VOICE_TYPE        Demo mode (natural|whisper|impulsive)\n");
	leaq	.LC9(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1092:     puts("Global Parameters:");
	leaq	.LC10(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1093:     puts("  --sample-rate SR         Sample rate (16000|22050|44100|48000|88200|96000|176400|192000, default: 22050)");
	leaq	.LC11(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1094:     puts("  --duration SEC           Duration in seconds (default: 2.0)");
	leaq	.LC12(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1095:     puts("  --f0 HZ                  Fundamental frequency (default: 120)");
	leaq	.LC13(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1096:     puts("  --synthesis MODE         Synthesis mode (cascade|parallel, default: cascade)");
	leaq	.LC14(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1097:     puts("  --amplitude LEVEL        Output amplitude 0.0-1.0 (default: 0.8)");
	leaq	.LC15(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1098:     printf("  --formants INT           Amount of formants to use, 1-%d\n\n", MAX_FORMANTS);
	movl	$10, %edx	 #,
	leaq	.LC16(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1099:     puts("Voice Parameters:");
	leaq	.LC17(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1100:     puts("  --voice TYPE             Voice type (natural|whisper|impulsive)");
	leaq	.LC18(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1101:     puts("  --voicing-amp AMP        Voicing amplitude (default: 0.7)");
	leaq	.LC19(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1102:     puts("  --aspiration-amp AMP     Aspiration amplitude (default: 0.3)");
	leaq	.LC20(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1103:     puts("  --frication-amp AMP      Frication amplitude (default: 0.0)\n");
	leaq	.LC21(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1104:     puts("Pitch Control:");
	leaq	.LC22(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1105:     puts("  --vibrato-depth HZ       Vibrato depth (default: 0.0)");
	leaq	.LC23(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1106:     puts("  --vibrato-rate HZ        Vibrato rate (default: 5.0)");
	leaq	.LC24(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1107:     puts("  --jitter PERCENT         Pitch jitter (default: 1.0)");
	leaq	.LC25(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1108:     puts("  --shimmer PERCENT        Amplitude shimmer (default: 2.0)");
	leaq	.LC26(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1109:     puts("  --pitch-contour FILE     Load F0 contour from file (time_ms f0_hz per line)\n");
	leaq	.LC27(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1110:     puts("Formant Parameters (demo mode only):");
	leaq	.LC28(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1111:     puts("  --f1-10 HZ               Formant 1-10 frequencies");
	leaq	.LC29(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1112:     puts("  --bw1-10 HZ              Formant 1-10 bandwidths");
	leaq	.LC30(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1113:     puts("  --bw6-10 HZ              Set bandwidths 6-10 to same value\n");
	leaq	.LC31(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1114:     puts("Aspiration / Frication:");
	leaq	.LC32(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1115:     puts("  --aspiration-cutoff HZ   High-pass cutoff for aspiration noise (default: 500)");
	leaq	.LC33(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1116:     puts("  --frication-center HZ    Centre frequency of frication noise (default: 4000)");
	leaq	.LC34(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1117:     puts("  --frication-bandwidth HZ Bandwidth of frication noise (default: 2000)\n");
	leaq	.LC35(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1118:     puts("Output Options:");
	leaq	.LC36(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1119:     puts("  --output FILE            Output filename (default: output.wav)");
	leaq	.LC37(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1120:     puts("  --output-format FORMAT   wav16|wav32|raw16|raw32 (default: wav16)");
	leaq	.LC38(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1121:     puts("  --normalize              Enable loudness normalization (default: enabled)");
	leaq	.LC39(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1122:     puts("  --no-lip-radiation       Disable lip radiation filter");
	leaq	.LC40(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1123:     puts("  --verbose                Print debug information");
	leaq	.LC41(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1124:     puts("  --help                   Display this help message");
	leaq	.LC42(%rip), %rcx	 #,
 # pms.c:1125: }
	addq	$40, %rsp	 #,
 # pms.c:1124:     puts("  --help                   Display this help message");
	jmp	puts	 #
	.seh_endproc
	.p2align 4
	.def	match_fi_arg;	.scl	3;	.type	32;	.endef
	.seh_proc	match_fi_arg
match_fi_arg:
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$56, %rsp	 #,
	.seh_stackalloc	56
	.seh_endprologue
 # pms.c:1156: {
	movq	%rcx, %rbx	 # arg, arg
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	movq	%rdx, %rcx	 # prefix,
	movq	%rdx, 40(%rsp)	 # prefix, %sfp
	call	strlen	 #
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	movq	40(%rsp), %rdx	 # %sfp, prefix
	movq	%rbx, %rcx	 # arg,
	movq	%rax, %r8	 # tmp116,
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	movq	%rax, %rsi	 #, tmp116
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	call	strncmp	 #
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	testl	%eax, %eax	 # _2
	jne	.L58	 #,
 # pms.c:1158:     const char *p = arg + strlen(prefix);
	leaq	(%rbx,%rsi), %rcx	 #, p
 # pms.c:1159:     if (!*p || !isdigit((unsigned char)*p)) return 0;
	movzbl	(%rcx), %eax	 # *p_13, tmp120
	subl	$48, %eax	 #, _6
 # pms.c:1159:     if (!*p || !isdigit((unsigned char)*p)) return 0;
	cmpb	$9, %al	 #, _6
	jbe	.L59	 #,
.L58:
 # pms.c:1157:     if (strncmp(arg, prefix, strlen(prefix)) != 0) return 0;
	xorl	%eax, %eax	 # <retval>
.L55:
 # pms.c:1162: }
	addq	$56, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	ret	
	.p2align 4,,10
	.p2align 3
.L59:
 # pms.c:1160:     int fi = atoi(p);
	call	atoi	 #
 # pms.c:1161:     return (fi>=1 && fi<=FORMANTS) ? fi : 0;
	testl	%eax, %eax	 # <retval>
	jle	.L58	 #,
 # pms.c:1161:     return (fi>=1 && fi<=FORMANTS) ? fi : 0;
	cmpl	%eax, FORMANTS(%rip)	 # <retval>, FORMANTS
	jl	.L58	 #,
	jmp	.L55	 #
	.seh_endproc
	.section .rdata,"dr"
.LC44:
	.ascii "r\0"
	.align 8
.LC45:
	.ascii "Error: cannot open spec '%s': %s\12\0"
.LC47:
	.ascii "SAMPLE_RATE\0"
.LC48:
	.ascii "SYNTHESIS_MODE\0"
.LC49:
	.ascii "parallel\0"
.LC50:
	.ascii "DURATION\0"
.LC52:
	.ascii "NORMALIZE\0"
.LC53:
	.ascii "LIP_RADIATION\0"
	.align 8
.LC54:
	.ascii "Warning: spec file too many frames; truncating at %d\12\0"
.LC56:
	.ascii "Warning: line %d incomplete\12\0"
	.align 8
.LC57:
	.ascii "Warning: line %d: incomplete formant columns\12\0"
	.align 8
.LC59:
	.ascii "Error: no valid frames in spec file '%s'\12\0"
	.text
	.p2align 4
	.def	spec_parse;	.scl	3;	.type	32;	.endef
	.seh_proc	spec_parse
spec_parse:
	pushq	%r15	 #
	.seh_pushreg	%r15
	movl	$8280, %eax	 #,
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp	 #,
	.seh_stackalloc	8280
	movaps	%xmm6, 8256(%rsp)	 #,
	.seh_savexmm	%xmm6, 8256
	.seh_endprologue
 # pms.c:497: {
	movq	%rdx, %r13	 # sd, sd
	movq	%rcx, 8352(%rsp)	 # path, path
 # pms.c:498:     FILE *fp = fopen(path,"r");
	leaq	.LC44(%rip), %rdx	 #,
	call	fopen	 #
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	testq	%rax, %rax	 # fp
 # pms.c:498:     FILE *fp = fopen(path,"r");
	movq	%rax, %r12	 #, fp
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	je	.L142	 #,
 # pms.c:501:     sd->frames   = (SpecFrame*)calloc(MAX_SPEC_FRAMES, sizeof(SpecFrame));
	movl	$148, %edx	 #,
	movl	$8192, %ecx	 #,
	call	calloc	 #
 # pms.c:502:     if (!sd->frames){ fclose(fp); return -1; }
	testq	%rax, %rax	 # tmp367
 # pms.c:501:     sd->frames   = (SpecFrame*)calloc(MAX_SPEC_FRAMES, sizeof(SpecFrame));
	movq	%rax, 0(%r13)	 # tmp367, sd_95(D)->frames
 # pms.c:502:     if (!sd->frames){ fclose(fp); return -1; }
	je	.L143	 #,
 # pms.c:503:     sd->nframes      = 0;
	movq	.LC46(%rip), %rax	 #, tmp224
 # pms.c:505:     sd->filter_mode  = FILTER_CASCADE;
	movq	$0, 16(%r13)	 #, MEM <unsigned long long> [(void *)sd_95(D) + 16B]
 # pms.c:509:     int  lno = 0;
	xorl	%ebx, %ebx	 # lno
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	movq	__imp__strnicmp(%rip), %rbp	 #, tmp356
 # pms.c:503:     sd->nframes      = 0;
	movq	%rax, 8(%r13)	 # tmp224, MEM <vector(2) int> [(int *)sd_95(D) + 8B]
	.p2align 4,,10
	.p2align 3
.L64:
 # pms.c:510:     while (fgets(line, sizeof(line), fp)) {
	leaq	64(%rsp), %rcx	 #,
	movq	%r12, %r8	 # fp,
	movl	$8192, %edx	 #,
	call	fgets	 #
 # pms.c:510:     while (fgets(line, sizeof(line), fp)) {
	testq	%rax, %rax	 # _58
	je	.L79	 #,
 # pms.c:513:         while (*p==' '||*p=='\t') p++;
	movzbl	64(%rsp), %eax	 # MEM[(char *)&line], _103
 # pms.c:512:         char *p = line;
	leaq	64(%rsp), %r15	 #, p
 # pms.c:511:         lno++;
	addl	$1, %ebx	 #, lno
 # pms.c:513:         while (*p==' '||*p=='\t') p++;
	cmpb	$32, %al	 #, _103
	jne	.L141	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L127:
 # pms.c:513:         while (*p==' '||*p=='\t') p++;
	movzbl	1(%r15), %eax	 # MEM[(char *)p_178], _103
 # pms.c:513:         while (*p==' '||*p=='\t') p++;
	addq	$1, %r15	 #, p
 # pms.c:513:         while (*p==' '||*p=='\t') p++;
	cmpb	$32, %al	 #, _103
	je	.L127	 #,
.L141:
	cmpb	$9, %al	 #, _103
	je	.L127	 #,
	cmpb	$35, %al	 #, _103
	ja	.L68	 #,
	movabsq	$34359747585, %rdx	 #, tmp235
	btq	%rax, %rdx	 # _103, tmp235
	jc	.L64	 #,
.L68:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC47(%rip), %rdx	 #,
	movl	$11, %r8d	 #,
	movq	%r15, %rcx	 # p,
	call	*%rbp	 # tmp356
 # pms.c:516:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){
	testl	%eax, %eax	 # _189
	je	.L144	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC48(%rip), %rdx	 #,
	movl	$14, %r8d	 #,
	movq	%r15, %rcx	 # p,
	call	*%rbp	 # tmp356
 # pms.c:519:         if (strncasecmp(p,"SYNTHESIS_MODE",14)==0){
	testl	%eax, %eax	 # _190
	je	.L145	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC50(%rip), %rdx	 #,
	movl	$8, %r8d	 #,
	movq	%r15, %rcx	 # p,
	call	*%rbp	 # tmp356
 # pms.c:524:         if (strncasecmp(p,"DURATION",8)==0){
	testl	%eax, %eax	 # _192
	je	.L146	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC52(%rip), %rdx	 #,
	movl	$9, %r8d	 #,
	movq	%r15, %rcx	 # p,
	call	*%rbp	 # tmp356
 # pms.c:527:         if (strncasecmp(p,"NORMALIZE",9)==0||
	testl	%eax, %eax	 # _193
	je	.L64	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC53(%rip), %rdx	 #,
	movl	$13, %r8d	 #,
	movq	%r15, %rcx	 # p,
	call	*%rbp	 # tmp356
 # pms.c:527:         if (strncasecmp(p,"NORMALIZE",9)==0||
	testl	%eax, %eax	 # _194
	je	.L64	 #,
 # pms.c:530:         if (sd->nframes >= MAX_SPEC_FRAMES){
	movslq	8(%r13), %rax	 # sd_95(D)->nframes,
 # pms.c:530:         if (sd->nframes >= MAX_SPEC_FRAMES){
	cmpl	$8191, %eax	 #, _23
	jg	.L147	 #,
 # pms.c:535:         SpecFrame *fr = &sd->frames[sd->nframes];
	imulq	$148, %rax, %rdx	 #, _26, _27
 # pms.c:535:         SpecFrame *fr = &sd->frames[sd->nframes];
	movq	0(%r13), %r8	 # sd_95(D)->frames, _25
 # pms.c:536:         memset(fr,0,sizeof(*fr));
	xorl	%eax, %eax	 # tmp268
	movl	$37, %ecx	 #, tmp269
 # pms.c:535:         SpecFrame *fr = &sd->frames[sd->nframes];
	leaq	(%r8,%rdx), %r14	 #, fr
 # pms.c:536:         memset(fr,0,sizeof(*fr));
	movq	%r14, %rdi	 # fr, fr
	rep stosl
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	movl	FORMANTS(%rip), %eax	 # FORMANTS, FORMANTS.23_210
	testl	%eax, %eax	 # FORMANTS.23_210
	jle	.L138	 #,
	leal	-1(%rax), %ecx	 #, _195
	cmpl	$2, %ecx	 #, _195
	jbe	.L107	 #,
	movl	%eax, %ecx	 # FORMANTS.23_210, bnd.157_78
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp273
	shrl	$2, %ecx	 #, bnd.157_78
	subl	$1, %ecx	 #, bnd.157_78
	shufps	$0, %xmm0, %xmm0	 # tmp273
	movups	%xmm0, 104(%r8,%rdx)	 # tmp273, MEM <vector(4) float> [(float *)vectp.161_72]
	je	.L82	 #,
	movups	%xmm0, 120(%r8,%rdx)	 # tmp273, MEM <vector(4) float> [(float *)vectp.161_72 + 16B]
.L82:
	testb	$3, %al	 #, FORMANTS.23_210
	je	.L138	 #,
	movl	%eax, %edx	 # FORMANTS.23_210, k
	andl	$-4, %edx	 #, k
.L81:
	movss	.LC43(%rip), %xmm6	 #, _52
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	leal	1(%rdx), %r8d	 #, k_164
	movslq	%edx, %rcx	 # k, _239
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	cmpl	%eax, %r8d	 # FORMANTS.23_210, k_164
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	movss	%xmm6, 104(%r14,%rcx,4)	 # _52, MEM <float> [(struct SpecFrame *)_240 + 104B]
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	jge	.L80	 #,
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	addl	$2, %edx	 #, k_243
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	movss	%xmm6, 108(%r14,%rcx,4)	 # _52, MEM <float> [(struct SpecFrame *)_240 + 108B]
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	cmpl	%edx, %eax	 # k_243, FORMANTS.23_210
	jle	.L80	 #,
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	movss	%xmm6, 112(%r14,%rcx,4)	 # _52, MEM <float> [(struct SpecFrame *)_240 + 112B]
.L80:
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	leaq	56(%rsp), %rdi	 #, tmp343
 # pms.c:538:         fr->gain_mult = 1.0f;
	movss	%xmm6, 100(%r14)	 # _52, fr_104->gain_mult
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:540:         char *ptr = p;
	movq	%r15, 56(%rsp)	 # p, ptr
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	call	nxtok	 #
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L148	 #,
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:548:         for(int k=0;k<FORMANTS&&ok;k++){
	cmpl	$0, FORMANTS(%rip)	 #, FORMANTS
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _30, tmp289
	movss	%xmm0, (%r14)	 # tmp289, fr_104->time_ms
 # pms.c:548:         for(int k=0;k<FORMANTS&&ok;k++){
	jle	.L85	 #,
	xorl	%r15d, %r15d	 # ivtmp.178
	jmp	.L87	 #
	.p2align 4,,10
	.p2align 3
.L149:
 # pms.c:549:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->freq[k]=(float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:550:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:549:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->freq[k]=(float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _32, tmp294
	movss	%xmm0, 4(%r14,%r15,4)	 # tmp294, MEM[(float *)fr_104 + 4B + ivtmp.178_165 * 4]
 # pms.c:550:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
	call	nxtok	 #
 # pms.c:550:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L86	 #,
 # pms.c:550:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:550:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->bw  [k]=(float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _34, tmp299
	movss	%xmm0, 44(%r14,%r15,4)	 # tmp299, MEM[(float *)fr_104 + 44B + ivtmp.178_165 * 4]
 # pms.c:548:         for(int k=0;k<FORMANTS&&ok;k++){
	addq	$1, %r15	 #, ivtmp.178
	cmpl	%r15d, FORMANTS(%rip)	 # ivtmp.178, FORMANTS
	jle	.L85	 #,
.L87:
 # pms.c:549:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->freq[k]=(float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
	call	nxtok	 #
 # pms.c:549:             tok=nxtok(&ptr); if(!tok){ok=0;break;} fr->freq[k]=(float)atof(tok);
	testq	%rax, %rax	 # tok
	jne	.L149	 #,
.L86:
 # pms.c:552:         if(!ok){ fprintf(stderr,"Warning: line %d: incomplete formant columns\n",lno); goto skip; }
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:552:         if(!ok){ fprintf(stderr,"Warning: line %d: incomplete formant columns\n",lno); goto skip; }
	leaq	.LC57(%rip), %rdx	 #,
	movl	%ebx, %r8d	 # lno,
	movq	%rax, %rcx	 # _37,
	call	fprintf	 #
 # pms.c:552:         if(!ok){ fprintf(stderr,"Warning: line %d: incomplete formant columns\n",lno); goto skip; }
	jmp	.L64	 #
	.p2align 4,,10
	.p2align 3
.L144:
 # pms.c:517:             sd->sample_rate = atoi(p+12); continue;
	leaq	12(%r15), %rcx	 #, _12
 # pms.c:517:             sd->sample_rate = atoi(p+12); continue;
	call	atoi	 #
 # pms.c:517:             sd->sample_rate = atoi(p+12); continue;
	movl	%eax, 12(%r13)	 # _13, sd_95(D)->sample_rate
 # pms.c:517:             sd->sample_rate = atoi(p+12); continue;
	jmp	.L64	 #
.L145:
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	movzbl	15(%r15), %eax	 # MEM[(char *)p_217 + 15B], _203
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	leaq	15(%r15), %rcx	 #, v
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	cmpb	$9, %al	 #, _203
	je	.L128	 #,
	cmpb	$32, %al	 #, _203
	jne	.L72	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L128:
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	movzbl	1(%rcx), %eax	 # MEM[(char *)v_174], _172
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	addq	$1, %rcx	 #, v
 # pms.c:520:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	cmpb	$32, %al	 #, _172
	je	.L128	 #,
	cmpb	$9, %al	 #, _172
	je	.L128	 #,
.L72:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC49(%rip), %rdx	 #,
	movl	$8, %r8d	 #,
	call	*%rbp	 # tmp356
 # pms.c:521:             sd->filter_mode = strncasecmp(v,"parallel",8)==0 ? FILTER_PARALLEL : FILTER_CASCADE;
	testl	%eax, %eax	 # _191
	sete	%al	 #, _17
	movzbl	%al, %eax	 # _17, _17
 # pms.c:521:             sd->filter_mode = strncasecmp(v,"parallel",8)==0 ? FILTER_PARALLEL : FILTER_CASCADE;
	movl	%eax, 16(%r13)	 # _17, sd_95(D)->filter_mode
 # pms.c:522:             continue;
	jmp	.L64	 #
.L146:
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	leaq	9(%r15), %rcx	 #, _19
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	call	atof	 #
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	cvtsd2ss	%xmm0, %xmm0	 # _20, _21
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	mulss	.LC51(%rip), %xmm0	 #, _22
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	movss	%xmm0, 20(%r13)	 # _22, sd_95(D)->duration_ms
 # pms.c:525:             sd->duration_ms = (float)atof(p+9)*1000.0f; continue;
	jmp	.L64	 #
.L147:
 # pms.c:531:             fprintf(stderr,"Warning: spec file too many frames; truncating at %d\n",MAX_SPEC_FRAMES);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:531:             fprintf(stderr,"Warning: spec file too many frames; truncating at %d\n",MAX_SPEC_FRAMES);
	movl	$8192, %r8d	 #,
	leaq	.LC54(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _24,
	call	fprintf	 #
.L79:
 # pms.c:575:     fclose(fp);
	movq	%r12, %rcx	 # fp,
	call	fclose	 #
 # pms.c:577:     if (sd->nframes==0){
	movslq	8(%r13), %rax	 # sd_95(D)->nframes,
 # pms.c:577:     if (sd->nframes==0){
	testl	%eax, %eax	 # _59
	je	.L150	 #,
 # pms.c:580:     if (sd->duration_ms <= 0.0f)
	pxor	%xmm0, %xmm0	 # tmp331
	comiss	20(%r13), %xmm0	 # sd_95(D)->duration_ms, tmp331
	jnb	.L103	 #,
.L105:
 # pms.c:582:     return 0;
	xorl	%eax, %eax	 # <retval>
.L60:
 # pms.c:583: }
	movaps	8256(%rsp), %xmm6	 #,
	addq	$8280, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L103:
 # pms.c:581:         sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
	subq	$1, %rax	 #, tmp333
 # pms.c:581:         sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
	movss	.LC2(%rip), %xmm0	 #, tmp339
 # pms.c:581:         sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
	imulq	$148, %rax, %rax	 #, tmp333, tmp335
	addq	0(%r13), %rax	 # sd_95(D)->frames, tmp336
 # pms.c:581:         sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
	addss	(%rax), %xmm0	 # _66->time_ms, _68
 # pms.c:581:         sd->duration_ms = sd->frames[sd->nframes-1].time_ms + 100.0f;
	movss	%xmm0, 20(%r13)	 # _68, sd_95(D)->duration_ms
	jmp	.L105	 #
.L85:
 # pms.c:554:         NEED(push) fr->voicing_amp    = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
	call	nxtok	 #
 # pms.c:554:         NEED(push) fr->voicing_amp    = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L140	 #,
 # pms.c:554:         NEED(push) fr->voicing_amp    = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:555:         NEED(push) fr->aspiration_amp = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:554:         NEED(push) fr->voicing_amp    = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _39, tmp306
	movss	%xmm0, 84(%r14)	 # tmp306, fr_104->voicing_amp
 # pms.c:555:         NEED(push) fr->aspiration_amp = (float)atof(tok);
	call	nxtok	 #
 # pms.c:555:         NEED(push) fr->aspiration_amp = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L140	 #,
 # pms.c:555:         NEED(push) fr->aspiration_amp = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:556:         NEED(push) fr->frication_amp  = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:555:         NEED(push) fr->aspiration_amp = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _42, tmp311
	movss	%xmm0, 88(%r14)	 # tmp311, fr_104->aspiration_amp
 # pms.c:556:         NEED(push) fr->frication_amp  = (float)atof(tok);
	call	nxtok	 #
 # pms.c:556:         NEED(push) fr->frication_amp  = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L140	 #,
 # pms.c:556:         NEED(push) fr->frication_amp  = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:557:         NEED(push) fr->f0             = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:556:         NEED(push) fr->frication_amp  = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _45, tmp316
	movss	%xmm0, 92(%r14)	 # tmp316, fr_104->frication_amp
 # pms.c:557:         NEED(push) fr->f0             = (float)atof(tok);
	call	nxtok	 #
 # pms.c:557:         NEED(push) fr->f0             = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L140	 #,
 # pms.c:557:         NEED(push) fr->f0             = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	movq	%rdi, %rcx	 # tmp343,
 # pms.c:557:         NEED(push) fr->f0             = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _48, tmp321
	movss	%xmm0, 96(%r14)	 # tmp321, fr_104->f0
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	call	nxtok	 #
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	testq	%rax, %rax	 # tok
	je	.L140	 #,
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:559:         if(fr->gain_mult < 1e-6f) fr->gain_mult = 1.0f;
	movss	.LC58(%rip), %xmm1	 #, tmp325
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _51, _52
 # pms.c:559:         if(fr->gain_mult < 1e-6f) fr->gain_mult = 1.0f;
	comiss	%xmm0, %xmm1	 # _52, tmp325
	ja	.L151	 #,
.L95:
 # pms.c:563:             for(int k=0;k<FORMANTS;k++){
	cmpl	$0, FORMANTS(%rip)	 #, FORMANTS
	movss	%xmm0, 100(%r14)	 # _52, MEM <struct SpecFrame> [(void *)fr_104].gain_mult
	jle	.L90	 #,
	leaq	104(%r14), %rax	 #, ivtmp.175
	xorl	%r15d, %r15d	 # ng
	movq	%rax, 40(%rsp)	 # ivtmp.175, %sfp
	jmp	.L99	 #
.L152:
 # pms.c:565:                 fr->fgain[k]=(float)atof(tok); ng++;
	movq	%rax, %rcx	 # tok,
 # pms.c:565:                 fr->fgain[k]=(float)atof(tok); ng++;
	addl	$1, %r15d	 #, ng
 # pms.c:565:                 fr->fgain[k]=(float)atof(tok); ng++;
	call	atof	 #
 # pms.c:565:                 fr->fgain[k]=(float)atof(tok); ng++;
	movq	40(%rsp), %rax	 # %sfp, ivtmp.175
	cvtsd2ss	%xmm0, %xmm0	 # _53, tmp327
 # pms.c:563:             for(int k=0;k<FORMANTS;k++){
	addq	$4, %rax	 #, ivtmp.175
 # pms.c:565:                 fr->fgain[k]=(float)atof(tok); ng++;
	movss	%xmm0, -4(%rax)	 # tmp327, MEM[(float *)_244]
 # pms.c:563:             for(int k=0;k<FORMANTS;k++){
	cmpl	%r15d, FORMANTS(%rip)	 # ng, FORMANTS
	movq	%rax, 40(%rsp)	 # ivtmp.175, %sfp
	jle	.L100	 #,
.L99:
 # pms.c:564:                 tok=nxtok(&ptr); if(!tok) break;
	movq	%rdi, %rcx	 # tmp343,
	call	nxtok	 #
 # pms.c:564:                 tok=nxtok(&ptr); if(!tok) break;
	testq	%rax, %rax	 # tok
	jne	.L152	 #,
 # pms.c:567:             if(ng>0) fr->has_fgain=1;
	testl	%r15d, %r15d	 # ng
	je	.L90	 #,
.L100:
 # pms.c:567:             if(ng>0) fr->has_fgain=1;
	movl	$1, 144(%r14)	 #, fr_104->has_fgain
	jmp	.L90	 #
.L140:
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:558:         NEED(push) fr->gain_mult      = (float)atof(tok);
	leaq	.LC56(%rip), %rdx	 #,
	movl	%ebx, %r8d	 # lno,
	movq	%rax, %rcx	 # _50,
	call	fprintf	 #
.L90:
 # pms.c:570:         sd->nframes++;
	addl	$1, 8(%r13)	 #, sd_95(D)->nframes
 # pms.c:571:         continue;
	jmp	.L64	 #
.L138:
	movss	.LC43(%rip), %xmm6	 #, _52
	jmp	.L80	 #
.L148:
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	leaq	.LC56(%rip), %rdx	 #,
	movl	%ebx, %r8d	 # lno,
	movq	%rax, %rcx	 # _29,
	call	fprintf	 #
 # pms.c:546:         NEED(skip) fr->time_ms = (float)atof(tok);
	jmp	.L64	 #
.L151:
 # pms.c:559:         if(fr->gain_mult < 1e-6f) fr->gain_mult = 1.0f;
	movaps	%xmm6, %xmm0	 # _52, _52
	jmp	.L95	 #
.L107:
 # pms.c:537:         for(int k=0;k<FORMANTS;k++) fr->fgain[k]=1.0f;
	xorl	%edx, %edx	 # k
	jmp	.L81	 #
.L150:
 # pms.c:578:         fprintf(stderr,"Error: no valid frames in spec file '%s'\n",path); return -1;
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:578:         fprintf(stderr,"Error: no valid frames in spec file '%s'\n",path); return -1;
	movq	8352(%rsp), %r8	 # path,
	leaq	.LC59(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _60,
	call	fprintf	 #
.L62:
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	movl	$-1, %eax	 #, <retval>
	jmp	.L60	 #
.L143:
 # pms.c:502:     if (!sd->frames){ fclose(fp); return -1; }
	movq	%r12, %rcx	 # fp,
	call	fclose	 #
 # pms.c:502:     if (!sd->frames){ fclose(fp); return -1; }
	jmp	.L62	 #
.L142:
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	call	*__imp__errno(%rip)	 #
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	movl	(%rax), %ecx	 # *_1,
	call	strerror	 #
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	movl	$2, %ecx	 #,
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	movq	%rax, %rbx	 #, _3
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	movq	8352(%rsp), %r8	 # path,
	movq	%rbx, %r9	 # _3,
	leaq	.LC45(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _4,
	call	fprintf	 #
 # pms.c:499:     if (!fp){ fprintf(stderr,"Error: cannot open spec '%s': %s\n",path,strerror(errno)); return -1; }
	jmp	.L62	 #
	.seh_endproc
	.p2align 4
	.def	w32;	.scl	3;	.type	32;	.endef
	.seh_proc	w32
w32:
	subq	$56, %rsp	 #,
	.seh_stackalloc	56
	.seh_endprologue
 # pms.c:422:     fwrite(b,1,4,f);
	movl	$4, %r8d	 #,
 # pms.c:419: static void w32(FILE *f, uint32_t v) {
	movq	%rcx, %r9	 # f, f
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	%edx, 44(%rsp)	 # v, MEM <vector(4) unsigned char> [(unsigned char *)&b]
 # pms.c:422:     fwrite(b,1,4,f);
	movl	$1, %edx	 #,
	leaq	44(%rsp), %rcx	 #, tmp101
	call	fwrite	 #
	nop	
 # pms.c:423: }
	addq	$56, %rsp	 #,
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC62:
	.ascii "Error: cannot open phoneme file '%s': %s\12\0"
.LC63:
	.ascii "TEMPO\0"
.LC65:
	.ascii "PHONEME_SET\0"
.LC66:
	.ascii "%15s\0"
.LC67:
	.ascii "VOICE_TYPE\0"
	.align 8
.LC68:
	.ascii "Warning: too many phonemes; truncating at %d\12\0"
.LC70:
	.ascii "p\0"
.LC71:
	.ascii "t\0"
.LC72:
	.ascii "k\0"
.LC73:
	.ascii "b\0"
.LC74:
	.ascii "d\0"
.LC75:
	.ascii "g\0"
	.align 8
.LC77:
	.ascii "Error: no phonemes parsed from '%s'\12\0"
	.text
	.p2align 4
	.def	phoneme_parse;	.scl	3;	.type	32;	.endef
	.seh_proc	phoneme_parse
phoneme_parse:
	pushq	%r15	 #
	.seh_pushreg	%r15
	movl	$4328, %eax	 #,
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp	 #,
	.seh_stackalloc	4328
	movaps	%xmm6, 4304(%rsp)	 #,
	.seh_savexmm	%xmm6, 4304
	.seh_endprologue
 # pms.c:640: {
	movq	%rdx, %r15	 # pd, pd
	movq	%rcx, %rbx	 # path, path
 # pms.c:641:     FILE *fp = fopen(path,"r");
	leaq	.LC44(%rip), %rdx	 #,
	call	fopen	 #
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	testq	%rax, %rax	 # fp
 # pms.c:641:     FILE *fp = fopen(path,"r");
	movq	%rax, %r14	 #, fp
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	je	.L285	 #,
 # pms.c:644:     pd->phonemes    = (PhonemeInst*)calloc(MAX_PHONEMES, sizeof(PhonemeInst));
	movl	$8100, %edx	 #,
	movl	$1024, %ecx	 #,
	call	calloc	 #
 # pms.c:645:     if (!pd->phonemes){ fclose(fp); return -1; }
	testq	%rax, %rax	 # tmp474
 # pms.c:644:     pd->phonemes    = (PhonemeInst*)calloc(MAX_PHONEMES, sizeof(PhonemeInst));
	movq	%rax, (%r15)	 # tmp474, pd_86(D)->phonemes
 # pms.c:645:     if (!pd->phonemes){ fclose(fp); return -1; }
	je	.L286	 #,
 # pms.c:646:     pd->nphon       = 0;
	movq	.LC46(%rip), %rax	 #, tmp268
 # pms.c:650:     strcpy(pd->phoneme_set,"ipa");
	movl	$6385769, 24(%r15)	 #, MEM <char[1:4]> [(void *)_7]
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	movq	__imp__strnicmp(%rip), %r12	 #, tmp463
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC60(%rip), %xmm6	 #, tmp466
 # pms.c:646:     pd->nphon       = 0;
	movq	%rax, 8(%r15)	 # tmp268, MEM <vector(2) int> [(int *)pd_86(D) + 8B]
 # pms.c:648:     pd->filter_mode = FILTER_CASCADE;
	movabsq	$4575657221408423936, %rax	 #, tmp566
	movq	%rax, 16(%r15)	 # tmp566, MEM <unsigned long long> [(void *)pd_86(D) + 16B]
 # pms.c:650:     strcpy(pd->phoneme_set,"ipa");
	leaq	24(%r15), %rax	 #, _7
	movq	%rax, 40(%rsp)	 # _7, %sfp
	.p2align 4,,10
	.p2align 3
.L159:
 # pms.c:654:     while (fgets(line,sizeof(line),fp)){
	leaq	208(%rsp), %rcx	 #,
	movq	%r14, %r8	 # fp,
	movl	$4096, %edx	 #,
	call	fgets	 #
 # pms.c:654:     while (fgets(line,sizeof(line),fp)){
	testq	%rax, %rax	 # _61
	je	.L176	 #,
 # pms.c:657:         while(*p==' '||*p=='\t') p++;
	movzbl	208(%rsp), %eax	 # MEM[(char *)&line], _94
 # pms.c:656:         char *p = line;
	leaq	208(%rsp), %rsi	 #, p
 # pms.c:657:         while(*p==' '||*p=='\t') p++;
	cmpb	$32, %al	 #, _94
	jne	.L284	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L257:
 # pms.c:657:         while(*p==' '||*p=='\t') p++;
	movzbl	1(%rsi), %eax	 # MEM[(char *)p_174], _94
 # pms.c:657:         while(*p==' '||*p=='\t') p++;
	addq	$1, %rsi	 #, p
 # pms.c:657:         while(*p==' '||*p=='\t') p++;
	cmpb	$32, %al	 #, _94
	je	.L257	 #,
.L284:
	cmpb	$9, %al	 #, _94
	je	.L257	 #,
	cmpb	$35, %al	 #, _94
	ja	.L161	 #,
	movabsq	$34359747585, %rdx	 #, tmp276
	btq	%rax, %rdx	 # _94, tmp276
	jc	.L159	 #,
.L161:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC47(%rip), %rdx	 #,
	movl	$11, %r8d	 #,
	movq	%rsi, %rcx	 # p,
	call	*%r12	 # tmp463
 # pms.c:660:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
	testl	%eax, %eax	 # _165
	je	.L287	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC48(%rip), %rdx	 #,
	movl	$14, %r8d	 #,
	movq	%rsi, %rcx	 # p,
	call	*%r12	 # tmp463
 # pms.c:661:         if (strncasecmp(p,"SYNTHESIS_MODE",14)==0){
	testl	%eax, %eax	 # _150
	je	.L288	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC63(%rip), %rdx	 #,
	movl	$5, %r8d	 #,
	movq	%rsi, %rcx	 # p,
	call	*%r12	 # tmp463
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	testl	%eax, %eax	 # _184
	je	.L289	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC65(%rip), %rdx	 #,
	movl	$11, %r8d	 #,
	movq	%rsi, %rcx	 # p,
	call	*%r12	 # tmp463
 # pms.c:667:         if (strncasecmp(p,"PHONEME_SET",11)==0){
	testl	%eax, %eax	 # _185
	je	.L290	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC67(%rip), %rdx	 #,
	movl	$10, %r8d	 #,
	movq	%rsi, %rcx	 # p,
	call	*%r12	 # tmp463
 # pms.c:671:         if (strncasecmp(p,"VOICE_TYPE",10)==0) continue;
	testl	%eax, %eax	 # _186
	je	.L159	 #,
 # pms.c:673:         if (pd->nphon >= MAX_PHONEMES){
	movslq	8(%r15), %rax	 # pd_86(D)->nphon,
 # pms.c:673:         if (pd->nphon >= MAX_PHONEMES){
	cmpl	$1023, %eax	 #, _29
	jg	.L291	 #,
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	movq	%rax, 56(%rsp)	 # _32, %sfp
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	imulq	$8100, %rax, %rax	 #, _32, _33
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	movq	(%r15), %rdx	 # pd_86(D)->phonemes, _31
 # pms.c:679:         memset(ph,0,sizeof(*ph));
	movl	$8100, %r8d	 #,
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	movq	%rdx, 48(%rsp)	 # _31, %sfp
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	leaq	(%rdx,%rax), %rbp	 #, ph
 # pms.c:679:         memset(ph,0,sizeof(*ph));
	xorl	%edx, %edx	 #
 # pms.c:678:         PhonemeInst *ph = &pd->phonemes[pd->nphon];
	movq	%rax, 64(%rsp)	 # _33, %sfp
 # pms.c:679:         memset(ph,0,sizeof(*ph));
	movq	%rbp, %rcx	 # ph,
	call	memset	 #
 # pms.c:681:         char *ptr = p;
	movq	%rsi, 88(%rsp)	 # p, ptr
 # pms.c:682:         char *tok = nxtok(&ptr); if (!tok) continue;
	leaq	88(%rsp), %rsi	 #, tmp450
	movq	%rsi, %rcx	 # tmp450,
	movq	%rsi, 32(%rsp)	 # tmp450, %sfp
	call	nxtok	 #
 # pms.c:682:         char *tok = nxtok(&ptr); if (!tok) continue;
	testq	%rax, %rax	 # tok
	je	.L159	 #,
 # pms.c:683:         strncpy(ph->name, tok, sizeof(ph->name)-1);
	movl	$15, %r8d	 #,
	movq	%rax, %rdx	 # tok,
	movq	%rbp, %rcx	 # ph,
	call	strncpy	 #
 # pms.c:685:         tok = nxtok(&ptr); if (!tok) continue;
	movq	%rsi, %rcx	 # tmp450,
	call	nxtok	 #
 # pms.c:685:         tok = nxtok(&ptr); if (!tok) continue;
	testq	%rax, %rax	 # tok
	je	.L159	 #,
 # pms.c:686:         ph->duration_ms = (float)atof(tok);
	movq	%rax, %rcx	 # tok,
	call	atof	 #
 # pms.c:686:         ph->duration_ms = (float)atof(tok);
	cvtsd2ss	%xmm0, %xmm0	 # _35, _36
 # pms.c:686:         ph->duration_ms = (float)atof(tok);
	movss	%xmm0, 16(%rbp)	 # _36, ph_95->duration_ms
 # pms.c:687:         if (pd->tempo > 1e-4f) ph->duration_ms /= pd->tempo;
	movss	20(%r15), %xmm1	 # pd_86(D)->tempo, _37
 # pms.c:687:         if (pd->tempo > 1e-4f) ph->duration_ms /= pd->tempo;
	comiss	.LC69(%rip), %xmm1	 #, _37
	ja	.L292	 #,
.L178:
	movq	%rbx, 4400(%rsp)	 # path, path
	movq	__imp__stricmp(%rip), %r13	 #, tmp447
	leaq	g_phoneme_db(%rip), %rbx	 #, ivtmp.289
	jmp	.L181	 #
	.p2align 4,,10
	.p2align 3
.L294:
 # pms.c:263:     for (int i = 0; i < g_phoneme_db_size; i++)
	leaq	4292+g_phoneme_db(%rip), %rax	 #, tmp576
	addq	$116, %rbx	 #, ivtmp.289
	cmpq	%rbx, %rax	 # ivtmp.289, tmp576
	je	.L293	 #,
.L181:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	movq	%rbp, %rdx	 # ph,
	movq	%rbx, %rcx	 # ivtmp.289,
	call	*%r13	 # tmp447
 # pms.c:264:         if (strcasecmp(g_phoneme_db[i].name, name) == 0)
	testl	%eax, %eax	 # tmp.223
	jne	.L294	 #,
 # pms.c:691:             for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %edx	 # FORMANTS, pretmp_308
	movq	%rbx, 72(%rsp)	 # ivtmp.289, %sfp
	movq	%rbx, %rsi	 # ivtmp.289, ivtmp.289
	movq	4400(%rsp), %rbx	 # path, path
	testl	%edx, %edx	 # pretmp_308
	jle	.L189	 #,
	cmpl	$1, %edx	 #, pretmp_308
	je	.L218	 #,
	movq	48(%rsp), %rcx	 # %sfp, _31
	leaq	20(%rsi), %r11	 #, _46
	movq	64(%rsp), %r9	 # %sfp, _33
	leaq	280(%rcx,%r9), %r8	 #, _47
	leaq	320(%rcx,%r9), %r10	 #, _295
	leaq	296(%rcx,%r9), %r9	 #, _130
	cmpq	%r9, %r11	 # _130, _46
	leaq	76(%rsi), %r9	 #, _132
	setnb	%r11b	 #, _131
	cmpq	%r9, %r8	 # _132, _47
	setnb	%r9b	 #, _41
	orb	%r11b, %r9b	 # _131, tmp511
	je	.L218	 #,
	leaq	-24(%r10), %r9	 #, _302
	subq	%rsi, %r9	 # ivtmp.289, _299
	cmpq	$48, %r9	 #, _299
	jbe	.L218	 #,
	leal	-1(%rdx), %r11d	 #, _321
	movl	%edx, %r9d	 # pretmp_308, niters.206
	cmpl	$2, %r11d	 #, _321
	jbe	.L219	 #,
	shrl	$2, %r9d	 #, _39
	xorl	%eax, %eax	 # ivtmp.273
	salq	$4, %r9	 #, _277
.L187:
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movups	20(%rsi,%rax), %xmm0	 # MEM <const vector(4) float> [(float *)_197 + 20B + ivtmp.273_155 * 1], MEM <const vector(4) float> [(float *)_197 + 20B + ivtmp.273_155 * 1]
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movups	%xmm0, (%r8,%rax)	 # MEM <const vector(4) float> [(float *)_197 + 20B + ivtmp.273_155 * 1], MEM <vector(4) float> [(float *)_47 + ivtmp.273_155 * 1]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movups	60(%rsi,%rax), %xmm0	 # MEM <const vector(4) float> [(float *)_197 + 60B + ivtmp.273_155 * 1], MEM <const vector(4) float> [(float *)_197 + 60B + ivtmp.273_155 * 1]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movups	%xmm0, (%r10,%rax)	 # MEM <const vector(4) float> [(float *)_197 + 60B + ivtmp.273_155 * 1], MEM <vector(4) float> [(float *)_295 + ivtmp.273_155 * 1]
	addq	$16, %rax	 #, ivtmp.273
	cmpq	%r9, %rax	 # _277, ivtmp.273
	jne	.L187	 #,
	movl	%edx, %eax	 # pretmp_308, tmp.223
	andl	$-4, %eax	 #, tmp.223
	cmpl	%eax, %edx	 # tmp.223, pretmp_308
	movl	%eax, %r8d	 # tmp.223,
	je	.L189	 #,
	subl	%eax, %edx	 # tmp.223, pretmp_308
	cmpl	$1, %edx	 #, niters.206
	movl	%edx, %r9d	 # pretmp_308, niters.206
	je	.L191	 #,
.L186:
	leaq	5(%r8), %r10	 #, _375
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movq	48(%rsp), %rcx	 # %sfp, _31
	imulq	$2025, 56(%rsp), %rdx	 #, %sfp, _382
	testb	$1, %r9b	 #, niters.206
	leaq	70(%r8,%rdx), %rdx	 #, _385
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movq	(%rsi,%r10,4), %r8	 # MEM <const vector(2) float> [(float *)vectp.225_373], MEM <const vector(2) float> [(float *)vectp.225_373]
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movq	%r8, (%rcx,%rdx,4)	 # MEM <const vector(2) float> [(float *)vectp.225_373], MEM <vector(2) float> [(float *)vectp.228_380]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movq	40(%rsi,%r10,4), %r8	 # MEM <const vector(2) float> [(float *)vectp.230_390], MEM <const vector(2) float> [(float *)vectp.230_390]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movq	%r8, 40(%rcx,%rdx,4)	 # MEM <const vector(2) float> [(float *)vectp.230_390], MEM <vector(2) float> [(float *)vectp.233_397]
	je	.L189	 #,
	movl	%r9d, %edx	 # niters.206, niters.206
	andl	$-2, %edx	 #, niters.206
	addl	%edx, %eax	 # niters_vector_mult_vf.222_370, tmp.223
.L191:
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	cltq
	movss	20(%rsi,%rax,4), %xmm0	 # MEM[(const struct PhonemeDBEntry *)_197].freq[k_367], _358
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movss	%xmm0, 280(%rbp,%rax,4)	 # _358, ph_95->target_freq[k_367]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movss	60(%rsi,%rax,4), %xmm0	 # MEM[(const struct PhonemeDBEntry *)_197].bw[k_367], _360
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movss	%xmm0, 320(%rbp,%rax,4)	 # _360, ph_95->target_bw[k_367]
.L189:
 # pms.c:695:             ph->voicing_amp    = dbe->voicing_amp;
	movss	100(%rsi), %xmm0	 # MEM[(const struct PhonemeDBEntry *)_197].voicing_amp, _42
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC70(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
 # pms.c:695:             ph->voicing_amp    = dbe->voicing_amp;
	movss	%xmm0, 8084(%rbp)	 # _42, ph_95->voicing_amp
 # pms.c:696:             ph->aspiration_amp = dbe->aspiration_amp;
	movss	104(%rsi), %xmm0	 # MEM[(const struct PhonemeDBEntry *)_197].aspiration_amp, _43
 # pms.c:696:             ph->aspiration_amp = dbe->aspiration_amp;
	movss	%xmm0, 8088(%rbp)	 # _43, ph_95->aspiration_amp
 # pms.c:697:             ph->frication_amp  = dbe->frication_amp;
	movss	108(%rsi), %xmm0	 # MEM[(const struct PhonemeDBEntry *)_197].frication_amp, _44
 # pms.c:697:             ph->frication_amp  = dbe->frication_amp;
	movss	%xmm0, 8092(%rbp)	 # _44, ph_95->frication_amp
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	call	*%r13	 # tmp447
 # pms.c:700:                 if (strcasecmp(n,"p")==0||strcasecmp(n,"t")==0||strcasecmp(n,"k")==0)
	testl	%eax, %eax	 # _187
	jne	.L295	 #,
.L183:
 # pms.c:701:                     ph->plosive_type = 1;                 
	movl	$1, 8096(%rbp)	 #, ph_95->plosive_type
.L200:
 # pms.c:632:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	leaq	144(%rsp), %rax	 #, tmp461
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	xorl	%r13d, %r13d	 # fi
	movq	%rbx, 4400(%rsp)	 # path, path
 # pms.c:632:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	movq	%rax, 48(%rsp)	 # tmp461, %sfp
	.p2align 4,,10
	.p2align 3
.L199:
 # pms.c:715:         while ((tok = nxtok(&ptr)) != NULL) {
	movq	32(%rsp), %rcx	 # %sfp,
	call	nxtok	 #
 # pms.c:715:         while ((tok = nxtok(&ptr)) != NULL) {
	testq	%rax, %rax	 # tok
 # pms.c:715:         while ((tok = nxtok(&ptr)) != NULL) {
	movq	%rax, %rbx	 #, tok
 # pms.c:715:         while ((tok = nxtok(&ptr)) != NULL) {
	je	.L296	 #,
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	movl	$58, %edx	 #,
	movq	%rbx, %rcx	 # tok,
	call	strchr	 #
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	movl	$47, %edx	 #,
	movq	%rbx, %rcx	 # tok,
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	movq	%rax, %rsi	 #, _48
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	call	strchr	 #
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	testq	%rsi, %rsi	 # _48
	je	.L202	 #,
 # pms.c:716:             if (strchr(tok,':') && !strchr(tok,'/')) {
	testq	%rax, %rax	 # _288
	je	.L297	 #,
.L203:
 # pms.c:720:                 if (fi < FORMANTS) {
	cmpl	%r13d, FORMANTS(%rip)	 # fi, FORMANTS
	jle	.L199	 #,
 # pms.c:632:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	movq	%rbx, %rdx	 # tok,
	movq	48(%rsp), %rbx	 # %sfp, tmp461
	movl	$63, %r8d	 #,
	movq	%rbx, %rcx	 # tmp461,
	call	strncpy	 #
 # pms.c:633:     char *sl = strchr(buf,'/');
	movq	%rbx, %rcx	 # tmp461,
	movl	$47, %edx	 #,
 # pms.c:632:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	movb	$0, 207(%rsp)	 #, MEM[(char[64] *)_327][63]
 # pms.c:633:     char *sl = strchr(buf,'/');
	call	strchr	 #
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	testq	%rax, %rax	 # sl
 # pms.c:633:     char *sl = strchr(buf,'/');
	movq	%rax, %rbx	 #, sl
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	je	.L298	 #,
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	movq	48(%rsp), %rcx	 # %sfp,
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	movb	$0, (%rax)	 #, *sl_229
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	movslq	%r13d, %rsi	 # fi, fi
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	call	atof	 #
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	leaq	1(%rbx), %rcx	 #, _234
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	cvtsd2ss	%xmm0, %xmm0	 # _232, tmp424
	movss	%xmm0, 280(%rbp,%rsi,4)	 # tmp424, MEM <struct PhonemeInst> [(float *)ph_95].target_freq[fi_69]
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	call	atof	 #
 # pms.c:635:     *sl='\0'; *fr=(float)atof(buf); *bw=(float)atof(sl+1);
	cvtsd2ss	%xmm0, %xmm0	 # _235, _203
.L208:
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	movss	%xmm0, 320(%rbp,%rsi,4)	 # _203, MEM <struct PhonemeInst> [(float *)ph_95].target_bw[fi_69]
 # pms.c:723:                     fi++;
	addl	$1, %r13d	 #, fi
	jmp	.L199	 #
	.p2align 4,,10
	.p2align 3
.L287:
 # pms.c:660:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
	leaq	12(%rsi), %rcx	 #, _16
 # pms.c:660:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
	call	atoi	 #
 # pms.c:660:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
	movl	%eax, 12(%r15)	 # _17, pd_86(D)->sample_rate
 # pms.c:660:         if (strncasecmp(p,"SAMPLE_RATE",11)==0){ pd->sample_rate=atoi(p+12); continue; }
	jmp	.L159	 #
.L288:
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	movzbl	15(%rsi), %eax	 # MEM[(char *)p_272 + 15B], _154
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	leaq	15(%rsi), %rcx	 #, v
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	cmpb	$32, %al	 #, _154
	jne	.L282	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L258:
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	movzbl	1(%rcx), %eax	 # MEM[(char *)v_170], _168
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	addq	$1, %rcx	 #, v
 # pms.c:662:             char *v=p+15; while(*v==' '||*v=='\t')v++;
	cmpb	$32, %al	 #, _168
	je	.L258	 #,
.L282:
	cmpb	$9, %al	 #, _154
	je	.L258	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:130:   __CRT_INLINE int __cdecl strncasecmp (const char *__sz1, const char *__sz2, size_t __sizeMaxCompare) { return _strnicmp (__sz1, __sz2, __sizeMaxCompare); }
	leaq	.LC49(%rip), %rdx	 #,
	movl	$8, %r8d	 #,
	call	*%r12	 # tmp463
 # pms.c:663:             pd->filter_mode=strncasecmp(v,"parallel",8)==0?FILTER_PARALLEL:FILTER_CASCADE;
	testl	%eax, %eax	 # _149
	sete	%al	 #, _21
	movzbl	%al, %eax	 # _21, _21
 # pms.c:663:             pd->filter_mode=strncasecmp(v,"parallel",8)==0?FILTER_PARALLEL:FILTER_CASCADE;
	movl	%eax, 16(%r15)	 # _21, pd_86(D)->filter_mode
 # pms.c:664:             continue;
	jmp	.L159	 #
.L289:
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	leaq	6(%rsi), %rcx	 #, _23
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	call	atof	 #
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	pxor	%xmm1, %xmm1	 # _25
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movaps	%xmm6, %xmm2	 # tmp466, _195
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	cvtsd2ss	%xmm0, %xmm1	 # _24, _25
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm6	 # _25, tmp466
	ja	.L169	 #,
	movss	.LC64(%rip), %xmm2	 #, tmp300
	movaps	%xmm2, %xmm0	 # tmp300, tmp302
	cmpltss	%xmm1, %xmm0	 #, _25, tmp302
	andps	%xmm0, %xmm2	 # tmp302, tmp303
	andnps	%xmm1, %xmm0	 # _25, tmp304
	orps	%xmm0, %xmm2	 # tmp304, _195
.L169:
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	movss	%xmm2, 20(%r15)	 # _195, pd_86(D)->tempo
 # pms.c:666:         if (strncasecmp(p,"TEMPO",5)==0){ pd->tempo=clampf((float)atof(p+6),0.25f,4.0f); continue; }
	jmp	.L159	 #
.L291:
 # pms.c:674:             fprintf(stderr,"Warning: too many phonemes; truncating at %d\n",MAX_PHONEMES);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:674:             fprintf(stderr,"Warning: too many phonemes; truncating at %d\n",MAX_PHONEMES);
	movl	$1024, %r8d	 #,
	leaq	.LC68(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _30,
	call	fprintf	 #
.L176:
 # pms.c:737:     fclose(fp);
	movq	%r14, %rcx	 # fp,
	call	fclose	 #
 # pms.c:739:     if (pd->nphon == 0){
	movl	8(%r15), %eax	 # pd_86(D)->nphon,
	testl	%eax, %eax	 #
	je	.L299	 #,
 # pms.c:742:     return 0;
	xorl	%eax, %eax	 # <retval>
.L154:
 # pms.c:743: }
	movaps	4304(%rsp), %xmm6	 #,
	addq	$4328, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L290:
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	movzbl	12(%rsi), %eax	 # MEM[(char *)p_272 + 12B], _11
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	leaq	12(%rsi), %rcx	 #, v
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	cmpb	$32, %al	 #, _11
	jne	.L283	 #,
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L259:
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	movzbl	1(%rcx), %eax	 # MEM[(char *)v_163], _161
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	addq	$1, %rcx	 #, v
 # pms.c:668:             char *v=p+12; while(*v==' '||*v=='\t')v++;
	cmpb	$32, %al	 #, _161
	je	.L259	 #,
.L283:
	cmpb	$9, %al	 #, _11
	je	.L259	 #,
 # pms.c:669:             sscanf(v,"%15s",pd->phoneme_set); continue;
	movq	40(%rsp), %r8	 # %sfp,
	leaq	.LC66(%rip), %rdx	 #,
	call	sscanf	 #
 # pms.c:669:             sscanf(v,"%15s",pd->phoneme_set); continue;
	jmp	.L159	 #
.L202:
 # pms.c:719:             } else if (strchr(tok,'/')) {
	testq	%rax, %rax	 # _288
	je	.L199	 #,
	jmp	.L203	 #
.L297:
 # pms.c:717:                 if (ph->n_pitch < MAX_PITCH_POINTS)
	movl	276(%rbp), %esi	 # ph_95->n_pitch, _50
 # pms.c:717:                 if (ph->n_pitch < MAX_PITCH_POINTS)
	cmpl	$31, %esi	 #, _50
	jg	.L199	 #,
 # pms.c:718:                     parse_pitch_pt(tok, &ph->pitch_points[ph->n_pitch++]);
	leal	1(%rsi), %eax	 #, tmp392
 # pms.c:624:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	movl	$63, %r8d	 #,
	movq	%rbx, %rdx	 # tok,
	leaq	144(%rsp), %rcx	 #,
 # pms.c:718:                     parse_pitch_pt(tok, &ph->pitch_points[ph->n_pitch++]);
	movl	%eax, 276(%rbp)	 # tmp392, ph_95->n_pitch
 # pms.c:624:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	call	strncpy	 #
 # pms.c:625:     char *c = strchr(buf,':'); if(!c) return 0;
	movl	$58, %edx	 #,
 # pms.c:624:     char buf[64]; strncpy(buf,tok,63); buf[63]='\0';
	movb	$0, 207(%rsp)	 #, MEM[(char[64] *)_327][63]
 # pms.c:625:     char *c = strchr(buf,':'); if(!c) return 0;
	leaq	144(%rsp), %rcx	 #,
	call	strchr	 #
 # pms.c:625:     char *c = strchr(buf,':'); if(!c) return 0;
	testq	%rax, %rax	 # c
	je	.L199	 #,
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	movb	$0, (%rax)	 #, *c_222
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	leaq	144(%rsp), %rcx	 #,
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	movq	%rax, 56(%rsp)	 # c, %sfp
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	call	atof	 #
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	movq	56(%rsp), %rax	 # %sfp, c
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	movslq	%esi, %r9	 # _50, _50
	leaq	2(%r9), %rbx	 #, tmp397
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	cvtsd2ss	%xmm0, %xmm0	 # _223, tmp401
	movss	%xmm0, 4(%rbp,%rbx,8)	 # tmp401, MEM <struct PhonemeInst> [(struct PitchPoint *)ph_95].pitch_points[_50].time_percent
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	leaq	1(%rax), %rcx	 #, _225
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	call	atof	 #
 # pms.c:626:     *c='\0'; pp->time_percent=(float)atof(buf); pp->f0_hz=(float)atof(c+1);
	cvtsd2ss	%xmm0, %xmm0	 # _226, tmp408
	movss	%xmm0, 8(%rbp,%rbx,8)	 # tmp408, MEM <struct PhonemeInst> [(struct PitchPoint *)ph_95].pitch_points[_50].f0_hz
 # pms.c:627:     return 1;
	jmp	.L199	 #
.L296:
 # pms.c:728:         if (ph->n_pitch == 0) {
	cmpl	$0, 276(%rbp)	 #, ph_95->n_pitch
	movq	4400(%rsp), %rbx	 # path, path
	jne	.L210	 #,
 # pms.c:729:             float f0d = (dbe && dbe->f0_default>0) ? dbe->f0_default : 120.0f;
	movq	72(%rsp), %rax	 # %sfp, _197
	testq	%rax, %rax	 # _197
	je	.L220	 #,
 # pms.c:729:             float f0d = (dbe && dbe->f0_default>0) ? dbe->f0_default : 120.0f;
	movss	112(%rax), %xmm0	 # _337->f0_default, f0d
 # pms.c:729:             float f0d = (dbe && dbe->f0_default>0) ? dbe->f0_default : 120.0f;
	pxor	%xmm1, %xmm1	 # tmp429
	comiss	%xmm1, %xmm0	 # tmp429, f0d
	jbe	.L220	 #,
.L211:
 # pms.c:730:             ph->pitch_points[0] = (PitchPoint){0.0f,   f0d};
	movl	$0x00000000, 20(%rbp)	 #, ph_95->pitch_points[0].time_percent
	movss	%xmm0, 24(%rbp)	 # f0d, ph_95->pitch_points[0].f0_hz
 # pms.c:731:             ph->pitch_points[1] = (PitchPoint){100.0f, f0d};
	movl	$0x42c80000, 28(%rbp)	 #, ph_95->pitch_points[1].time_percent
	movss	%xmm0, 32(%rbp)	 # f0d, ph_95->pitch_points[1].f0_hz
 # pms.c:732:             ph->n_pitch = 2;
	movl	$2, 276(%rbp)	 #, ph_95->n_pitch
.L210:
 # pms.c:735:         pd->nphon++;
	addl	$1, 8(%r15)	 #, pd_86(D)->nphon
	jmp	.L159	 #
.L292:
 # pms.c:687:         if (pd->tempo > 1e-4f) ph->duration_ms /= pd->tempo;
	divss	%xmm1, %xmm0	 # _37, _38
	movss	%xmm0, 16(%rbp)	 # _38, ph_95->duration_ms
	jmp	.L178	 #
.L295:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC71(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
	call	*%r13	 # tmp447
 # pms.c:700:                 if (strcasecmp(n,"p")==0||strcasecmp(n,"t")==0||strcasecmp(n,"k")==0)
	testl	%eax, %eax	 # _188
	je	.L183	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC72(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
	call	*%r13	 # tmp447
 # pms.c:700:                 if (strcasecmp(n,"p")==0||strcasecmp(n,"t")==0||strcasecmp(n,"k")==0)
	testl	%eax, %eax	 # _189
	je	.L183	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC73(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
	call	*%r13	 # tmp447
 # pms.c:702:                 else if (strcasecmp(n,"b")==0||strcasecmp(n,"d")==0||strcasecmp(n,"g")==0)
	testl	%eax, %eax	 # _190
	jne	.L196	 #,
.L197:
 # pms.c:703:                     ph->plosive_type = 2;              
	movl	$2, 8096(%rbp)	 #, ph_95->plosive_type
	jmp	.L200	 #
.L293:
 # pms.c:708:             float df[]={700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movq	.LC80(%rip), %rdx	 #, tmp442
	movaps	.LC78(%rip), %xmm0	 #, tmp440
 # pms.c:691:             for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %eax	 # FORMANTS,
 # pms.c:708:             float df[]={700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movaps	%xmm0, 96(%rsp)	 # tmp440, MEM <vector(4) float> [(float *)&df]
	movaps	.LC79(%rip), %xmm0	 #, tmp441
	movq	%rdx, 128(%rsp)	 # tmp442, MEM <vector(2) float> [(float *)&df + 32B]
 # pms.c:709:             float db[]={110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movq	.LC83(%rip), %rdx	 #, tmp445
 # pms.c:708:             float df[]={700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movaps	%xmm0, 112(%rsp)	 # tmp441, MEM <vector(4) float> [(float *)&df + 16B]
 # pms.c:709:             float db[]={110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movaps	.LC81(%rip), %xmm0	 #, tmp443
 # pms.c:710:             for(int k=0;k<FORMANTS;k++){ph->target_freq[k]=df[k];ph->target_bw[k]=db[k];}
	testl	%eax, %eax	 # pretmp_331
	movq	4400(%rsp), %rbx	 # path, path
 # pms.c:709:             float db[]={110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movaps	%xmm0, 144(%rsp)	 # tmp443, MEM <vector(4) float> [(float *)_327]
	movaps	.LC82(%rip), %xmm0	 #, tmp444
	movq	%rdx, 176(%rsp)	 # tmp445, MEM <vector(2) float> [(float *)_327 + 32B]
	movaps	%xmm0, 160(%rsp)	 # tmp444, MEM <vector(4) float> [(float *)_327 + 16B]
 # pms.c:710:             for(int k=0;k<FORMANTS;k++){ph->target_freq[k]=df[k];ph->target_bw[k]=db[k];}
	jle	.L201	 #,
 # pms.c:710:             for(int k=0;k<FORMANTS;k++){ph->target_freq[k]=df[k];ph->target_bw[k]=db[k];}
	leaq	0(,%rax,4), %rsi	 #, _205
	leaq	280(%rbp), %rcx	 #, _204
	movq	%rsi, %r8	 # _205,
	leaq	96(%rsp), %rdx	 #, tmp379
	call	memcpy	 #
 # pms.c:710:             for(int k=0;k<FORMANTS;k++){ph->target_freq[k]=df[k];ph->target_bw[k]=db[k];}
	leaq	320(%rbp), %rcx	 #, _67
	movq	%rsi, %r8	 # _205,
	leaq	144(%rsp), %rdx	 #, tmp386
	call	memcpy	 #
.L201:
 # pms.c:711:             ph->voicing_amp=0.8f; ph->aspiration_amp=0.2f;
	movq	.LC76(%rip), %rax	 #, tmp376
 # pms.c:266:     return NULL;
	xorl	%edx, %edx	 #
	movq	%rdx, 72(%rsp)	 #, %sfp
 # pms.c:711:             ph->voicing_amp=0.8f; ph->aspiration_amp=0.2f;
	movq	%rax, 8084(%rbp)	 # tmp376, MEM <vector(2) float> [(float *)ph_95 + 8084B]
	jmp	.L200	 #
.L220:
 # pms.c:729:             float f0d = (dbe && dbe->f0_default>0) ? dbe->f0_default : 120.0f;
	movss	.LC0(%rip), %xmm0	 #, f0d
	jmp	.L211	 #
.L298:
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	movq	48(%rsp), %rcx	 # %sfp,
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	movslq	%r13d, %rsi	 # fi, fi
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	call	atof	 #
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	cvtsd2ss	%xmm0, %xmm0	 # _230, tmp417
	movss	%xmm0, 280(%rbp,%rsi,4)	 # tmp417, MEM <struct PhonemeInst> [(float *)ph_95].target_freq[fi_69]
 # pms.c:634:     if (!sl){ *fr=(float)atof(buf); *bw=110.f; return 1; }
	movss	.LC61(%rip), %xmm0	 #, _203
	jmp	.L208	 #
.L218:
 # pms.c:691:             for(int k=0;k<FORMANTS;k++){
	xorl	%eax, %eax	 # ivtmp.260
.L193:
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movss	20(%rsi,%rax,4), %xmm0	 # MEM[(float *)_197 + 20B + ivtmp.260_281 * 4], _304
 # pms.c:692:                 ph->target_freq[k]=dbe->freq[k];
	movss	%xmm0, 280(%rbp,%rax,4)	 # _304, MEM[(float *)ph_95 + 280B + ivtmp.260_281 * 4]
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movss	60(%rsi,%rax,4), %xmm0	 # MEM[(float *)_197 + 60B + ivtmp.260_281 * 4], _306
 # pms.c:693:                 ph->target_bw  [k]=dbe->bw  [k];
	movss	%xmm0, 320(%rbp,%rax,4)	 # _306, MEM[(float *)ph_95 + 320B + ivtmp.260_281 * 4]
 # pms.c:691:             for(int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.260
	cmpl	%eax, %edx	 # ivtmp.260, pretmp_308
	jg	.L193	 #,
	jmp	.L189	 #
.L219:
	xorl	%r8d, %r8d	 #
	jmp	.L186	 #
.L285:
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	call	*__imp__errno(%rip)	 #
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	movl	(%rax), %ecx	 # *_1,
	call	strerror	 #
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	movl	$2, %ecx	 #,
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	movq	%rax, %rsi	 #, _3
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	movq	%rsi, %r9	 # _3,
	movq	%rbx, %r8	 # path,
	leaq	.LC62(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _4,
	call	fprintf	 #
.L156:
 # pms.c:642:     if (!fp){ fprintf(stderr,"Error: cannot open phoneme file '%s': %s\n",path,strerror(errno)); return -1; }
	movl	$-1, %eax	 #, <retval>
	jmp	.L154	 #
.L299:
 # pms.c:740:         fprintf(stderr,"Error: no phonemes parsed from '%s'\n",path); return -1;
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:740:         fprintf(stderr,"Error: no phonemes parsed from '%s'\n",path); return -1;
	leaq	.LC77(%rip), %rdx	 #,
	movq	%rbx, %r8	 # path,
	movq	%rax, %rcx	 # _63,
	call	fprintf	 #
 # pms.c:740:         fprintf(stderr,"Error: no phonemes parsed from '%s'\n",path); return -1;
	jmp	.L156	 #
.L286:
 # pms.c:645:     if (!pd->phonemes){ fclose(fp); return -1; }
	movq	%r14, %rcx	 # fp,
	call	fclose	 #
 # pms.c:645:     if (!pd->phonemes){ fclose(fp); return -1; }
	jmp	.L156	 #
.L196:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC74(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
	call	*%r13	 # tmp447
 # pms.c:702:                 else if (strcasecmp(n,"b")==0||strcasecmp(n,"d")==0||strcasecmp(n,"g")==0)
	testl	%eax, %eax	 # _191
	je	.L197	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC75(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # ph,
	call	*%r13	 # tmp447
 # pms.c:702:                 else if (strcasecmp(n,"b")==0||strcasecmp(n,"d")==0||strcasecmp(n,"g")==0)
	testl	%eax, %eax	 # _192
	je	.L197	 #,
 # pms.c:705:                     ph->plosive_type = 0;
	xorl	%ecx, %ecx	 #
	movl	%ecx, 8096(%rbp)	 #, ph_95->plosive_type
	jmp	.L200	 #
	.seh_endproc
	.p2align 4
	.def	contour_f0.part.0;	.scl	3;	.type	32;	.endef
	.seh_proc	contour_f0.part.0
contour_f0.part.0:
	.seh_endprologue
 # pms.c:339:     if (t_ms >= pts[n-1].time_ms) return pts[n-1].f0_hz;
	movslq	%edx, %rax	 # n, _2
	leaq	-8(%rcx,%rax,8), %r8	 #, _6
 # pms.c:339:     if (t_ms >= pts[n-1].time_ms) return pts[n-1].f0_hz;
	comiss	(%r8), %xmm2	 # _6->time_ms, t_ms
	jnb	.L301	 #,
 # pms.c:340:     for (int i = 0; i < n-1; i++)
	cmpl	$1, %edx	 #, n
	je	.L301	 #,
	leal	-2(%rdx), %eax	 #, _49
	leaq	8(%rcx,%rax,8), %rax	 #, _45
	.p2align 4,,10
	.p2align 3
.L307:
 # pms.c:341:         if (t_ms >= pts[i].time_ms && t_ms <= pts[i+1].time_ms)
	movss	(%rcx), %xmm0	 # MEM[(float *)_13], _14
 # pms.c:341:         if (t_ms >= pts[i].time_ms && t_ms <= pts[i+1].time_ms)
	comiss	%xmm0, %xmm2	 # _14, t_ms
	jb	.L302	 #,
 # pms.c:341:         if (t_ms >= pts[i].time_ms && t_ms <= pts[i+1].time_ms)
	movss	8(%rcx), %xmm1	 # MEM[(float *)_13 + 8B], _18
 # pms.c:341:         if (t_ms >= pts[i].time_ms && t_ms <= pts[i+1].time_ms)
	comiss	%xmm2, %xmm1	 # t_ms, _18
	jnb	.L315	 #,
.L302:
 # pms.c:340:     for (int i = 0; i < n-1; i++)
	addq	$8, %rcx	 #, ivtmp.301
	cmpq	%rcx, %rax	 # ivtmp.301, _45
	jne	.L307	 #,
.L301:
 # pms.c:344:     return pts[n-1].f0_hz;
	movss	4(%r8), %xmm3	 # _6->f0_hz, <retval>
.L300:
 # pms.c:345: }
	movaps	%xmm3, %xmm0	 # <retval>,
	ret	
	.p2align 4,,10
	.p2align 3
.L315:
 # pms.c:165:     if (t1 <= t0) return v0;
	comiss	%xmm1, %xmm0	 # _18, _14
 # pms.c:342:             return interp(pts[i].f0_hz, pts[i+1].f0_hz,
	movss	4(%rcx), %xmm3	 # _13->f0_hz, <retval>
 # pms.c:165:     if (t1 <= t0) return v0;
	jnb	.L300	 #,
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm0, %xmm1	 # _14, _29
 # pms.c:342:             return interp(pts[i].f0_hz, pts[i+1].f0_hz,
	movss	12(%rcx), %xmm4	 # _17->f0_hz, _19
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm0, %xmm2	 # _14, _28
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm1, %xmm2	 # _29, alpha
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm1, %xmm1	 # _32
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm2, %xmm1	 # alpha, _32
	ja	.L306	 #,
	movss	.LC43(%rip), %xmm0	 #, tmp138
	movaps	%xmm0, %xmm1	 # tmp138, tmp140
	cmpltss	%xmm2, %xmm1	 #, alpha, tmp140
	andps	%xmm1, %xmm0	 # tmp140, tmp141
	andnps	%xmm2, %xmm1	 # alpha, tmp142
	orps	%xmm0, %xmm1	 # tmp141, _32
.L306:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm3, %xmm4	 # <retval>, _19
	movaps	%xmm4, %xmm0	 # _19, _33
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _32, _35
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm3	 # _35, <retval>
 # pms.c:345: }
	movaps	%xmm3, %xmm0	 # <retval>,
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC86:
	.ascii "demo\0"
.LC87:
	.ascii "spec\0"
.LC88:
	.ascii "phoneme\0"
.LC89:
	.ascii "cascade\0"
.LC90:
	.ascii "natural\0"
.LC91:
	.ascii "whisper\0"
.LC92:
	.ascii "impulsive\0"
.LC112:
	.ascii "--help\0"
.LC113:
	.ascii "--version\0"
	.align 8
.LC114:
	.ascii "R.I.B-DDMMYYYY (R meaning Release, I meaning 1 character version identification, and B meaning bugfix, DD meaning 2 digit day, MM meaning 2 digit month and YYYY meaning 4 digit year.)\0"
.LC115:
	.ascii "2.~.5-23032026\0"
	.align 8
.LC116:
	.ascii "poor man's synthesizer version %s version format %s\12\0"
.LC117:
	.ascii "--spec\0"
.LC118:
	.ascii "--phon-spec\0"
.LC119:
	.ascii "Error: %s requires a value\12\0"
	.align 8
.LC120:
	.ascii "Error: conflicting mode flags\12\0"
.LC121:
	.ascii "--phoneme\0"
.LC122:
	.ascii "--demo\0"
	.align 8
.LC123:
	.ascii "Error: unknown voice type '%s'\12\0"
.LC124:
	.ascii "--sample-rate\0"
	.align 8
.LC125:
	.ascii "Error: invalid sample rate %d\12\0"
.LC126:
	.ascii "--duration\0"
.LC128:
	.ascii "--f0\0"
.LC129:
	.ascii "--synthesis\0"
	.align 8
.LC130:
	.ascii "Error: unknown synthesis mode '%s'\12\0"
.LC131:
	.ascii "--amplitude\0"
.LC132:
	.ascii "--voice\0"
.LC133:
	.ascii "--voicing-amp\0"
.LC134:
	.ascii "--aspiration-amp\0"
.LC135:
	.ascii "--frication-amp\0"
.LC136:
	.ascii "--vibrato-depth\0"
.LC138:
	.ascii "--vibrato-rate\0"
.LC140:
	.ascii "--jitter\0"
.LC141:
	.ascii "--shimmer\0"
.LC142:
	.ascii "--pitch-contour\0"
	.align 8
.LC143:
	.ascii "Error: cannot open contour '%s'\12\0"
.LC144:
	.ascii "%f %f\0"
.LC145:
	.ascii "--f\0"
.LC146:
	.ascii "--bw\0"
.LC147:
	.ascii "--gain\0"
.LC148:
	.ascii "--bw6-10\0"
.LC149:
	.ascii "--formants\0"
.LC150:
	.ascii "--aspiration-cutoff\0"
.LC151:
	.ascii "--frication-center\0"
.LC152:
	.ascii "--frication-bandwidth\0"
.LC153:
	.ascii "--output\0"
.LC154:
	.ascii "--output-format\0"
.LC155:
	.ascii "wav16\0"
.LC156:
	.ascii "wav32\0"
.LC157:
	.ascii "raw16\0"
.LC158:
	.ascii "raw32\0"
	.align 8
.LC159:
	.ascii "Error: unknown output format '%s'\12\0"
.LC160:
	.ascii "--normalize\0"
.LC161:
	.ascii "--no-normalize\0"
.LC162:
	.ascii "--no-lip-radiation\0"
.LC163:
	.ascii "--verbose\0"
	.align 8
.LC164:
	.ascii "Warning: unknown argument '%s' (ignored)\12\0"
	.align 8
.LC165:
	.ascii "ERROR: FORMANTS (%d) must be between 1 and MAX_FORMANTS (%d)\12\0"
	.align 8
.LC167:
	.ascii "Poor Man's Synthesizer v%s version format %s\12\0"
.LC168:
	.ascii "Mode      : %s\12\0"
.LC169:
	.ascii "Filters   : %s\12\0"
.LC170:
	.ascii "Voice     : %s\12\0"
.LC171:
	.ascii "Sample-rt : %d Hz\12\0"
.LC172:
	.ascii "Duration  : %.2f s\12\0"
.LC173:
	.ascii "F0        : %.1f Hz\12\0"
	.align 8
.LC174:
	.ascii "Voicing   : %.2f   Asp: %.2f   Fric: %.2f\12\0"
	.align 8
.LC175:
	.ascii "Vibrato   : %.1f Hz depth @ %.1f Hz rate\12\0"
	.align 8
.LC176:
	.ascii "Jitter    : %.1f%%  Shimmer: %.1f%%\12\0"
.LC177:
	.ascii "Formants  :\0"
	.align 8
.LC178:
	.ascii "  F%2d : %6.0f Hz  BW %4.0f Hz  Gain %.2f\12\0"
.LC179:
	.ascii "Output    : %s\12\0"
	.align 8
.LC180:
	.ascii "===================================\0"
.LC181:
	.ascii "Synthesising...\0"
	.align 8
.LC183:
	.ascii "Error: out of memory (%d samples)\12\0"
.LC184:
	.ascii "Error: synthesis failed\12\0"
.LC186:
	.ascii "sil\0"
.LC187:
	.ascii "_\0"
	.align 8
.LC215:
	.ascii "Generated %d samples (%.3f s)\12\0"
.LC216:
	.ascii "wb\0"
.LC217:
	.ascii "Error: cannot open '%s': %s\12\0"
	.align 8
.LC233:
	.ascii "Error: could not write output\12\0"
.LC234:
	.ascii "Output written to '%s'\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$2568, %rsp	 #,
	.seh_stackalloc	2568
	movaps	%xmm6, 2400(%rsp)	 #,
	.seh_savexmm	%xmm6, 2400
	movaps	%xmm7, 2416(%rsp)	 #,
	.seh_savexmm	%xmm7, 2416
	movaps	%xmm8, 2432(%rsp)	 #,
	.seh_savexmm	%xmm8, 2432
	movaps	%xmm9, 2448(%rsp)	 #,
	.seh_savexmm	%xmm9, 2448
	movaps	%xmm10, 2464(%rsp)	 #,
	.seh_savexmm	%xmm10, 2464
	movaps	%xmm11, 2480(%rsp)	 #,
	.seh_savexmm	%xmm11, 2480
	movaps	%xmm12, 2496(%rsp)	 #,
	.seh_savexmm	%xmm12, 2496
	movaps	%xmm13, 2512(%rsp)	 #,
	.seh_savexmm	%xmm13, 2512
	movaps	%xmm14, 2528(%rsp)	 #,
	.seh_savexmm	%xmm14, 2528
	movaps	%xmm15, 2544(%rsp)	 #,
	.seh_savexmm	%xmm15, 2544
	.seh_endprologue
 # pms.c:1370: {
	movl	%ecx, %esi	 # argc, argc
	movq	%rdx, %rdi	 # argv, argv
	call	__main	 #
 # pms.c:1372:     memset(&st, 0, sizeof(st));
	leaq	800(%rsp), %rax	 #, ivtmp.699
	xorl	%edx, %edx	 #
	movl	$1600, %r8d	 #,
	movq	%rax, %rcx	 # ivtmp.699,
	movq	%rax, 64(%rsp)	 # ivtmp.699, %sfp
	call	memset	 #
 # pms.c:1385:     st.vibrato_rate_hz       = 5.0f;
	movaps	.LC101(%rip), %xmm0	 #, tmp2205
 # pms.c:1377:     st.sample_rate           = 22050;
	movabsq	$4611686018427409954, %rax	 #, tmp5450
	movq	%rax, 812(%rsp)	 # tmp5450, MEM <unsigned long long> [(void *)&st + 12B]
 # pms.c:1378:     st.duration_sec          = 2.0f;
	movabsq	$4561245704582856704, %rax	 #, tmp5451
	movq	%rax, 820(%rsp)	 # tmp5451, MEM <unsigned long long> [(float *)&st + 20B]
 # pms.c:1381:     st.voicing_amp           = 0.70f;
	movq	.LC100(%rip), %rax	 #, tmp2204
 # pms.c:1385:     st.vibrato_rate_hz       = 5.0f;
	movlps	%xmm0, 1204(%rsp)	 # tmp2205, MEM <vector(4) float> [(float *)&st + 404B]
	movhps	%xmm0, 1212(%rsp)	 # tmp2205, MEM <vector(4) float> [(float *)&st + 404B]
 # pms.c:1396:     float def_f[] = {700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movaps	.LC78(%rip), %xmm0	 #, tmp2211
 # pms.c:1381:     st.voicing_amp           = 0.70f;
	movq	%rax, 1188(%rsp)	 # tmp2204, MEM <vector(2) float> [(float *)&st + 388B]
 # pms.c:1389:     st.frication_center      = 4000.0f;
	movq	.LC102(%rip), %rax	 #, tmp2206
 # pms.c:1396:     float def_f[] = {700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movaps	%xmm0, 352(%rsp)	 # tmp2211, MEM <vector(4) float> [(float *)&def_f]
	movaps	.LC79(%rip), %xmm0	 #, tmp2212
	movaps	%xmm0, 368(%rsp)	 # tmp2212, MEM <vector(4) float> [(float *)&def_f + 16B]
 # pms.c:1397:     float def_b[] = {110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movaps	.LC81(%rip), %xmm0	 #, tmp2214
 # pms.c:1389:     st.frication_center      = 4000.0f;
	movq	%rax, 1220(%rsp)	 # tmp2206, MEM <vector(2) float> [(float *)&st + 420B]
 # pms.c:1391:     st.normalize_output      = 1;
	movq	.LC103(%rip), %rax	 #, tmp2207
 # pms.c:1397:     float def_b[] = {110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movaps	%xmm0, 400(%rsp)	 # tmp2214, MEM <vector(4) float> [(float *)&def_b]
	movaps	.LC82(%rip), %xmm0	 #, tmp2215
	movaps	%xmm0, 416(%rsp)	 # tmp2215, MEM <vector(4) float> [(float *)&def_b + 16B]
 # pms.c:1391:     st.normalize_output      = 1;
	movq	%rax, 2372(%rsp)	 # tmp2207, MEM <vector(2) int> [(int *)&st + 1572B]
 # pms.c:1394:     strcpy(st.output_filename, "output.wav");
	movabsq	$8587929587188790639, %rax	 #, tmp5452
	movq	%rax, 1312(%rsp)	 # tmp5452, MEM <char[1:11]> [(void *)&st + 512B]
 # pms.c:1396:     float def_f[] = {700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movq	.LC80(%rip), %rax	 #, tmp2213
 # pms.c:1394:     strcpy(st.output_filename, "output.wav");
	movl	$7758199, 1319(%rsp)	 #, MEM <char[1:11]> [(void *)&st + 512B]
 # pms.c:1396:     float def_f[] = {700,1220,2600,3540,4500,5500,6500,7500,8500,9500};
	movq	%rax, 384(%rsp)	 # tmp2213, MEM <vector(2) float> [(float *)&def_f + 32B]
 # pms.c:1397:     float def_b[] = {110, 130, 110, 130, 140, 150, 160, 170, 180, 190};
	movq	.LC83(%rip), %rax	 #, tmp2216
	movq	%rax, 432(%rsp)	 # tmp2216, MEM <vector(2) float> [(float *)&def_b + 32B]
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %eax	 # FORMANTS, FORMANTS.0_497
	testl	%eax, %eax	 # FORMANTS.0_497
	jle	.L317	 #,
	leal	-1(%rax), %edx	 #, _3026
	cmpl	$2, %edx	 #, _3026
	jbe	.L1024	 #,
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movq	.LC104(%rip), %rdx	 #, tmp2218
	movss	.LC43(%rip), %xmm6	 #, tmp4406
	movss	%xmm6, 836(%rsp)	 # tmp4406, MEM[(float *)&st + 36B]
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, tmp2227
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movq	%rdx, 828(%rsp)	 # tmp2218, MEM <vector(2) float> [(float *)&st + 28B]
	movq	.LC105(%rip), %rdx	 #, tmp2220
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	shufps	$0, %xmm0, %xmm0	 # tmp2227
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movss	%xmm6, 868(%rsp)	 # tmp4406, MEM[(float *)&st + 68B]
	movss	%xmm6, 900(%rsp)	 # tmp4406, MEM[(float *)&st + 100B]
	movss	%xmm6, 932(%rsp)	 # tmp4406, MEM[(float *)&st + 132B]
	movq	%rdx, 860(%rsp)	 # tmp2220, MEM <vector(2) float> [(float *)&st + 60B]
	movq	.LC106(%rip), %rdx	 #, tmp2222
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movlps	%xmm0, 1148(%rsp)	 # tmp2227, MEM <vector(4) float> [(float *)&st + 348B]
	movhps	%xmm0, 1156(%rsp)	 # tmp2227, MEM <vector(4) float> [(float *)&st + 348B]
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movq	%rdx, 892(%rsp)	 # tmp2222, MEM <vector(2) float> [(float *)&st + 92B]
	movq	.LC107(%rip), %rdx	 #, tmp2224
	movq	%rdx, 924(%rsp)	 # tmp2224, MEM <vector(2) float> [(float *)&st + 124B]
	movl	%eax, %edx	 # FORMANTS.0_497, bnd.414_3029
	shrl	$2, %edx	 #, bnd.414_3029
	cmpl	$1, %edx	 #, bnd.414_3029
	jne	.L1690	 #,
.L319:
	movl	%eax, %edx	 # FORMANTS.0_497, _1445
	andl	$-4, %edx	 #, _1445
	testb	$3, %al	 #, FORMANTS.0_497
	je	.L317	 #,
.L318:
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movslq	%edx, %rcx	 # _1445, _1445
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movss	400(%rsp,%rcx,4), %xmm1	 # def_b[k_3027], def_b[k_3027]
	movq	%rcx, %r8	 # _1445, tmp2246
	movss	352(%rsp,%rcx,4), %xmm0	 # def_f[k_3027], _2918
	salq	$5, %r8	 #, tmp2246
 # pms.c:1401:         st.formants[k].gain = 1.0f;
	movss	%xmm6, 836(%rsp,%r8)	 # tmp4406, st.formants[k_3027].gain
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	unpcklps	%xmm1, %xmm0	 # def_b[k_3027], _2918
	movlps	%xmm0, 828(%rsp,%r8)	 # _2918, MEM <vector(2) float> [(float *)vectp.471_2790]
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movss	%xmm6, 1148(%rsp,%rcx,4)	 # tmp4406, st.formant_gains[k_3027]
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	leal	1(%rdx), %ecx	 #, k
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	cmpl	%ecx, %eax	 # k, FORMANTS.0_497
	jle	.L317	 #,
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movslq	%ecx, %rcx	 # k, k
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	addl	$2, %edx	 #, k
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movss	400(%rsp,%rcx,4), %xmm1	 # def_b[k_4407], def_b[k_4407]
	movq	%rcx, %r8	 # k, tmp2263
	movss	352(%rsp,%rcx,4), %xmm0	 # def_f[k_4407], _2788
	salq	$5, %r8	 #, tmp2263
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	cmpl	%edx, %eax	 # k, FORMANTS.0_497
 # pms.c:1401:         st.formants[k].gain = 1.0f;
	movss	%xmm6, 836(%rsp,%r8)	 # tmp4406, st.formants[k_4407].gain
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	unpcklps	%xmm1, %xmm0	 # def_b[k_4407], _2788
	movlps	%xmm0, 828(%rsp,%r8)	 # _2788, MEM <vector(2) float> [(float *)vectp.473_2787]
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movss	%xmm6, 1148(%rsp,%rcx,4)	 # tmp4406, st.formant_gains[k_4407]
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	jle	.L317	 #,
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movslq	%edx, %rdx	 # k, k
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movss	400(%rsp,%rdx,4), %xmm1	 # def_b[k_4416], def_b[k_4416]
	movq	%rdx, %rax	 # k, tmp2280
	movss	352(%rsp,%rdx,4), %xmm0	 # def_f[k_4416], _264
	salq	$5, %rax	 #, tmp2280
 # pms.c:1401:         st.formants[k].gain = 1.0f;
	movss	%xmm6, 836(%rsp,%rax)	 # tmp4406, st.formants[k_4416].gain
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	unpcklps	%xmm1, %xmm0	 # def_b[k_4416], _264
	movlps	%xmm0, 828(%rsp,%rax)	 # _264, MEM <vector(2) float> [(float *)vectp.475_252]
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movss	%xmm6, 1148(%rsp,%rdx,4)	 # tmp4406, st.formant_gains[k_4416]
.L317:
 # pms.c:1405:     if (argc < 2) { print_help(); return 0; }
	cmpl	$1, %esi	 #, argc
	jle	.L1691	 #,
 # pms.c:1167:     int explicit_formant[MAX_FORMANTS]={0};
	movq	$0, 448(%rsp)	 #, MEM[(int[10] *)_1363]
 # pms.c:1166:     int mode_set = 0;
	xorl	%ebp, %ebp	 # mode_set
 # pms.c:1173:     for (int i=1;i<argc;i++) {
	movl	$1, %r13d	 #, i
 # pms.c:1167:     int explicit_formant[MAX_FORMANTS]={0};
	movq	$0, 456(%rsp)	 #, MEM[(int[10] *)_1363]
	movq	$0, 464(%rsp)	 #, MEM[(int[10] *)_1363]
	movq	$0, 472(%rsp)	 #, MEM[(int[10] *)_1363]
	movq	$0, 480(%rsp)	 #, MEM[(int[10] *)_1363]
 # pms.c:1168:     int explicit_bw     [MAX_FORMANTS]={0};
	movq	$0, 496(%rsp)	 #, MEM[(int[10] *)_1364]
	movq	$0, 504(%rsp)	 #, MEM[(int[10] *)_1364]
	movq	$0, 512(%rsp)	 #, MEM[(int[10] *)_1364]
	movq	$0, 520(%rsp)	 #, MEM[(int[10] *)_1364]
	movq	$0, 528(%rsp)	 #, MEM[(int[10] *)_1364]
	jmp	.L431	 #
	.p2align 4,,10
	.p2align 3
.L1694:
 # pms.c:1181:         if (!strcmp(a,"--spec")||!strcmp(a,"--phon-spec")) {
	leaq	.LC118(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1181:         if (!strcmp(a,"--spec")||!strcmp(a,"--phon-spec")) {
	testl	%eax, %eax	 # _172
	je	.L327	 #,
 # pms.c:1187:         if (!strcmp(a,"--phoneme")) {
	leaq	.LC121(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1187:         if (!strcmp(a,"--phoneme")) {
	testl	%eax, %eax	 # _183
	jne	.L333	 #,
 # pms.c:1188:             NEED_VAL(a);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1189:             if(mode_set&&st->mode!=MODE_PHONEME){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	testl	%ebp, %ebp	 # mode_set
	je	.L335	 #,
 # pms.c:1189:             if(mode_set&&st->mode!=MODE_PHONEME){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	cmpl	$2, 800(%rsp)	 #, st.mode
	jne	.L336	 #,
.L335:
 # pms.c:1190:             st->mode=MODE_PHONEME; strncpy(st->input_filename,argv[++i],511);
	movl	$2, 800(%rsp)	 #, st.mode
	.p2align 4,,10
	.p2align 3
.L1658:
 # pms.c:1184:             st->mode=MODE_SPEC; strncpy(st->input_filename,argv[++i],511);
	movslq	%ebx, %rax	 # i, _178
 # pms.c:1184:             st->mode=MODE_SPEC; strncpy(st->input_filename,argv[++i],511);
	movl	$511, %r8d	 #,
	movq	(%rdi,%rax,8), %rdx	 #* argv, *_180
	leaq	1824(%rsp), %rcx	 #, tmp2312
	call	strncpy	 #
.L337:
 # pms.c:1185:             mode_set=1; continue;
	movl	$1, %ebp	 #, mode_set
.L332:
 # pms.c:1173:     for (int i=1;i<argc;i++) {
	leal	1(%rbx), %r13d	 #, i
 # pms.c:1173:     for (int i=1;i<argc;i++) {
	cmpl	%r13d, %esi	 # i, argc
	jle	.L1692	 #,
.L431:
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	leaq	.LC112(%rip), %rdx	 #,
 # pms.c:1174:         const char *a = argv[i];
	movslq	%r13d, %r14	 # i, _164
 # pms.c:1174:         const char *a = argv[i];
	movq	(%rdi,%r14,8), %r12	 # *_166, a
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	testl	%eax, %eax	 # _168
	je	.L323	 #,
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	cmpb	$45, (%r12)	 #, MEM <char[1:3]> [(void *)a_167]
	jne	.L325	 #,
	cmpb	$104, 1(%r12)	 #, MEM <char[1:3]> [(void *)a_167]
	jne	.L325	 #,
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	cmpb	$0, 2(%r12)	 #, MEM <char[1:3]> [(void *)a_167]
	je	.L323	 #,
.L325:
 # pms.c:1179:         if (!strcmp(a,"--version"))              { print_version(); exit(0); }
	leaq	.LC113(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1179:         if (!strcmp(a,"--version"))              { print_version(); exit(0); }
	testl	%eax, %eax	 # _170
	je	.L1693	 #,
 # pms.c:1181:         if (!strcmp(a,"--spec")||!strcmp(a,"--phon-spec")) {
	leaq	.LC117(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1188:             NEED_VAL(a);
	leal	1(%r13), %ebx	 #, i
 # pms.c:1181:         if (!strcmp(a,"--spec")||!strcmp(a,"--phon-spec")) {
	testl	%eax, %eax	 # _171
	jne	.L1694	 #,
.L327:
 # pms.c:1182:             NEED_VAL(a);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	testl	%ebp, %ebp	 # mode_set
	je	.L331	 #,
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	cmpl	$1, 800(%rsp)	 #, st.mode
	jne	.L336	 #,
.L331:
 # pms.c:1184:             st->mode=MODE_SPEC; strncpy(st->input_filename,argv[++i],511);
	movl	$1, 800(%rsp)	 #, st.mode
	jmp	.L1658	 #
	.p2align 4,,10
	.p2align 3
.L333:
 # pms.c:1193:         if (!strcmp(a,"--demo")) {
	leaq	.LC122(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1193:         if (!strcmp(a,"--demo")) {
	testl	%eax, %eax	 # _193
	jne	.L338	 #,
 # pms.c:1194:             NEED_VAL(a);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1195:             if(mode_set&&st->mode!=MODE_DEMO){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	testl	%ebp, %ebp	 # mode_set
	je	.L340	 #,
 # pms.c:1195:             if(mode_set&&st->mode!=MODE_DEMO){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	cmpl	$0, 800(%rsp)	 #, st.mode
	jne	.L336	 #,
.L340:
 # pms.c:1198:             strncpy(st->demo_voice,vt,31);
	leaq	2336(%rsp), %rcx	 #, tmp2327
 # pms.c:1197:             const char *vt=argv[++i];
	movslq	%ebx, %rax	 # i, _198
 # pms.c:1196:             st->mode=MODE_DEMO;
	xorl	%r8d, %r8d	 #
 # pms.c:1197:             const char *vt=argv[++i];
	movq	(%rdi,%rax,8), %rbp	 # *_200, vt
 # pms.c:1196:             st->mode=MODE_DEMO;
	movl	%r8d, 800(%rsp)	 #, st.mode
 # pms.c:1198:             strncpy(st->demo_voice,vt,31);
	movl	$31, %r8d	 #,
	movq	%rbp, %rdx	 # vt,
	call	strncpy	 #
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	movq	__imp__stricmp(%rip), %r12	 #, tmp2329
	leaq	.LC90(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # vt,
	call	*%r12	 # tmp2329
 # pms.c:1199:             if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
	testl	%eax, %eax	 # _203
	je	.L1695	 #,
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC91(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # vt,
	call	*%r12	 # tmp2329
 # pms.c:1200:             else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
	testl	%eax, %eax	 # _204
	jne	.L342	 #,
 # pms.c:1200:             else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
	movl	$1, 808(%rsp)	 #, st.voice_type
	jmp	.L337	 #
.L1690:
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movq	.LC108(%rip), %rdx	 #, tmp2229
	movss	%xmm6, 964(%rsp)	 # tmp4406, MEM[(float *)&st + 164B]
	movss	%xmm6, 996(%rsp)	 # tmp4406, MEM[(float *)&st + 196B]
	movss	%xmm6, 1028(%rsp)	 # tmp4406, MEM[(float *)&st + 228B]
	movss	%xmm6, 1060(%rsp)	 # tmp4406, MEM[(float *)&st + 260B]
	movq	%rdx, 956(%rsp)	 # tmp2229, MEM <vector(2) float> [(float *)&st + 156B]
	movq	.LC109(%rip), %rdx	 #, tmp2231
 # pms.c:1402:         st.formant_gains[k] = 1.0f;
	movups	%xmm0, 1164(%rsp)	 # tmp2227, MEM <vector(4) float> [(float *)&st + 364B]
 # pms.c:1399:         st.formants[k].freq = def_f[k];
	movq	%rdx, 988(%rsp)	 # tmp2231, MEM <vector(2) float> [(float *)&st + 188B]
	movq	.LC110(%rip), %rdx	 #, tmp2233
	movq	%rdx, 1020(%rsp)	 # tmp2233, MEM <vector(2) float> [(float *)&st + 220B]
	movq	.LC111(%rip), %rdx	 #, tmp2235
	movq	%rdx, 1052(%rsp)	 # tmp2235, MEM <vector(2) float> [(float *)&st + 252B]
	jmp	.L319	 #
.L338:
 # pms.c:1206:         if (!strcmp(a,"--sample-rate")){
	leaq	.LC124(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1206:         if (!strcmp(a,"--sample-rate")){
	testl	%eax, %eax	 # _207
	je	.L1696	 #,
 # pms.c:1211:         if (!strcmp(a,"--duration")){
	leaq	.LC126(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1211:         if (!strcmp(a,"--duration")){
	testl	%eax, %eax	 # _220
	jne	.L349	 #,
 # pms.c:1212:             NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1212:             NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
	movq	8(%rdi,%r14,8), %rcx	 # *_225, *_225
	call	atof	 #
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC84(%rip), %xmm1	 #, _231
 # pms.c:1212:             NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
	cvtsd2ss	%xmm0, %xmm0	 # _227, _228
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm0, %xmm1	 # _228, _231
	ja	.L351	 #,
	movss	.LC127(%rip), %xmm2	 #, tmp2363
	movaps	%xmm2, %xmm1	 # tmp2363, tmp2365
	cmpltss	%xmm0, %xmm1	 #, _228, tmp2365
	andps	%xmm1, %xmm2	 # tmp2365, tmp2366
	andnps	%xmm0, %xmm1	 # _228, tmp2367
	orps	%xmm2, %xmm1	 # tmp2366, _231
.L351:
 # pms.c:1212:             NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
	movss	%xmm1, 816(%rsp)	 # _231, st.duration_sec
 # pms.c:1212:             NEED_VAL(a); st->duration_sec=clampf((float)atof(argv[++i]),0.1f,30.0f); continue;
	jmp	.L332	 #
.L1691:
 # pms.c:1405:     if (argc < 2) { print_help(); return 0; }
	call	print_help	 #
.L322:
 # pms.c:1405:     if (argc < 2) { print_help(); return 0; }
	xorl	%eax, %eax	 # <retval>
.L316:
 # pms.c:1459: }
	movaps	2400(%rsp), %xmm6	 #,
	movaps	2416(%rsp), %xmm7	 #,
	movaps	2432(%rsp), %xmm8	 #,
	movaps	2448(%rsp), %xmm9	 #,
	movaps	2464(%rsp), %xmm10	 #,
	movaps	2480(%rsp), %xmm11	 #,
	movaps	2496(%rsp), %xmm12	 #,
	movaps	2512(%rsp), %xmm13	 #,
	movaps	2528(%rsp), %xmm14	 #,
	movaps	2544(%rsp), %xmm15	 #,
	addq	$2568, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L323:
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	call	print_help	 #
 # pms.c:1178:         if (!strcmp(a,"--help")||!strcmp(a,"-h")){ print_help(); exit(0); }
	xorl	%ecx, %ecx	 #
	call	exit	 #
.L1695:
 # pms.c:1199:             if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
	xorl	%ecx, %ecx	 #
	movl	%ecx, 808(%rsp)	 #, st.voice_type
	jmp	.L337	 #
.L349:
 # pms.c:1214:         if (!strcmp(a,"--f0")){
	leaq	.LC128(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1214:         if (!strcmp(a,"--f0")){
	testl	%eax, %eax	 # _232
	jne	.L353	 #,
 # pms.c:1215:             NEED_VAL(a); st->f0_hz=(float)atof(argv[++i]); explicit_f0=1; continue;
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1215:             NEED_VAL(a); st->f0_hz=(float)atof(argv[++i]); explicit_f0=1; continue;
	movq	8(%rdi,%r14,8), %rcx	 # *_237, *_237
	call	atof	 #
 # pms.c:1215:             NEED_VAL(a); st->f0_hz=(float)atof(argv[++i]); explicit_f0=1; continue;
	cvtsd2ss	%xmm0, %xmm0	 # _239, tmp2374
	movss	%xmm0, 820(%rsp)	 # tmp2374, st.f0_hz
 # pms.c:1215:             NEED_VAL(a); st->f0_hz=(float)atof(argv[++i]); explicit_f0=1; continue;
	jmp	.L332	 #
.L1693:
 # pms.c:1128:     printf("poor man's synthesizer version %s version format %s\n", VERSION_STR, VERSION_FMT);
	leaq	.LC116(%rip), %rcx	 #,
	leaq	.LC114(%rip), %r8	 #,
	leaq	.LC115(%rip), %rdx	 #,
	call	printf	 #
 # pms.c:1179:         if (!strcmp(a,"--version"))              { print_version(); exit(0); }
	xorl	%ecx, %ecx	 #
	call	exit	 #
.L1659:
 # pms.c:1300:             NEED_VAL(a); const char *f=argv[++i];
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1300:             NEED_VAL(a); const char *f=argv[++i];
	leaq	.LC119(%rip), %rdx	 #,
	movq	%r12, %r8	 # a,
	movq	%rax, %rcx	 # _456,
	call	fprintf	 #
.L330:
 # pms.c:1407:     if (parse_args(argc, argv, &st) < 0) return 1;
	movl	$1, %eax	 #, <retval>
	jmp	.L316	 #
.L1696:
 # pms.c:1207:             NEED_VAL(a); st->sample_rate=atoi(argv[++i]);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1207:             NEED_VAL(a); st->sample_rate=atoi(argv[++i]);
	movq	8(%rdi,%r14,8), %rcx	 # *_212, *_212
	call	atoi	 #
	movl	%eax, %r12d	 #, _214
 # pms.c:1135:     for(int i=0;i<5;i++) if(sr==ok[i]) return 1;
	cmpl	$8000, %eax	 #, _214
 # pms.c:1207:             NEED_VAL(a); st->sample_rate=atoi(argv[++i]);
	movl	%eax, 812(%rsp)	 # _214, st.sample_rate
 # pms.c:1135:     for(int i=0;i<5;i++) if(sr==ok[i]) return 1;
	sete	%al	 #, _2039
	cmpl	$16000, %r12d	 #, _214
	sete	%dl	 #, _2045
	orl	%edx, %eax	 # _2045, _2036
	cmpl	$22050, %r12d	 #, _214
	sete	%dl	 #, _2032
	orl	%edx, %eax	 # _2032, _2028
	cmpl	$44100, %r12d	 #, _214
	sete	%dl	 #, _2019
	orb	%dl, %al	 # _2019, tmp4974
	jne	.L332	 #,
	cmpl	$48000, %r12d	 #, _214
	je	.L332	 #,
 # pms.c:1208:             if(!valid_sr(st->sample_rate)){fprintf(stderr,"Error: invalid sample rate %d\n",st->sample_rate);return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1208:             if(!valid_sr(st->sample_rate)){fprintf(stderr,"Error: invalid sample rate %d\n",st->sample_rate);return -1;}
	leaq	.LC125(%rip), %rdx	 #,
	movl	%r12d, %r8d	 # _214,
	movq	%rax, %rcx	 # _219,
	call	fprintf	 #
	jmp	.L330	 #
.L342:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC92(%rip), %rdx	 #,
	movq	%rbp, %rcx	 # vt,
	call	*%r12	 # tmp2329
 # pms.c:1201:             else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
	testl	%eax, %eax	 # _205
	jne	.L343	 #,
 # pms.c:1201:             else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
	movl	$2, 808(%rsp)	 #, st.voice_type
	jmp	.L337	 #
.L336:
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	movl	$30, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	.LC120(%rip), %rcx	 #,
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	movq	%rax, %r9	 #, _177
 # pms.c:1183:             if(mode_set&&st->mode!=MODE_SPEC){fprintf(stderr,"Error: conflicting mode flags\n");return -1;}
	call	fwrite	 #
	jmp	.L330	 #
.L1024:
	movss	.LC43(%rip), %xmm6	 #, tmp4406
 # pms.c:1398:     for(int k=0;k<FORMANTS;k++){
	xorl	%edx, %edx	 # _1445
	jmp	.L318	 #
.L353:
 # pms.c:1217:         if (!strcmp(a,"--synthesis")){
	leaq	.LC129(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1217:         if (!strcmp(a,"--synthesis")){
	testl	%eax, %eax	 # _241
	je	.L1697	 #,
 # pms.c:1224:         if (!strcmp(a,"--amplitude")){
	leaq	.LC131(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1224:         if (!strcmp(a,"--amplitude")){
	testl	%eax, %eax	 # _251
	jne	.L360	 #,
 # pms.c:1225:             NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1225:             NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
	movq	8(%rdi,%r14,8), %rcx	 # *_256, *_256
	call	atof	 #
 # pms.c:1225:             NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
	pxor	%xmm1, %xmm1	 # _259
	cvtsd2ss	%xmm0, %xmm1	 # _258, _259
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _262
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _259, _262
	ja	.L362	 #,
	movss	.LC43(%rip), %xmm2	 #, tmp2392
	movaps	%xmm2, %xmm0	 # tmp2392, tmp2394
	cmpltss	%xmm1, %xmm0	 #, _259, tmp2394
	andps	%xmm0, %xmm2	 # tmp2394, tmp2395
	andnps	%xmm1, %xmm0	 # _259, tmp2396
	orps	%xmm2, %xmm0	 # tmp2395, _262
.L362:
 # pms.c:1225:             NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
	movss	%xmm0, 824(%rsp)	 # _262, st.output_amplitude
 # pms.c:1225:             NEED_VAL(a); st->output_amplitude=clampf((float)atof(argv[++i]),0.f,1.f); continue;
	jmp	.L332	 #
.L1692:
 # pms.c:1321:     if (mode_set || st->voice_type != VOICE_NATURAL) {
	movl	808(%rsp), %edx	 # st.voice_type, _475
 # pms.c:1321:     if (mode_set || st->voice_type != VOICE_NATURAL) {
	orl	%edx, %ebp	 # _475, tmp4975
	je	.L1698	 #,
 # pms.c:1323:         if (st->voice_type == VOICE_WHISPER)   vp = &g_preset_whisper;
	cmpl	$1, %edx	 #, _475
	je	.L1035	 #,
 # pms.c:1324:         if (st->voice_type == VOICE_IMPULSIVE) vp = &g_preset_impulsive;
	leaq	g_preset_impulsive(%rip), %rax	 #, vp
 # pms.c:1324:         if (st->voice_type == VOICE_IMPULSIVE) vp = &g_preset_impulsive;
	cmpl	$2, %edx	 #, _475
	jne	.L1699	 #,
.L435:
 # pms.c:1141:     for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %ebx	 # FORMANTS, FORMANTS.1_5
	testl	%ebx, %ebx	 # FORMANTS.1_5
	jle	.L442	 #,
	leal	-1(%rbx), %edx	 #, _2930
	cmpl	$2, %edx	 #, _2930
	jbe	.L1037	 #,
	leaq	828(%rsp), %rdx	 #, ivtmp.921
	movl	%ebx, %r8d	 # FORMANTS.1_5, _1907
	xorl	%ecx, %ecx	 # ivtmp.917
	shrl	$2, %r8d	 #, _1907
	salq	$4, %r8	 #, _1906
.L440:
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movaps	(%rax,%rcx), %xmm0	 # MEM <const vector(4) float> [(float *)vp_477 + ivtmp.917_1927 * 1], vect__537.399
	subq	$-128, %rdx	 #, ivtmp.921
 # pms.c:1143:         st->formants[k].bw   = vp->bw  [k];
	movups	40(%rax,%rcx), %xmm2	 # MEM <const vector(4) float> [(float *)vp_477 + 40B + ivtmp.917_1927 * 1], MEM <const vector(4) float> [(float *)vp_477 + 40B + ivtmp.917_1927 * 1]
	addq	$16, %rcx	 #, ivtmp.917
	movaps	%xmm0, %xmm1	 # vect__537.399, _2945
	unpcklps	%xmm2, %xmm1	 # MEM <const vector(4) float> [(float *)vp_477 + 40B + ivtmp.917_1927 * 1], _2945
	unpckhps	%xmm2, %xmm0	 # MEM <const vector(4) float> [(float *)vp_477 + 40B + ivtmp.917_1927 * 1], _2946
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movq	%xmm1, -128(%rdx)	 # _2945, MEM <unsigned long long> [(float *)_1913]
	movhps	%xmm1, -96(%rdx)	 # _2945, MEM <unsigned long long> [(float *)_1913 + 32B]
	movq	%xmm0, -64(%rdx)	 # _2946, MEM <unsigned long long> [(float *)_1913 + 64B]
	movhps	%xmm0, -32(%rdx)	 # _2946, MEM <unsigned long long> [(float *)_1913 + 96B]
	cmpq	%rcx, %r8	 # ivtmp.917, _1906
	jne	.L440	 #,
	movl	%ebx, %edx	 # FORMANTS.1_5, tmp.406
	andl	$-4, %edx	 #, tmp.406
	cmpl	%edx, %ebx	 # tmp.406, FORMANTS.1_5
	movl	%edx, %ecx	 # tmp.406,
	je	.L442	 #,
.L439:
	movl	%ebx, %r8d	 # FORMANTS.1_5, niters.403
	subl	%ecx, %r8d	 # niters_vector_mult_vf.395, niters.403
	cmpl	$1, %r8d	 #, niters.403
	je	.L444	 #,
	movq	64(%rsp), %rsi	 # %sfp, ivtmp.699
	movq	%rcx, %r9	 # _2987, _3002
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movq	(%rax,%rcx,4), %xmm0	 # MEM <const vector(2) float> [(float *)vectp_vp.408_2986], vect__2922.409
	salq	$5, %r9	 #, _3002
	testb	$1, %r8b	 #, niters.403
 # pms.c:1143:         st->formants[k].bw   = vp->bw  [k];
	movq	40(%rax,%rcx,4), %xmm1	 # MEM <const vector(2) float> [(float *)vectp_vp.411_2992], vect__2924.412
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movaps	%xmm0, %xmm2	 # vect__2922.409, _2999
	unpcklps	%xmm1, %xmm2	 # vect__2924.412, _2999
	unpcklps	%xmm1, %xmm0	 # vect__2924.412, _3000
	movlps	%xmm2, 28(%rsi,%r9)	 # _2999, MEM <vector(2) float> [(float *)_3004]
	shufps	$78, %xmm0, %xmm0	 #, _3000, _3000
	movlps	%xmm0, 60(%rsi,%r9)	 # _3000, MEM <vector(2) float> [(float *)_3004 + 32B]
	je	.L442	 #,
	andl	$-2, %r8d	 #, niters_vector_mult_vf.405_2983
	addl	%r8d, %edx	 # niters_vector_mult_vf.405_2983, tmp.406
.L444:
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movslq	%edx, %rdx	 # tmp.406, tmp.406
 # pms.c:1142:         st->formants[k].freq = vp->freq[k];
	movss	40(%rax,%rdx,4), %xmm1	 # vp_477->bw[k_2980], vp_477->bw[k_2980]
	movss	(%rax,%rdx,4), %xmm0	 # vp_477->freq[k_2980], _4483
	salq	$5, %rdx	 #, tmp2651
	unpcklps	%xmm1, %xmm0	 # vp_477->bw[k_2980], _4483
	movlps	%xmm0, 828(%rsp,%rdx)	 # _4483, MEM <vector(2) float> [(float *)vectp.479_4482]
.L442:
 # pms.c:1145:     st->voicing_amp       = vp->voicing_amp;
	movaps	80(%rax), %xmm0	 # MEM <const vector(4) float> [(float *)vp_477 + 80B], MEM <const vector(4) float> [(float *)vp_477 + 80B]
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # FORMANTS.1_5
 # pms.c:1150:     st->vibrato_rate_hz   = vp->vibrato_rate;
	movq	100(%rax), %rdx	 # MEM <const vector(2) float> [(float *)vp_477 + 100B], vect__546.489_4473
 # pms.c:1145:     st->voicing_amp       = vp->voicing_amp;
	movaps	96(%rax), %xmm1	 # MEM <const vector(4) float> [(float *)vp_477 + 96B], MEM <const vector(4) float> [(float *)vp_477 + 96B]
	shufps	$160, %xmm0, %xmm1	 #, MEM <const vector(4) float> [(float *)vp_477 + 80B], tmp2623
	shufps	$36, %xmm1, %xmm0	 #, tmp2623, vect__541.484
 # pms.c:1148:     st->f0_hz             = vp->f0;
	movss	92(%rax), %xmm1	 # vp_477->f0, vp_477->f0
 # pms.c:1145:     st->voicing_amp       = vp->voicing_amp;
	movups	%xmm0, 1188(%rsp)	 # vect__541.484, MEM <vector(4) float> [(float *)&st + 388B]
 # pms.c:1152:     st->shimmer_percent   = vp->shimmer_pct;
	movss	108(%rax), %xmm0	 # vp_477->shimmer_pct, vp_477->shimmer_pct
 # pms.c:1150:     st->vibrato_rate_hz   = vp->vibrato_rate;
	movq	%rdx, 1204(%rsp)	 # vect__546.489_4473, MEM <vector(2) float> [(float *)&st + 404B]
 # pms.c:1148:     st->f0_hz             = vp->f0;
	movss	%xmm1, 820(%rsp)	 # vp_477->f0, st.f0_hz
 # pms.c:1152:     st->shimmer_percent   = vp->shimmer_pct;
	movss	%xmm0, 1212(%rsp)	 # vp_477->shimmer_pct, st.shimmer_percent
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	jle	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 448(%rsp)	 #, MEM[(int[10] *)_1363][0]
	jne	.L446	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	(%rax), %xmm0	 # vp_477->freq[0], vp_477->freq[0]
	movss	%xmm0, 828(%rsp)	 # vp_477->freq[0], st.formants[0].freq
.L446:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 496(%rsp)	 #, MEM[(int[10] *)_1364][0]
	je	.L1700	 #,
.L447:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$1, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 452(%rsp)	 #, MEM[(int[10] *)_1363][1]
	jne	.L449	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	4(%rax), %xmm0	 # vp_477->freq[1], vp_477->freq[1]
	movss	%xmm0, 860(%rsp)	 # vp_477->freq[1], st.formants[1].freq
.L449:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 500(%rsp)	 #, MEM[(int[10] *)_1364][1]
	je	.L1701	 #,
.L450:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$2, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 456(%rsp)	 #, MEM[(int[10] *)_1363][2]
	jne	.L451	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	8(%rax), %xmm0	 # vp_477->freq[2], vp_477->freq[2]
	movss	%xmm0, 892(%rsp)	 # vp_477->freq[2], st.formants[2].freq
.L451:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 504(%rsp)	 #, MEM[(int[10] *)_1364][2]
	je	.L1702	 #,
.L452:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 460(%rsp)	 #, MEM[(int[10] *)_1363][3]
	jne	.L453	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	12(%rax), %xmm0	 # vp_477->freq[3], vp_477->freq[3]
	movss	%xmm0, 924(%rsp)	 # vp_477->freq[3], st.formants[3].freq
.L453:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 508(%rsp)	 #, MEM[(int[10] *)_1364][3]
	je	.L1703	 #,
.L454:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 464(%rsp)	 #, MEM[(int[10] *)_1363][4]
	jne	.L455	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	16(%rax), %xmm0	 # vp_477->freq[4], vp_477->freq[4]
	movss	%xmm0, 956(%rsp)	 # vp_477->freq[4], st.formants[4].freq
.L455:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 512(%rsp)	 #, MEM[(int[10] *)_1364][4]
	jne	.L456	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	56(%rax), %xmm0	 # vp_477->bw[4], vp_477->bw[4]
	movss	%xmm0, 960(%rsp)	 # vp_477->bw[4], st.formants[4].bw
.L456:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 468(%rsp)	 #, MEM[(int[10] *)_1363][5]
	jne	.L457	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	20(%rax), %xmm0	 # vp_477->freq[5], vp_477->freq[5]
	movss	%xmm0, 988(%rsp)	 # vp_477->freq[5], st.formants[5].freq
.L457:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 516(%rsp)	 #, MEM[(int[10] *)_1364][5]
	jne	.L458	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	60(%rax), %xmm0	 # vp_477->bw[5], vp_477->bw[5]
	movss	%xmm0, 992(%rsp)	 # vp_477->bw[5], st.formants[5].bw
.L458:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 472(%rsp)	 #, MEM[(int[10] *)_1363][6]
	jne	.L459	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	24(%rax), %xmm0	 # vp_477->freq[6], vp_477->freq[6]
	movss	%xmm0, 1020(%rsp)	 # vp_477->freq[6], st.formants[6].freq
.L459:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 520(%rsp)	 #, MEM[(int[10] *)_1364][6]
	jne	.L460	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	64(%rax), %xmm0	 # vp_477->bw[6], vp_477->bw[6]
	movss	%xmm0, 1024(%rsp)	 # vp_477->bw[6], st.formants[6].bw
.L460:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 476(%rsp)	 #, MEM[(int[10] *)_1363][7]
	jne	.L461	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	28(%rax), %xmm0	 # vp_477->freq[7], vp_477->freq[7]
	movss	%xmm0, 1052(%rsp)	 # vp_477->freq[7], st.formants[7].freq
.L461:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 524(%rsp)	 #, MEM[(int[10] *)_1364][7]
	jne	.L462	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	68(%rax), %xmm0	 # vp_477->bw[7], vp_477->bw[7]
	movss	%xmm0, 1056(%rsp)	 # vp_477->bw[7], st.formants[7].bw
.L462:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 480(%rsp)	 #, MEM[(int[10] *)_1363][8]
	jne	.L463	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	32(%rax), %xmm0	 # vp_477->freq[8], vp_477->freq[8]
	movss	%xmm0, 1084(%rsp)	 # vp_477->freq[8], st.formants[8].freq
.L463:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 528(%rsp)	 #, MEM[(int[10] *)_1364][8]
	jne	.L464	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	72(%rax), %xmm0	 # vp_477->bw[8], vp_477->bw[8]
	movss	%xmm0, 1088(%rsp)	 # vp_477->bw[8], st.formants[8].bw
.L464:
 # pms.c:1326:         for(int k=0;k<FORMANTS;k++){
	cmpl	$9, %ebx	 #, FORMANTS.1_5
	je	.L438	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	cmpl	$0, 484(%rsp)	 #, MEM[(int[10] *)_1363][9]
	jne	.L465	 #,
 # pms.c:1327:             if(!explicit_formant[k]) st->formants[k].freq = vp->freq[k];
	movss	36(%rax), %xmm0	 # vp_477->freq[9], vp_477->freq[9]
	movss	%xmm0, 1116(%rsp)	 # vp_477->freq[9], st.formants[9].freq
.L465:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	cmpl	$0, 532(%rsp)	 #, MEM[(int[10] *)_1364][9]
	jne	.L438	 #,
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	76(%rax), %xmm0	 # vp_477->bw[9], vp_477->bw[9]
	movss	%xmm0, 1120(%rsp)	 # vp_477->bw[9], st.formants[9].bw
.L438:
 # pms.c:1409:     if (FORMANTS > MAX_FORMANTS || FORMANTS < 1) {
	leal	-1(%rbx), %eax	 #, _7
 # pms.c:1409:     if (FORMANTS > MAX_FORMANTS || FORMANTS < 1) {
	cmpl	$9, %eax	 #, _7
	ja	.L1704	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1148(%rsp), %xmm0	 # st.formant_gains[0], _4230
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5483
	comiss	%xmm0, %xmm6	 # _4230, tmp5483
	jbe	.L468	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2676
	movss	%xmm0, 1148(%rsp)	 # tmp2676, st.formant_gains[0]
.L468:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 836(%rsp)	 # _4230, st.formants[0].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$1, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1152(%rsp), %xmm0	 # st.formant_gains[1], _4238
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5484
	comiss	%xmm0, %xmm6	 # _4238, tmp5484
	jbe	.L471	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2678
	movss	%xmm0, 1152(%rsp)	 # tmp2678, st.formant_gains[1]
.L471:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 868(%rsp)	 # _4238, st.formants[1].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$2, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1156(%rsp), %xmm0	 # st.formant_gains[2], _4246
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5485
	comiss	%xmm0, %xmm6	 # _4246, tmp5485
	jbe	.L473	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2680
	movss	%xmm0, 1156(%rsp)	 # tmp2680, st.formant_gains[2]
.L473:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 900(%rsp)	 # _4246, st.formants[2].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1160(%rsp), %xmm0	 # st.formant_gains[3], _4254
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5486
	comiss	%xmm0, %xmm6	 # _4254, tmp5486
	jbe	.L475	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2682
	movss	%xmm0, 1160(%rsp)	 # tmp2682, st.formant_gains[3]
.L475:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 932(%rsp)	 # _4254, st.formants[3].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1164(%rsp), %xmm0	 # st.formant_gains[4], _4262
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5487
	comiss	%xmm0, %xmm6	 # _4262, tmp5487
	jbe	.L477	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2684
	movss	%xmm0, 1164(%rsp)	 # tmp2684, st.formant_gains[4]
.L477:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 964(%rsp)	 # _4262, st.formants[4].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1168(%rsp), %xmm0	 # st.formant_gains[5], _4270
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5488
	comiss	%xmm0, %xmm6	 # _4270, tmp5488
	jbe	.L479	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2686
	movss	%xmm0, 1168(%rsp)	 # tmp2686, st.formant_gains[5]
.L479:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 996(%rsp)	 # _4270, st.formants[5].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1172(%rsp), %xmm0	 # st.formant_gains[6], _4278
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5489
	comiss	%xmm0, %xmm6	 # _4278, tmp5489
	jbe	.L481	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2688
	movss	%xmm0, 1172(%rsp)	 # tmp2688, st.formant_gains[6]
.L481:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 1028(%rsp)	 # _4278, st.formants[6].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1176(%rsp), %xmm0	 # st.formant_gains[7], _4286
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5490
	comiss	%xmm0, %xmm6	 # _4286, tmp5490
	ja	.L1705	 #,
.L483:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 1060(%rsp)	 # _4286, st.formants[7].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, FORMANTS.1_5
	je	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1180(%rsp), %xmm0	 # st.formant_gains[8], _4294
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5491
	comiss	%xmm0, %xmm6	 # _4294, tmp5491
	ja	.L1706	 #,
.L485:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 1092(%rsp)	 # _4294, st.formants[8].gain
 # pms.c:1414:     for(int k=0;k<FORMANTS;k++){
	cmpl	$10, %ebx	 #, FORMANTS.1_5
	jne	.L470	 #,
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	1184(%rsp), %xmm0	 # st.formant_gains[9], _9
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC166(%rip), %xmm6	 #, tmp5492
	comiss	%xmm0, %xmm6	 # _9, tmp5492
	ja	.L1707	 #,
.L487:
 # pms.c:1416:         st.formants[k].gain = st.formant_gains[k];
	movss	%xmm0, 1124(%rsp)	 # _9, st.formants[9].gain
.L470:
 # pms.c:1419:     if (st.mode == MODE_SPEC) {
	movl	800(%rsp), %eax	 # st.mode, _11
 # pms.c:1419:     if (st.mode == MODE_SPEC) {
	cmpl	$1, %eax	 #, _11
	je	.L1708	 #,
 # pms.c:1425:     } else if (st.mode == MODE_PHONEME) {
	cmpl	$2, %eax	 #, _11
	je	.L1709	 #,
.L494:
 # pms.c:1431:     if (st.verbose) verbose_print(&st);
	cmpl	$0, 2380(%rsp)	 #, st.verbose
	jne	.L1710	 #,
.L499:
 # pms.c:1434:     g_noise_state = (uint32_t)time(NULL) ^ 0xDEADC0DEu;
	xorl	%ecx, %ecx	 #
	call	_time64	 #
 # pms.c:812:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	movl	800(%rsp), %ebx	 # st.mode, _586
 # pms.c:1434:     g_noise_state = (uint32_t)time(NULL) ^ 0xDEADC0DEu;
	xorl	$-559038242, %eax	 #, tmp2776
 # pms.c:809:     int   sr  = st->sample_rate;
	movl	812(%rsp), %ecx	 # st.sample_rate, sr
 # pms.c:810:     float dur = st->duration_sec;
	movss	816(%rsp), %xmm0	 # st.duration_sec, dur
 # pms.c:1434:     g_noise_state = (uint32_t)time(NULL) ^ 0xDEADC0DEu;
	movl	%eax, g_noise_state(%rip)	 # tmp2776, g_noise_state
 # pms.c:812:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	cmpl	$2, %ebx	 #, _586
	je	.L1711	 #,
 # pms.c:818:     if (st->mode == MODE_SPEC) {
	cmpl	$1, %ebx	 #, _586
	jne	.L507	 #,
 # pms.c:819:         float needed = st->spec.duration_ms/1000.0f + 0.1f;
	movss	.LC51(%rip), %xmm6	 #, tmp4409
	movss	1268(%rsp), %xmm1	 # st.spec.duration_ms, st.spec.duration_ms
	divss	%xmm6, %xmm1	 # tmp4409, _602
 # pms.c:819:         float needed = st->spec.duration_ms/1000.0f + 0.1f;
	addss	.LC84(%rip), %xmm1	 #, needed
	movaps	%xmm1, %xmm2	 # needed, needed
	maxss	%xmm0, %xmm2	 # dur, needed
	movaps	%xmm2, %xmm0	 # _606, dur
.L507:
 # pms.c:823:     int N = (int)(dur * sr);
	pxor	%xmm8, %xmm8	 # _607
	cvtsi2ssl	%ecx, %xmm8	 # sr, _607
	mulss	%xmm8, %xmm0	 # _607, _609
 # pms.c:823:     int N = (int)(dur * sr);
	cvttss2sil	%xmm0, %eax	 # _609, N
 # pms.c:824:     if (N <= 0) N = sr * 2;
	testl	%eax, %eax	 # N
 # pms.c:823:     int N = (int)(dur * sr);
	movl	%eax, 228(%rsp)	 # N, %sfp
 # pms.c:824:     if (N <= 0) N = sr * 2;
	jg	.L513	 #,
 # pms.c:824:     if (N <= 0) N = sr * 2;
	leal	(%rcx,%rcx), %eax	 #, N
	movl	%eax, 228(%rsp)	 # N, %sfp
.L513:
 # pms.c:825:     if (N > MAX_SAMPLES) N = MAX_SAMPLES;
	movslq	228(%rsp), %rdi	 # %sfp,
	movl	$5760000, %eax	 #,
 # pms.c:827:     float *buf = (float*)calloc(N, sizeof(float));
	movl	$4, %edx	 #,
 # pms.c:825:     if (N > MAX_SAMPLES) N = MAX_SAMPLES;
	cmpl	%eax, %edi	 # tmp4973, N
	cmovle	%rdi, %rax	 #,,
 # pms.c:827:     float *buf = (float*)calloc(N, sizeof(float));
	movq	%rax, %rcx	 # _614,
 # pms.c:825:     if (N > MAX_SAMPLES) N = MAX_SAMPLES;
	movl	%eax, 72(%rsp)	 # _613, %sfp
 # pms.c:827:     float *buf = (float*)calloc(N, sizeof(float));
	movq	%rax, 312(%rsp)	 # _614, %sfp
	call	calloc	 #
 # pms.c:828:     if (!buf){ fprintf(stderr,"Error: out of memory (%d samples)\n",N); return -1; }
	testq	%rax, %rax	 # buf
 # pms.c:827:     float *buf = (float*)calloc(N, sizeof(float));
	movq	%rax, %rsi	 #, buf
 # pms.c:828:     if (!buf){ fprintf(stderr,"Error: out of memory (%d samples)\n",N); return -1; }
	je	.L1712	 #,
 # pms.c:832:                   st->aspiration_cutoff > 10.0f ? st->aspiration_cutoff : 500.0f,
	movss	1216(%rsp), %xmm6	 # st.aspiration_cutoff, _617
 # pms.c:831:     make_highpass(&asp,
	comiss	.LC137(%rip), %xmm6	 #, _617
	ja	.L515	 #,
 # pms.c:831:     make_highpass(&asp,
	movss	.LC93(%rip), %xmm6	 #, _617
.L515:
 # pms.c:836:                   st->frication_bandwidth   > 10.0f ? st->frication_bandwidth   : 2000.0f,
	movss	1224(%rsp), %xmm0	 # st.frication_bandwidth, _619
 # pms.c:834:     make_bandpass(&fric,
	comiss	.LC137(%rip), %xmm0	 #, _619
	ja	.L516	 #,
 # pms.c:834:     make_bandpass(&fric,
	movss	.LC94(%rip), %xmm0	 #, _619
.L516:
 # pms.c:835:                   st->frication_center      > 10.0f ? st->frication_center      : 4000.0f,
	movss	1220(%rsp), %xmm13	 # st.frication_center, _620
 # pms.c:834:     make_bandpass(&fric,
	comiss	.LC137(%rip), %xmm13	 #, _620
	ja	.L517	 #,
 # pms.c:834:     make_bandpass(&fric,
	movss	.LC95(%rip), %xmm13	 #, _620
.L517:
 # pms.c:135:     float r     = expf(-PI_F * bw_hz / sr);
	mulss	.LC185(%rip), %xmm0	 #, _1098
 # pms.c:135:     float r     = expf(-PI_F * bw_hz / sr);
	divss	%xmm8, %xmm0	 # _607, _1099
	call	expf	 #
 # pms.c:840:     for (int k=0;k<FORMANTS;k++) formant_reset(&st->formants[k]);
	movl	FORMANTS(%rip), %edi	 # FORMANTS, FORMANTS.36_775
 # pms.c:135:     float r     = expf(-PI_F * bw_hz / sr);
	movaps	%xmm0, %xmm12	 #, r
 # pms.c:840:     for (int k=0;k<FORMANTS;k++) formant_reset(&st->formants[k]);
	testl	%edi, %edi	 # FORMANTS.36_775
	jle	.L523	 #,
	cmpl	$1, %edi	 #, FORMANTS.36_775
	je	.L1043	 #,
	movl	%edi, %eax	 # FORMANTS.36_775, bnd.390
 # pms.c:71: static void formant_reset(Formant *f) { f->z1 = f->z2 = 0.0f; }
	xorl	%r14d, %r14d	 #
	shrl	%eax	 # bnd.390
	movq	%r14, 852(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 52B]
	cmpl	$1, %eax	 #, bnd.390
	movq	%r14, 884(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 84B]
	je	.L522	 #,
	xorl	%r13d, %r13d	 #
	cmpl	$2, %eax	 #, bnd.390
	movq	%r13, 916(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 116B]
	movq	%r13, 948(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 148B]
	je	.L522	 #,
	xorl	%r12d, %r12d	 #
	cmpl	$3, %eax	 #, bnd.390
	movq	%r12, 980(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 180B]
	movq	%r12, 1012(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 212B]
	je	.L522	 #,
	xorl	%ebp, %ebp	 #
	cmpl	$4, %eax	 #, bnd.390
	movq	%rbp, 1044(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 244B]
	movq	%rbp, 1076(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 276B]
	je	.L522	 #,
	xorl	%r11d, %r11d	 #
	movq	%r11, 1108(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 308B]
	movq	%r11, 1140(%rsp)	 #, MEM <unsigned long long> [(float *)&st + 340B]
.L522:
	movl	%edi, %eax	 # FORMANTS.36_775, k
	andl	$-2, %eax	 #, k
	testb	$1, %dil	 #, FORMANTS.36_775
	je	.L523	 #,
.L521:
	cltq
	xorl	%r10d, %r10d	 #
	salq	$5, %rax	 #, tmp2809
	movq	%r10, 852(%rsp,%rax)	 #, MEM <vector(2) float> [(float *)vectp.493_3532]
.L523:
 # pms.c:843:     st->lip_rad_z1    = 0.0f;
	movl	$0x00000000, 2392(%rsp)	 #, st.lip_rad_z1
 # pms.c:841:     st->pitch_phase   = 0.0f;
	xorl	%r15d, %r15d	 #
 # pms.c:849:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	cmpl	$2, %ebx	 #, _586
 # pms.c:841:     st->pitch_phase   = 0.0f;
	movq	%r15, 2384(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 1584B]
 # pms.c:849:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	je	.L519	 #,
.L1044:
 # pms.c:846:     float (*phon_sf)[MAX_FORMANTS] = NULL;
	xorl	%r9d, %r9d	 #
 # pms.c:845:     float  *phon_t0   = NULL;                                      
	xorl	%r13d, %r13d	 # phon_t0
 # pms.c:846:     float (*phon_sf)[MAX_FORMANTS] = NULL;
	movq	%r9, 280(%rsp)	 #, %sfp
	movq	%r9, 272(%rsp)	 #, %sfp
.L520:
 # pms.c:881:     float sm_coef = expf(-1.0f / (0.008f * sr));                                
	movss	.LC188(%rip), %xmm0	 #, _688
	movss	.LC99(%rip), %xmm1	 #, _689
	mulss	%xmm8, %xmm0	 # _607, _688
	divss	%xmm0, %xmm1	 # _688, _689
	movaps	%xmm1, %xmm0	 # _689,
	call	expf	 #
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movl	800(%rsp), %eax	 # st.mode, _691
 # pms.c:881:     float sm_coef = expf(-1.0f / (0.008f * sr));                                
	movaps	%xmm0, %xmm15	 #, sm_coef
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	cmpl	$2, %eax	 #, _691
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movl	%eax, 76(%rsp)	 # _691, %sfp
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	je	.L1713	 #,
.L536:
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movss	1188(%rsp), %xmm11	 # st.voicing_amp, sm_v
 # pms.c:883:     float sm_a    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].aspiration_amp : st->aspiration_amp;
	movss	1192(%rsp), %xmm9	 # st.aspiration_amp, sm_a
 # pms.c:884:     float sm_fr   = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].frication_amp  : st->frication_amp;
	movss	1196(%rsp), %xmm10	 # st.frication_amp, sm_fr
.L537:
 # pms.c:887:     for (int n = 0; n < N; n++) {
	cmpl	$0, 228(%rsp)	 #, %sfp
 # pms.c:1068:     if (st->normalize_output)
	movl	2372(%rsp), %ebp	 # st.normalize_output, pretmp_2785
 # pms.c:887:     for (int n = 0; n < N; n++) {
	jle	.L1714	 #,
 # pms.c:123:     float k    = tanf(PI_F * fc / sr);
	mulss	.LC189(%rip), %xmm6	 #, _1068
 # pms.c:123:     float k    = tanf(PI_F * fc / sr);
	divss	%xmm8, %xmm6	 # _607, _1068
	movaps	%xmm6, %xmm0	 # _1068, _1069
	call	tanf	 #
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movss	.LC190(%rip), %xmm7	 #, tmp2865
	movaps	%xmm0, %xmm2	 # k, _1071
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movss	.LC43(%rip), %xmm6	 #, tmp4406
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	mulss	%xmm7, %xmm2	 # tmp2865, _1071
 # pms.c:126:     b->b1 = -2.0f * norm;
	movss	.LC191(%rip), %xmm3	 #, _1076
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	mulss	%xmm0, %xmm0	 # k, _1073
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movaps	%xmm6, %xmm5	 # tmp4406, norm
 # pms.c:136:     float theta = TWO_PI_F * fc / sr;
	mulss	.LC192(%rip), %xmm13	 #, _1101
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movaps	%xmm2, %xmm1	 # _1071, _1072
	addss	%xmm6, %xmm1	 # tmp4406, _1072
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	addss	%xmm0, %xmm1	 # _1073, _1074
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	divss	%xmm1, %xmm5	 # _1074, norm
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	movaps	%xmm0, %xmm1	 # _1073, _1077
	subss	%xmm6, %xmm1	 # tmp4406, _1077
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	addss	%xmm1, %xmm1	 # _1077, _1078
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movss	%xmm5, 168(%rsp)	 # norm, %sfp
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	mulss	%xmm5, %xmm1	 # norm, _1078
 # pms.c:126:     b->b1 = -2.0f * norm;
	mulss	%xmm5, %xmm3	 # norm, _1076
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	movss	%xmm1, 176(%rsp)	 # _1078, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	movaps	%xmm6, %xmm1	 # tmp4406, _1080
 # pms.c:126:     b->b1 = -2.0f * norm;
	movss	%xmm3, 172(%rsp)	 # _1076, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	subss	%xmm2, %xmm1	 # _1071, _1080
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	addss	%xmm0, %xmm1	 # _1073, _1081
 # pms.c:136:     float theta = TWO_PI_F * fc / sr;
	movaps	%xmm13, %xmm0	 # _1101, _1101
	divss	%xmm8, %xmm0	 # _607, _1101
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	mulss	%xmm5, %xmm1	 # norm, _1081
 # pms.c:137:     b->b0 =  (1.0f - r);
	movaps	%xmm6, %xmm5	 # tmp4406, _1103
	subss	%xmm12, %xmm5	 # r, _1103
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	movss	%xmm1, 180(%rsp)	 # _1081, %sfp
 # pms.c:137:     b->b0 =  (1.0f - r);
	movss	%xmm5, 248(%rsp)	 # _1103, %sfp
 # pms.c:140:     b->a1 = -2.0f * r * cosf(theta);
	call	cosf	 #
 # pms.c:140:     b->a1 = -2.0f * r * cosf(theta);
	movss	.LC191(%rip), %xmm1	 #, _1104
	mulss	%xmm12, %xmm1	 # r, _1104
 # pms.c:141:     b->a2 =  r * r;
	mulss	%xmm12, %xmm12	 # r, r
 # pms.c:140:     b->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm0, %xmm1	 # _1105, _1104
 # pms.c:123:     float k    = tanf(PI_F * fc / sr);
	movss	.LC193(%rip), %xmm0	 #, tmp2884
 # pms.c:141:     b->a2 =  r * r;
	movss	%xmm12, 264(%rsp)	 # r, %sfp
 # pms.c:123:     float k    = tanf(PI_F * fc / sr);
	divss	%xmm8, %xmm0	 # _607, _1084
 # pms.c:140:     b->a1 = -2.0f * r * cosf(theta);
	movss	%xmm1, 252(%rsp)	 # _1104, %sfp
 # pms.c:123:     float k    = tanf(PI_F * fc / sr);
	call	tanf	 #
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movaps	%xmm6, %xmm5	 # tmp4406, norm
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	cmpl	$2, 76(%rsp)	 #, %sfp
 # pms.c:126:     b->b1 = -2.0f * norm;
	movss	.LC191(%rip), %xmm3	 #, _1091
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	mulss	%xmm0, %xmm7	 # k, _1086
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	movq	1232(%rsp), %r15	 # st.pitch_contour, pretmp_2544
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	mulss	%xmm0, %xmm0	 # k, _1088
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	sete	%dl	 #, _1993
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	testq	%r13, %r13	 # phon_t0
	setne	%al	 #, _1994
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movaps	%xmm7, %xmm1	 # _1086, _1087
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	andl	%eax, %edx	 # _1994, _1993
 # pms.c:1007:         int cascade = (st->filter_mode == FILTER_CASCADE);
	movl	804(%rsp), %eax	 # st.filter_mode, pretmp_2552
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	addss	%xmm6, %xmm1	 # tmp4406, _1087
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	movb	%dl, 150(%rsp)	 # _1993, %sfp
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	addss	%xmm0, %xmm1	 # _1088, _1089
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	divss	%xmm1, %xmm5	 # _1089, norm
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	movaps	%xmm0, %xmm1	 # _1088, _1092
	subss	%xmm6, %xmm1	 # tmp4406, _1092
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	addss	%xmm1, %xmm1	 # _1092, _1093
 # pms.c:124:     float norm = 1.0f / (1.0f + k * (float)M_SQRT2 + k * k);
	movss	%xmm5, 232(%rsp)	 # norm, %sfp
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	mulss	%xmm5, %xmm1	 # norm, _1093
 # pms.c:126:     b->b1 = -2.0f * norm;
	mulss	%xmm5, %xmm3	 # norm, _1091
 # pms.c:128:     b->a1 =  2.0f * (k * k - 1.0f) * norm;
	movss	%xmm1, 240(%rsp)	 # _1093, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	movaps	%xmm6, %xmm1	 # tmp4406, _1095
 # pms.c:126:     b->b1 = -2.0f * norm;
	movss	%xmm3, 236(%rsp)	 # _1091, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	subss	%xmm7, %xmm1	 # _1086, _1095
 # pms.c:884:     float sm_fr   = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].frication_amp  : st->frication_amp;
	movss	1196(%rsp), %xmm7	 # st.frication_amp, pretmp_2540
	movss	%xmm7, 140(%rsp)	 # pretmp_2540, %sfp
 # pms.c:890:         float f0        = st->f0_hz;
	movss	820(%rsp), %xmm7	 # st.f0_hz, pretmp_2542
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	addss	%xmm0, %xmm1	 # _1088, _1096
 # pms.c:878:     int ramp_on  = (int)(0.006f * sr);
	movss	.LC194(%rip), %xmm0	 #, _684
 # pms.c:890:         float f0        = st->f0_hz;
	movss	%xmm7, 152(%rsp)	 # pretmp_2542, %sfp
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	movss	1200(%rsp), %xmm7	 # st.vibrato_depth_hz, pretmp_2546
 # pms.c:878:     int ramp_on  = (int)(0.006f * sr);
	mulss	%xmm8, %xmm0	 # _607, _684
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	movss	%xmm7, 48(%rsp)	 # pretmp_2546, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	mulss	%xmm5, %xmm1	 # norm, _1096
 # pms.c:998:         if (st->jitter_percent > 0.0f)
	movss	1208(%rsp), %xmm7	 # st.jitter_percent, pretmp_2548
	movss	%xmm7, 80(%rsp)	 # pretmp_2548, %sfp
 # pms.c:1002:         if (st->shimmer_percent > 0.0f)
	movss	1212(%rsp), %xmm7	 # st.shimmer_percent, pretmp_2550
 # pms.c:878:     int ramp_on  = (int)(0.006f * sr);
	cvttss2sil	%xmm0, %edi	 # _684, ramp_on
 # pms.c:879:     int ramp_off = (int)(0.012f * sr);
	movss	.LC195(%rip), %xmm0	 #, _686
 # pms.c:1002:         if (st->shimmer_percent > 0.0f)
	movss	%xmm7, 84(%rsp)	 # pretmp_2550, %sfp
 # pms.c:129:     b->a2 =  (1.0f - k * (float)M_SQRT2 + k * k) * norm;
	movss	%xmm1, 244(%rsp)	 # _1096, %sfp
 # pms.c:879:     int ramp_off = (int)(0.012f * sr);
	mulss	%xmm8, %xmm0	 # _607, _686
 # pms.c:879:     int ramp_off = (int)(0.012f * sr);
	cvttss2sil	%xmm0, %r14d	 # _686, ramp_off
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	testl	%r14d, %r14d	 # ramp_off
	setg	151(%rsp)	 #, %sfp
 # pms.c:1007:         int cascade = (st->filter_mode == FILTER_CASCADE);
	movl	%eax, 56(%rsp)	 # pretmp_2552, %sfp
 # pms.c:1052:         if (st->lip_radiation_enabled) {
	movl	2376(%rsp), %eax	 # st.lip_radiation_enabled, pretmp_2560
 # pms.c:883:     float sm_a    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].aspiration_amp : st->aspiration_amp;
	movss	1192(%rsp), %xmm7	 # st.aspiration_amp, pretmp_2556
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %ebx	 # FORMANTS, pretmp_2554
 # pms.c:883:     float sm_a    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].aspiration_amp : st->aspiration_amp;
	movss	%xmm7, 144(%rsp)	 # pretmp_2556, %sfp
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movss	1188(%rsp), %xmm7	 # st.voicing_amp, pretmp_2558
 # pms.c:1052:         if (st->lip_radiation_enabled) {
	movl	%eax, 88(%rsp)	 # pretmp_2560, %sfp
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	movl	72(%rsp), %eax	 # %sfp, _613
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movss	%xmm7, 136(%rsp)	 # pretmp_2558, %sfp
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	movss	824(%rsp), %xmm7	 # st.output_amplitude, pretmp_2562
	movss	%xmm7, 92(%rsp)	 # pretmp_2562, %sfp
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	movl	%eax, %ecx	 # _613, _2564
	subl	%r14d, %ecx	 # ramp_off, _2564
	testl	%edi, %edi	 # ramp_on
	movl	%ecx, 96(%rsp)	 # _2564, %sfp
	jle	.L1045	 #,
	movss	.LC51(%rip), %xmm7	 #, tmp4409
	cmpl	%edi, %eax	 # ramp_on, _613
	movl	%eax, %r11d	 # _613, _738
	movslq	%ebx, %rcx	 # pretmp_2554, _4310
	cmovg	%edi, %r11d	 # _738,, ramp_on, _738
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	xorl	%r8d, %r8d	 #
	xorl	%r12d, %r12d	 # ivtmp.853
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	movl	%r14d, 308(%rsp)	 # ramp_off, %sfp
	movss	%xmm7, 100(%rsp)	 # tmp4409, %sfp
	movss	.LC204(%rip), %xmm7	 #, tmp4430
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	leal	-1(%rbx), %eax	 #,
	movss	%xmm11, 132(%rsp)	 # sm_v, %sfp
	movss	%xmm7, 104(%rsp)	 # tmp4430, %sfp
	pxor	%xmm7, %xmm7	 # _1031
	cvtsi2ssl	%edi, %xmm7	 # ramp_on, _1031
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	leaq	0(,%rcx,4), %r14	 #, _2896
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	movl	%eax, 268(%rsp)	 # _917, %sfp
	leaq	4(,%rax,4), %rax	 #, _2798
	movq	%rax, 216(%rsp)	 # _2798, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 196(%rsp)	 #, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 200(%rsp)	 #, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 204(%rsp)	 #, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 224(%rsp)	 #, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 108(%rsp)	 #, %sfp
 # pms.c:111: static void biquad_reset(Biquad *b) { b->z1 = b->z2 = 0.0f; }
	movl	$0x00000000, 128(%rsp)	 #, %sfp
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	movl	%r8d, 156(%rsp)	 #, %sfp
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	movl	%edi, 320(%rsp)	 # ramp_on, %sfp
	movl	%r11d, 192(%rsp)	 # _738, %sfp
	movl	%ebp, 324(%rsp)	 # pretmp_2785, %sfp
	movq	%rcx, 328(%rsp)	 # _4310, %sfp
	movq	%rsi, 184(%rsp)	 # buf, %sfp
	movss	%xmm7, 208(%rsp)	 # _1031, %sfp
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	pxor	%xmm7, %xmm7	 # tmp3113
	.p2align 4,,10
	.p2align 3
.L759:
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	pxor	%xmm14, %xmm14	 # _705
	cvtsi2ssl	%r12d, %xmm14	 # ivtmp.853, _705
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	movaps	%xmm14, %xmm2	 # _705, _706
	divss	%xmm8, %xmm2	 # _607, _706
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	mulss	100(%rsp), %xmm2	 # %sfp, t_ms
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	jle	.L553	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	828(%rsp), %xmm0	 # st.formants[0].freq, st.formants[0].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$1, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 448(%rsp)	 # st.formants[0].freq, MEM[(float[10] *)_1363][0]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1715	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	860(%rsp), %xmm0	 # st.formants[1].freq, st.formants[1].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$2, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 452(%rsp)	 # st.formants[1].freq, MEM[(float[10] *)_1363][1]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1716	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	892(%rsp), %xmm0	 # st.formants[2].freq, st.formants[2].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 456(%rsp)	 # st.formants[2].freq, MEM[(float[10] *)_1363][2]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	924(%rsp), %xmm0	 # st.formants[3].freq, st.formants[3].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 460(%rsp)	 # st.formants[3].freq, MEM[(float[10] *)_1363][3]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	956(%rsp), %xmm0	 # st.formants[4].freq, st.formants[4].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 464(%rsp)	 # st.formants[4].freq, MEM[(float[10] *)_1363][4]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	988(%rsp), %xmm0	 # st.formants[5].freq, st.formants[5].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 468(%rsp)	 # st.formants[5].freq, MEM[(float[10] *)_1363][5]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1020(%rsp), %xmm0	 # st.formants[6].freq, st.formants[6].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 472(%rsp)	 # st.formants[6].freq, MEM[(float[10] *)_1363][6]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1052(%rsp), %xmm0	 # st.formants[7].freq, st.formants[7].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 476(%rsp)	 # st.formants[7].freq, MEM[(float[10] *)_1363][7]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1084(%rsp), %xmm0	 # st.formants[8].freq, st.formants[8].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$9, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 480(%rsp)	 # st.formants[8].freq, MEM[(float[10] *)_1363][8]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1662	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1116(%rsp), %xmm0	 # st.formants[9].freq, st.formants[9].freq
	movss	%xmm0, 484(%rsp)	 # st.formants[9].freq, MEM[(float[10] *)_1363][9]
.L1662:
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, _2957
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 496(%rsp)	 # _2957, MEM[(float[10] *)_1364][0]
	movss	864(%rsp), %xmm0	 # st.formants[1].bw, st.formants[1].bw
	movss	%xmm0, 500(%rsp)	 # st.formants[1].bw, MEM[(float[10] *)_1364][1]
	movss	896(%rsp), %xmm0	 # st.formants[2].bw, st.formants[2].bw
	movss	%xmm0, 504(%rsp)	 # st.formants[2].bw, MEM[(float[10] *)_1364][2]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	928(%rsp), %xmm0	 # st.formants[3].bw, st.formants[3].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 508(%rsp)	 # st.formants[3].bw, MEM[(float[10] *)_1364][3]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	960(%rsp), %xmm0	 # st.formants[4].bw, st.formants[4].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 512(%rsp)	 # st.formants[4].bw, MEM[(float[10] *)_1364][4]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	992(%rsp), %xmm0	 # st.formants[5].bw, st.formants[5].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 516(%rsp)	 # st.formants[5].bw, MEM[(float[10] *)_1364][5]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1024(%rsp), %xmm0	 # st.formants[6].bw, st.formants[6].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 520(%rsp)	 # st.formants[6].bw, MEM[(float[10] *)_1364][6]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1056(%rsp), %xmm0	 # st.formants[7].bw, st.formants[7].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 524(%rsp)	 # st.formants[7].bw, MEM[(float[10] *)_1364][7]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1088(%rsp), %xmm0	 # st.formants[8].bw, st.formants[8].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$9, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 528(%rsp)	 # st.formants[8].bw, MEM[(float[10] *)_1364][8]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L543	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1120(%rsp), %xmm0	 # st.formants[9].bw, st.formants[9].bw
	movss	%xmm0, 532(%rsp)	 # st.formants[9].bw, MEM[(float[10] *)_1364][9]
.L543:
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	movq	216(%rsp), %r8	 # %sfp,
	leaq	544(%rsp), %rcx	 #, tmp4410
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	leaq	1148(%rsp), %rdx	 #, tmp2935
	call	memcpy	 #
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
.L553:
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L1620	 #,
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _637
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _637
	jle	.L1620	 #,
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	(%r15), %xmm0	 # MEM[(const struct ContourPt *)pretmp_2544].time_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	jnb	.L1717	 #,
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
	je	.L560	 #,
	movq	%r15, %rcx	 # pretmp_2544,
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	call	contour_f0.part.0	 #
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
	movaps	%xmm0, %xmm1	 # f0, f0
.L561:
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	cmpb	$0, 150(%rsp)	 #, %sfp
	jne	.L1718	 #,
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	140(%rsp), %xmm5	 # %sfp, pretmp_2540
 # pms.c:892:         float a_amp     = st->aspiration_amp;
	movss	144(%rsp), %xmm12	 # %sfp, a_amp
 # pms.c:891:         float v_amp     = st->voicing_amp;
	movss	136(%rsp), %xmm13	 # %sfp, v_amp
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	%xmm5, 112(%rsp)	 # pretmp_2540, %sfp
.L1665:
 # pms.c:894:         float gain_mult = 1.0f;
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
.L563:
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	movss	48(%rsp), %xmm5	 # %sfp, pretmp_2546
	comiss	%xmm7, %xmm5	 # tmp3113, pretmp_2546
	jbe	.L618	 #,
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	movss	.LC192(%rip), %xmm0	 #, _814
	mulss	1204(%rsp), %xmm0	 # st.vibrato_rate_hz, _814
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	divss	%xmm8, %xmm0	 # _607, _815
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	addss	2388(%rsp), %xmm0	 # st.vibrato_phase, _816
 # pms.c:994:             if (st->vibrato_phase >= TWO_PI_F) st->vibrato_phase -= TWO_PI_F;
	comiss	.LC192(%rip), %xmm0	 #, _816
	jb	.L620	 #,
 # pms.c:994:             if (st->vibrato_phase >= TWO_PI_F) st->vibrato_phase -= TWO_PI_F;
	subss	.LC192(%rip), %xmm0	 #, _816
.L620:
	movss	%xmm1, 160(%rsp)	 # f0, %sfp
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	movss	%xmm0, 2388(%rsp)	 # _816, st.vibrato_phase
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	call	sinf	 #
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	mulss	48(%rsp), %xmm0	 # %sfp, _820
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	movss	160(%rsp), %xmm1	 # %sfp, f0
	addss	%xmm0, %xmm1	 # _820, f0
.L618:
 # pms.c:998:         if (st->jitter_percent > 0.0f)
	movss	80(%rsp), %xmm5	 # %sfp, pretmp_2548
	comiss	%xmm7, %xmm5	 # tmp3113, pretmp_2548
	jbe	.L622	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_824
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _832
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	divss	.LC2(%rip), %xmm5	 #, _834
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_824, _825
	sall	$13, %eax	 #, _825
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_824, _826
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _826, _827
	shrl	$17, %edx	 #, _827
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _826, _828
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _828, _829
	sall	$5, %eax	 #, _829
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _828, _830
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _830, _832
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _833
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _830, g_noise_state
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	mulss	%xmm5, %xmm0	 # _834, _835
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	addss	%xmm6, %xmm0	 # tmp4406, _836
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	mulss	%xmm0, %xmm1	 # _836, f0
.L622:
 # pms.c:1002:         if (st->shimmer_percent > 0.0f)
	movss	84(%rsp), %xmm5	 # %sfp, pretmp_2550
	comiss	%xmm7, %xmm5	 # tmp3113, pretmp_2550
	jbe	.L1629	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_840
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _848
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	divss	.LC2(%rip), %xmm5	 #, _850
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_840, _841
	sall	$13, %eax	 #, _841
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_840, _842
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _842, _843
	shrl	$17, %edx	 #, _843
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _842, _844
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _844, _845
	sall	$5, %eax	 #, _845
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _844, _846
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _846, _848
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _849
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _846, g_noise_state
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	mulss	%xmm5, %xmm0	 # _850, _851
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	addss	%xmm6, %xmm0	 # tmp4406, _851
	movss	%xmm0, 160(%rsp)	 # _851, %sfp
.L624:
 # pms.c:1005:         if (f0 > 0.0f) f0 = clampf(f0, 40.0f, 500.0f);
	comiss	%xmm7, %xmm1	 # tmp3113, f0
	jbe	.L626	 #,
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC98(%rip), %xmm2	 #, tmp3144
	comiss	%xmm1, %xmm2	 # f0, tmp3144
	ja	.L1064	 #,
	movss	.LC93(%rip), %xmm2	 #, tmp3146
	movaps	%xmm2, %xmm3	 # tmp3146, tmp3148
	cmpltss	%xmm1, %xmm3	 #, f0, tmp3148
	andps	%xmm3, %xmm2	 # tmp3148, tmp3149
	andnps	%xmm1, %xmm3	 # f0, tmp3150
	orps	%xmm2, %xmm3	 # tmp3149, tmp3150
	movaps	%xmm3, %xmm1	 # tmp3150, f0
.L626:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L637	 #,
	comiss	%xmm8, %xmm7	 # _607, tmp3113
	jnb	.L631	 #,
	movq	64(%rsp), %rax	 # %sfp, ivtmp.777
	xorl	%edi, %edi	 # ivtmp.780
	movq	%r12, 288(%rsp)	 # ivtmp.853, %sfp
	cmpl	$0, 56(%rsp)	 #, %sfp
	leaq	448(%rsp), %rbp	 #, tmp4407
	movl	%ebx, 304(%rsp)	 # pretmp_2554, %sfp
	movss	%xmm9, 256(%rsp)	 # sm_a, %sfp
	movq	%rbp, %rbx	 # tmp4407, tmp4407
	movss	%xmm10, 296(%rsp)	 # sm_fr, %sfp
	leaq	544(%rsp), %rbp	 #, ivtmp.774
	movss	%xmm1, 300(%rsp)	 # f0, %sfp
	movq	%rax, %rsi	 # ivtmp.777, ivtmp.777
	leaq	496(%rsp), %r12	 #, tmp4408
	je	.L644	 #,
	jmp	.L636	 #
	.p2align 4,,10
	.p2align 3
.L1719:
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm0, %xmm7	 # _2668, tmp3113
	jnb	.L634	 #,
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	mulss	.LC185(%rip), %xmm0	 #, _2663
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	divss	%xmm8, %xmm0	 # _607, _2662
	call	expf	 #
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	movss	.LC192(%rip), %xmm3	 #, _2658
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	movaps	%xmm0, %xmm9	 #, r
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	mulss	%xmm10, %xmm3	 # _2667, _2658
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	divss	%xmm8, %xmm3	 # _607, _2658
	movaps	%xmm3, %xmm0	 # _2658, theta_2657
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	call	cosf	 #
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movss	.LC191(%rip), %xmm1	 #, _2656
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 #, _2655
 # pms.c:87:     f->a2 =  r * r;
	movaps	%xmm9, %xmm0	 # r, _2651
	mulss	%xmm9, %xmm0	 # r, _2651
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm9, %xmm1	 # r, _2656
 # pms.c:87:     f->a2 =  r * r;
	movss	%xmm0, 48(%rsi)	 # _2651, MEM[(float *)_4437 + 48B]
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	movaps	%xmm6, %xmm0	 # tmp4406, _2645
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm3, %xmm1	 # _2655, _2654
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	subss	%xmm9, %xmm0	 # r, _2645
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	unpcklps	%xmm1, %xmm0	 # _2654, _3483
	movlps	%xmm0, 40(%rsi)	 # _3483, MEM <vector(2) float> [(float *)_4437 + 40B]
.L635:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	addq	$4, %rdi	 #, ivtmp.780
	addq	$4, %rbp	 #, ivtmp.774
	addq	$32, %rsi	 #, ivtmp.777
	cmpq	%rdi, %r14	 # ivtmp.780, _2896
	je	.L1668	 #,
.L636:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movss	0(%rbp), %xmm1	 # MEM[(float *)_4443], iftmp.50_2669
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm7, %xmm0	 # tmp3113, tmp4497
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%rbx,%rdi), %xmm10	 # MEM[(float *)_1363 + ivtmp.780_4448 * 1], _2667
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltss	%xmm1, %xmm0	 #, iftmp.50_2669, tmp4497
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm10, %xmm7	 # _2667, tmp3113
 # pms.c:76:     f->freq = freq;
	movaps	%xmm10, %xmm4	 # _2667, _3572
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	andps	%xmm0, %xmm1	 # tmp4497, tmp4498
	andnps	%xmm6, %xmm0	 # tmp4406, tmp4499
	orps	%xmm0, %xmm1	 # tmp4499, iftmp.50_2669
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%r12,%rdi), %xmm0	 # MEM[(float *)_1364 + ivtmp.780_4448 * 1], _2668
 # pms.c:78:     f->gain = gain;
	movss	%xmm1, 36(%rsi)	 # iftmp.50_2669, MEM[(float *)_4437 + 36B]
 # pms.c:76:     f->freq = freq;
	unpcklps	%xmm0, %xmm4	 # _2668, _3572
	movlps	%xmm4, 28(%rsi)	 # _3572, MEM <vector(2) float> [(float *)_4437 + 28B]
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	jb	.L1719	 #,
.L634:
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	$0, 40(%rsi)	 #, MEM <vector(2) float> [(float *)_4437 + 40B]
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 48(%rsi)	 #, MEM[(float *)_4437 + 48B]
	jmp	.L635	 #
	.p2align 4,,10
	.p2align 3
.L1630:
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm0, %xmm7	 # _2700, tmp3113
	jnb	.L642	 #,
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	mulss	.LC185(%rip), %xmm0	 #, _2692
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	divss	%xmm8, %xmm0	 # _607, _2691
	call	expf	 #
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	movss	.LC192(%rip), %xmm3	 #, _2688
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	movaps	%xmm0, %xmm9	 #, r
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	mulss	%xmm10, %xmm3	 # _2699, _2688
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	divss	%xmm8, %xmm3	 # _607, _2688
	movaps	%xmm3, %xmm0	 # _2688, theta_2687
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	call	cosf	 #
 # pms.c:87:     f->a2 =  r * r;
	movaps	%xmm9, %xmm1	 # r, r
	mulss	%xmm9, %xmm1	 # r, r
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 #, _2685
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movss	.LC191(%rip), %xmm0	 #, _2686
	mulss	%xmm9, %xmm0	 # r, _2686
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm3, %xmm0	 # _2685, _2684
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 # _2684, _3558
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	addss	%xmm6, %xmm0	 # tmp4406, _2678
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	unpcklps	%xmm1, %xmm3	 # _2682, _3558
	movlps	%xmm3, 44(%rsi)	 # _3558, MEM <vector(2) float> [(float *)_2921 + 44B]
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	addss	%xmm1, %xmm0	 # _2682, _2677
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	movss	.LC166(%rip), %xmm1	 #, tmp4503
	maxss	%xmm0, %xmm1	 # _2677, tmp4503
	movss	%xmm1, 40(%rsi)	 # tmp4503, MEM[(float *)_2921 + 40B]
.L641:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	addq	$4, %rdi	 #, ivtmp.790
	addq	$4, %rbp	 #, ivtmp.784
	addq	$32, %rsi	 #, ivtmp.787
	cmpq	%r14, %rdi	 # _2896, ivtmp.790
	je	.L1668	 #,
.L644:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movss	0(%rbp), %xmm1	 # MEM[(float *)_1154], iftmp.50_2701
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm7, %xmm0	 # tmp3113, tmp4500
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%rbx,%rdi), %xmm10	 # MEM[(float *)_1363 + ivtmp.790_3025 * 1], _2699
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltss	%xmm1, %xmm0	 #, iftmp.50_2701, tmp4500
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm10, %xmm7	 # _2699, tmp3113
 # pms.c:76:     f->freq = freq;
	movaps	%xmm10, %xmm4	 # _2699, _3552
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	andps	%xmm0, %xmm1	 # tmp4500, tmp4501
	andnps	%xmm6, %xmm0	 # tmp4406, tmp4502
	orps	%xmm0, %xmm1	 # tmp4502, iftmp.50_2701
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%r12,%rdi), %xmm0	 # MEM[(float *)_1364 + ivtmp.790_3025 * 1], _2700
 # pms.c:78:     f->gain = gain;
	movss	%xmm1, 36(%rsi)	 # iftmp.50_2701, MEM[(float *)_2921 + 36B]
 # pms.c:76:     f->freq = freq;
	unpcklps	%xmm0, %xmm4	 # _2700, _3552
	movlps	%xmm4, 28(%rsi)	 # _3552, MEM <vector(2) float> [(float *)_2921 + 28B]
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	jb	.L1630	 #,
.L642:
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	$0, 40(%rsi)	 #, MEM <vector(2) float> [(float *)_2921 + 40B]
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 48(%rsi)	 #, MEM[(float *)_2921 + 48B]
	jmp	.L641	 #
.L1668:
	movq	288(%rsp), %r12	 # %sfp, ivtmp.853
	movl	304(%rsp), %ebx	 # %sfp, pretmp_2554
	movss	256(%rsp), %xmm9	 # %sfp, sm_a
	movss	296(%rsp), %xmm10	 # %sfp, sm_fr
	movss	300(%rsp), %xmm1	 # %sfp, f0
.L637:
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	mulss	%xmm15, %xmm11	 # sm_coef, _868
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	movaps	%xmm6, %xmm2	 # tmp4406, _869
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	movss	104(%rsp), %xmm5	 # %sfp, tmp4430
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	subss	%xmm15, %xmm2	 # sm_coef, _869
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	mulss	%xmm15, %xmm9	 # sm_coef, _874
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	mulss	%xmm15, %xmm10	 # sm_coef, _879
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	comiss	132(%rsp), %xmm5	 # %sfp, tmp4430
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	mulss	%xmm2, %xmm13	 # _869, _871
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	mulss	%xmm2, %xmm12	 # _869, _876
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	mulss	112(%rsp), %xmm2	 # %sfp, _881
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	addss	%xmm13, %xmm11	 # _871, sm_v
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	addss	%xmm12, %xmm9	 # _876, sm_a
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	addss	%xmm2, %xmm10	 # _881, sm_fr
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	jbe	.L630	 #,
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	comiss	.LC204(%rip), %xmm11	 #, sm_v
	jb	.L630	 #,
 # pms.c:1019:             st->pitch_phase = 0.0f;
	movss	%xmm7, 2384(%rsp)	 # tmp3113, st.pitch_phase
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	%xmm7, %xmm1	 # tmp3113, f0
	jbe	.L654	 #,
.L650:
 # pms.c:1023:             float period = (float)sr / f0;
	movaps	%xmm8, %xmm2	 # _607, period_884
	divss	%xmm1, %xmm2	 # f0, period_884
 # pms.c:1024:             st->pitch_phase += 1.0f / period;
	movaps	%xmm6, %xmm1	 # tmp4406, _886
	divss	%xmm2, %xmm1	 # period_884, _886
 # pms.c:1024:             st->pitch_phase += 1.0f / period;
	addss	2384(%rsp), %xmm1	 # st.pitch_phase, _887
 # pms.c:1025:             if (st->pitch_phase >= 1.0f) st->pitch_phase -= 1.0f;
	comiss	%xmm6, %xmm1	 # tmp4406, _887
	jb	.L653	 #,
 # pms.c:1025:             if (st->pitch_phase >= 1.0f) st->pitch_phase -= 1.0f;
	subss	%xmm6, %xmm1	 # tmp4406, _887
.L653:
 # pms.c:1024:             st->pitch_phase += 1.0f / period;
	movss	%xmm1, 2384(%rsp)	 # _887, st.pitch_phase
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	movl	808(%rsp), %eax	 # st.voice_type, _889
 # pms.c:786:     if (vt == VOICE_IMPULSIVE) {
	cmpl	$2, %eax	 #, _889
	je	.L1720	 #,
 # pms.c:789:         if (phase < 0.7f)
	movss	.LC208(%rip), %xmm2	 #, tmp3337
	comiss	%xmm1, %xmm2	 # _887, tmp3337
	jbe	.L1632	 #,
 # pms.c:790:             v = phase / 0.7f;
	movaps	%xmm1, %xmm3	 # _887, _887
	divss	%xmm2, %xmm3	 # tmp3337, _887
.L661:
 # pms.c:794:         if (vt == VOICE_WHISPER)
	subl	$1, %eax	 #, _889
	je	.L662	 #,
 # pms.c:793:         v = 2.0f * v - 1.0f;
	addss	%xmm3, %xmm3	 # v, _1281
 # pms.c:793:         v = 2.0f * v - 1.0f;
	subss	%xmm6, %xmm3	 # tmp4406, v
.L657:
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	mulss	%xmm11, %xmm3	 # sm_v, _892
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	mulss	160(%rsp), %xmm3	 # %sfp, v_sig
.L651:
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	comiss	.LC206(%rip), %xmm9	 #, sm_a
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	pxor	%xmm1, %xmm1	 # a_sig
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	jbe	.L663	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_895
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _903
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	168(%rsp), %xmm2	 # %sfp, _906
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	128(%rsp), %xmm1	 # %sfp, asp$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	176(%rsp), %xmm4	 # %sfp, _912
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_895, _896
	sall	$13, %eax	 #, _896
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_895, _897
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _897, _898
	shrl	$17, %edx	 #, _898
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _897, _899
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _899, _900
	sall	$5, %eax	 #, _900
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _899, _901
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _901, _903
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _904
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _901, g_noise_state
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm0, %xmm2	 # _904, _906
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	172(%rsp), %xmm0	 # %sfp, _910
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	%xmm2, %xmm1	 # _906, asp$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm1, %xmm4	 # y, _912
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	subss	%xmm4, %xmm0	 # _912, _913
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	108(%rsp), %xmm0	 # %sfp, _913
	movss	%xmm0, 128(%rsp)	 # _913, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	180(%rsp), %xmm0	 # %sfp, _919
	mulss	%xmm1, %xmm0	 # y, _919
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	mulss	%xmm9, %xmm1	 # sm_a, a_sig
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm0, %xmm2	 # _919, _906
	movss	%xmm2, 108(%rsp)	 # _906, %sfp
.L663:
 # pms.c:1033:             : 0.0f;
	comiss	.LC206(%rip), %xmm10	 #, sm_fr
 # pms.c:1030:         float fr_sig = sm_fr > 1e-5f
	pxor	%xmm0, %xmm0	 # fr_sig
 # pms.c:1033:             : 0.0f;
	jbe	.L665	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, pretmp_2759
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm2, %xmm2	 # _2767
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # pretmp_2759, _2760
	sall	$13, %eax	 #, _2760
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # pretmp_2759, _2761
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2761, _2762
	shrl	$17, %edx	 #, _2762
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2761, _2763
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2763, _2764
	sall	$5, %eax	 #, _2764
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2763, _2765
 # pms.c:1032:                         : biquad_process(&fric,       white_noise())) * sm_fr
	cmpl	$0, 156(%rsp)	 #, %sfp
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm2	 # _2765, _2767
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm2	 #, _2768
 # pms.c:1032:                         : biquad_process(&fric,       white_noise())) * sm_fr
	je	.L667	 #,
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	232(%rsp), %xmm4	 # %sfp, _934
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	200(%rsp), %xmm0	 # %sfp, burst_filt$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	240(%rsp), %xmm5	 # %sfp, _940
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm2, %xmm4	 # _2768, _934
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	236(%rsp), %xmm2	 # %sfp, _938
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	%xmm4, %xmm0	 # _934, burst_filt$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm0, %xmm5	 # y, _940
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	subss	%xmm5, %xmm2	 # _940, _941
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	196(%rsp), %xmm2	 # %sfp, _941
	movss	%xmm2, 200(%rsp)	 # _941, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	244(%rsp), %xmm2	 # %sfp, _947
	mulss	%xmm0, %xmm2	 # y, _947
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm2, %xmm4	 # _947, _934
	movss	%xmm4, 196(%rsp)	 # _934, %sfp
.L668:
 # pms.c:1030:         float fr_sig = sm_fr > 1e-5f
	mulss	%xmm10, %xmm0	 # sm_fr, fr_sig
	movl	%eax, g_noise_state(%rip)	 # _2765, g_noise_state
.L665:
 # pms.c:1038:         if (cascade) {
	movl	56(%rsp), %eax	 # %sfp,
 # pms.c:1035:         float excitation = v_sig + a_sig;
	addss	%xmm3, %xmm1	 # v_sig, excitation
 # pms.c:1038:         if (cascade) {
	testl	%eax, %eax	 #
	je	.L669	 #,
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	testl	%ebx, %ebx	 # pretmp_2554
 # pms.c:1045:             samp = 0.0f;
	pxor	%xmm2, %xmm2	 # samp
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	jle	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	828(%rsp), %xmm2	 # st.formants[0].freq, st.formants[0].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[0].freq
	jbe	.L1635	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	840(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].b0, _3766
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3766
	jp	.L707	 #,
	je	.L1721	 #,
.L707:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	852(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z1, _3772
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3770
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	844(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a1, _3773
	mulss	%xmm3, %xmm4	 # _3772, _3773
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm4, %xmm2	 # _3773, _3774
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	848(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2
	mulss	856(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z2, _3777
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm4, %xmm2	 # _3777, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm4	 # y, _3497
 # pms.c:102:     return y * f->gain;
	mulss	836(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].gain, _3767
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm4	 # _3772, _3497
	movlps	%xmm4, 852(%rsp)	 # _3497, MEM <vector(2) float> [(float *)&st + 52B]
.L709:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm7, %xmm2	 # tmp3113, samp
.L705:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	860(%rsp), %xmm3	 # st.formants[1].freq, st.formants[1].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[1].freq
	jbe	.L711	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	872(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].b0, _3790
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3790
	jp	.L713	 #,
	je	.L1722	 #,
.L713:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	884(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z1, _3796
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3794
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	876(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a1, _3797
	mulss	%xmm4, %xmm3	 # _3796, _3797
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3797, _3798
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	880(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2
	mulss	888(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z2, _3801
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3801, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3502
 # pms.c:102:     return y * f->gain;
	mulss	868(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3796, _3502
	movlps	%xmm3, 884(%rsp)	 # _3502, MEM <vector(2) float> [(float *)&st + 84B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3791
.L715:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3791, samp
.L711:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$2, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	892(%rsp), %xmm3	 # st.formants[2].freq, st.formants[2].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[2].freq
	jbe	.L716	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	904(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].b0, _3814
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3814
	jp	.L718	 #,
	je	.L1723	 #,
.L718:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	916(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z1, _3820
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3818
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	908(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a1, _3821
	mulss	%xmm4, %xmm3	 # _3820, _3821
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3821, _3822
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	912(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2
	mulss	920(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z2, _3825
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3825, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3507
 # pms.c:102:     return y * f->gain;
	mulss	900(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3820, _3507
	movlps	%xmm3, 916(%rsp)	 # _3507, MEM <vector(2) float> [(float *)&st + 116B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3815
.L720:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3815, samp
.L716:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$3, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	924(%rsp), %xmm3	 # st.formants[3].freq, st.formants[3].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[3].freq
	jbe	.L721	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	936(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].b0, _3838
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3838
	jp	.L723	 #,
	je	.L1724	 #,
.L723:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	948(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z1, _3844
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3842
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	940(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a1, _3845
	mulss	%xmm4, %xmm3	 # _3844, _3845
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3845, _3846
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	944(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2
	mulss	952(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z2, _3849
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3849, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3512
 # pms.c:102:     return y * f->gain;
	mulss	932(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3844, _3512
	movlps	%xmm3, 948(%rsp)	 # _3512, MEM <vector(2) float> [(float *)&st + 148B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3839
.L725:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3839, samp
.L721:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$4, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	956(%rsp), %xmm3	 # st.formants[4].freq, st.formants[4].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[4].freq
	jbe	.L726	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	968(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].b0, _3862
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3862
	jp	.L728	 #,
	je	.L1725	 #,
.L728:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	980(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z1, _3868
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3866
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	972(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a1, _3869
	mulss	%xmm4, %xmm3	 # _3868, _3869
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3869, _3870
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	976(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2
	mulss	984(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z2, _3873
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3873, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3517
 # pms.c:102:     return y * f->gain;
	mulss	964(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3868, _3517
	movlps	%xmm3, 980(%rsp)	 # _3517, MEM <vector(2) float> [(float *)&st + 180B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3863
.L730:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3863, samp
.L726:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$5, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	988(%rsp), %xmm3	 # st.formants[5].freq, st.formants[5].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[5].freq
	jbe	.L731	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1000(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].b0, _3886
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3886
	jp	.L733	 #,
	je	.L1726	 #,
.L733:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1012(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z1, _3892
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3890
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1004(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a1, _3893
	mulss	%xmm4, %xmm3	 # _3892, _3893
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3893, _3894
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1008(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2
	mulss	1016(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z2, _3897
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3897, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3522
 # pms.c:102:     return y * f->gain;
	mulss	996(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3892, _3522
	movlps	%xmm3, 1012(%rsp)	 # _3522, MEM <vector(2) float> [(float *)&st + 212B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3887
.L735:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3887, samp
.L731:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$6, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1020(%rsp), %xmm3	 # st.formants[6].freq, st.formants[6].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[6].freq
	jbe	.L736	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1032(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].b0, _3910
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3910
	jp	.L738	 #,
	je	.L1727	 #,
.L738:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1044(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z1, _3916
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3914
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1036(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a1, _3917
	mulss	%xmm4, %xmm3	 # _3916, _3917
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3917, _3918
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1040(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2
	mulss	1048(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z2, _3921
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3921, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3527
 # pms.c:102:     return y * f->gain;
	mulss	1028(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3916, _3527
	movlps	%xmm3, 1044(%rsp)	 # _3527, MEM <vector(2) float> [(float *)&st + 244B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3911
.L740:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3911, samp
.L736:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$7, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1052(%rsp), %xmm3	 # st.formants[7].freq, st.formants[7].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[7].freq
	jbe	.L741	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1064(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].b0, _3934
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3934
	jp	.L743	 #,
	je	.L1728	 #,
.L743:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1076(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z1, _3940
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3938
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1068(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a1, _3941
	mulss	%xmm4, %xmm3	 # _3940, _3941
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3941, _3942
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1072(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2
	mulss	1080(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z2, _3945
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3945, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _710
 # pms.c:102:     return y * f->gain;
	mulss	1060(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3940, _710
	movlps	%xmm3, 1076(%rsp)	 # _710, MEM <vector(2) float> [(float *)&st + 276B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3935
.L745:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3935, samp
.L741:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$8, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1084(%rsp), %xmm3	 # st.formants[8].freq, st.formants[8].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[8].freq
	jbe	.L746	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1096(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].b0, _3958
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3113, _3958
	jp	.L748	 #,
	je	.L1729	 #,
.L748:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1108(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z1, _3964
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # excitation, _3962
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1100(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a1, _3965
	mulss	%xmm4, %xmm3	 # _3964, _3965
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3965, _3966
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1104(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2
	mulss	1112(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z2, _3969
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3969, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _1378
 # pms.c:102:     return y * f->gain;
	mulss	1092(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3964, _1378
	movlps	%xmm3, 1108(%rsp)	 # _1378, MEM <vector(2) float> [(float *)&st + 308B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3959
.L750:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3959, samp
.L746:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$9, %ebx	 #, pretmp_2554
	je	.L671	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1116(%rsp), %xmm3	 # st.formants[9].freq, st.formants[9].freq
	comiss	%xmm7, %xmm3	 # tmp3113, st.formants[9].freq
	jbe	.L671	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1128(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].b0, _1002
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm3	 # tmp3113, _1002
	jp	.L1190	 #,
	je	.L1080	 #,
.L1190:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1140(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z1, _1005
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm3, %xmm1	 # _1002, _1003
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1132(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a1, _1006
	mulss	%xmm4, %xmm3	 # _1005, _1006
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm1	 # _1006, _1007
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1136(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2
	mulss	1144(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2, _1010
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm1	 # _1010, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm1, %xmm3	 # y, _3473
 # pms.c:102:     return y * f->gain;
	mulss	1124(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].gain, _1015
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _1005, _3473
	movlps	%xmm3, 1140(%rsp)	 # _3473, MEM <vector(2) float> [(float *)&st + 340B]
.L753:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm1, %xmm2	 # _1015, samp
.L671:
 # pms.c:1049:             samp += fr_sig * 0.35f;
	mulss	.LC210(%rip), %xmm0	 #, _1019
 # pms.c:1049:             samp += fr_sig * 0.35f;
	addss	%xmm2, %xmm0	 # samp, samp
.L704:
 # pms.c:1052:         if (st->lip_radiation_enabled) {
	movl	88(%rsp), %eax	 # %sfp,
	testl	%eax, %eax	 #
	je	.L755	 #,
 # pms.c:1053:             float y = samp - 0.97f * st->lip_rad_z1;
	movss	.LC211(%rip), %xmm1	 #, tmp3583
	mulss	2392(%rsp), %xmm1	 # st.lip_rad_z1, _1023
 # pms.c:1054:             st->lip_rad_z1 = samp;
	movss	%xmm0, 2392(%rsp)	 # samp, st.lip_rad_z1
 # pms.c:1055:             samp = y;
	subss	%xmm1, %xmm0	 # _1023, samp
.L755:
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	movss	120(%rsp), %xmm1	 # %sfp, gain_mult
	mulss	92(%rsp), %xmm1	 # %sfp, gain_mult
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	cmpl	%r12d, 96(%rsp)	 # ivtmp.853, %sfp
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	mulss	%xmm0, %xmm1	 # samp, samp
 # pms.c:1061:             samp *= (float)n / (float)ramp_on;
	movaps	%xmm14, %xmm0	 # _705, _705
	divss	208(%rsp), %xmm0	 # %sfp, _705
 # pms.c:1061:             samp *= (float)n / (float)ramp_on;
	mulss	%xmm1, %xmm0	 # samp, samp
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	jg	.L756	 #,
	cmpb	$0, 151(%rsp)	 #, %sfp
	jne	.L1730	 #,
.L756:
 # pms.c:1065:         buf[n] = samp;
	movq	184(%rsp), %rax	 # %sfp, buf
	movss	%xmm0, (%rax,%r12,4)	 # samp, MEM[(float *)buf_615 + ivtmp.853_2899 * 4]
 # pms.c:887:     for (int n = 0; n < N; n++) {
	addq	$1, %r12	 #, ivtmp.853
	cmpl	%r12d, 192(%rsp)	 # ivtmp.853, %sfp
	jle	.L1656	 #,
.L757:
 # pms.c:845:     float  *phon_t0   = NULL;                                      
	movss	%xmm11, 132(%rsp)	 # sm_v, %sfp
	jmp	.L759	 #
.L630:
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	%xmm7, %xmm1	 # tmp3113, f0
	jbe	.L654	 #,
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	.LC206(%rip), %xmm11	 #, sm_v
	ja	.L650	 #,
.L654:
 # pms.c:1021:         float v_sig = 0.0f;
	pxor	%xmm3, %xmm3	 # v_sig
	jmp	.L651	 #
.L1620:
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
 # pms.c:890:         float f0        = st->f0_hz;
	movss	152(%rsp), %xmm1	 # %sfp, f0
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	jne	.L561	 #,
	movslq	1256(%rsp), %rcx	 # MEM[(int *)&st + 456B],
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%ecx, %ecx	 # _129
	je	.L1051	 #,
.L1663:
	movq	1248(%rsp), %rdx	 # MEM[(struct SpecFrame * *)&st + 448B], B
 # pms.c:593:     if (t_ms <= sd->frames[0].time_ms) { lo = hi = 0; }
	movss	(%rdx), %xmm0	 # _127->time_ms, _127->time_ms
	comiss	%xmm2, %xmm0	 # t_ms, _127->time_ms
	jnb	.L564	 #,
 # pms.c:592:     int lo = 0, hi = sd->nframes-1;
	leal	-1(%rcx), %eax	 #, hi
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	subq	$1, %rcx	 #, tmp2944
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	imulq	$148, %rcx, %rcx	 #, tmp2944, tmp2945
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	movl	%eax, %r9d	 # hi, lo
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	comiss	(%rdx,%rcx), %xmm2	 # _1115->time_ms, t_ms
	jnb	.L565	 #,
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	testl	%eax, %eax	 # hi
	jle	.L1053	 #,
	movq	%rdx, %rcx	 # B, ivtmp.826
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	xorl	%r9d, %r9d	 # lo
.L569:
 # pms.c:597:             if (t_ms >= sd->frames[i].time_ms && t_ms <= sd->frames[i+1].time_ms) {
	comiss	(%rcx), %xmm2	 # MEM[(float *)_4420], t_ms
	jb	.L566	 #,
 # pms.c:597:             if (t_ms >= sd->frames[i].time_ms && t_ms <= sd->frames[i+1].time_ms) {
	movss	148(%rcx), %xmm0	 # MEM[(float *)_4420 + 148B], MEM[(float *)_4420 + 148B]
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(float *)_4420 + 148B]
	jnb	.L1731	 #,
.L566:
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	addl	$1, %r9d	 #, lo
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	addq	$148, %rcx	 #, ivtmp.826
	cmpl	%r9d, %eax	 # lo, hi
	jg	.L569	 #,
.L1053:
 # pms.c:592:     int lo = 0, hi = sd->nframes-1;
	xorl	%r9d, %r9d	 # lo
.L565:
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movslq	%r9d, %r9	 # lo, _1129
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	cltq
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	imulq	$148, %r9, %r9	 #, _1129, _1130
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	imulq	$148, %rax, %rax	 #, _1133, _1134
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	addq	%rdx, %r9	 # B, A
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	addq	%rax, %rdx	 # _1134, B
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movss	(%r9), %xmm0	 # A_1131->time_ms, t0
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movss	(%rdx), %xmm3	 # B_1135->time_ms, t1
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	jle	.L1023	 #,
	comiss	%xmm3, %xmm0	 # t1, t0
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movl	144(%r9), %r10d	 # A_1131->has_fgain, _596
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movl	144(%rdx), %r8d	 # B_1135->has_fgain, _1153
	jnb	.L573	 #,
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm2, %xmm4	 # t_ms, _1212
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm0, %xmm3	 # t0, _1213
	testl	%r10d, %r10d	 # _596
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm0, %xmm4	 # t0, _1212
	movd	%xmm4, %r10d	 # _1212, _1212
	jne	.L574	 #,
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm3, %xmm4	 # _1213, alpha
	xorl	%eax, %eax	 # ivtmp.792
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	pxor	%xmm12, %xmm12	 # tmp2955
	leaq	544(%rsp), %rcx	 #, tmp4410
	movss	%xmm3, 120(%rsp)	 # _1213, %sfp
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	jmp	.L579	 #
.L1732:
	movaps	%xmm6, %xmm5	 # tmp4406, tmp2959
	movaps	%xmm6, %xmm3	 # tmp4406, tmp2960
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _1153
	cmpltss	%xmm4, %xmm5	 #, alpha, tmp2959
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm13, %xmm2	 # pretmp_2572, pretmp_2565
	andps	%xmm5, %xmm3	 # tmp2959, tmp2960
	andnps	%xmm4, %xmm5	 # alpha, tmp2961
	orps	%xmm3, %xmm5	 # tmp2960, _2538
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm5, %xmm0	 # _2538, _2537
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm1, %xmm0	 # _2576, _2536
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm0, 0(%rbp,%rax,4)	 # _2536, MEM[(float *)_1363 + ivtmp.792_3011 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm2, %xmm0	 # pretmp_2565, _511
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm5, %xmm0	 # _2538, _2281
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm13, %xmm0	 # pretmp_2572, _535
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm0, (%rdi,%rax,4)	 # _535, MEM[(float *)_1364 + ivtmp.792_3011 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, gb
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	je	.L577	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_1135 + 104B + ivtmp.792_3011 * 4], gb
.L577:
	movaps	%xmm6, %xmm1	 # tmp4406, tmp2981
	movaps	%xmm6, %xmm5	 # tmp4406, tmp2982
	cmpltss	%xmm4, %xmm1	 #, alpha, tmp2981
	andps	%xmm1, %xmm5	 # tmp2981, tmp2982
	andnps	%xmm4, %xmm1	 # alpha, tmp2983
	orps	%xmm5, %xmm1	 # tmp2982, _2514
.L578:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm6, %xmm0	 # tmp4406, _2513
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _2514, _2512
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm6, %xmm0	 # tmp4406, _2511
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm0, (%rcx,%rax,4)	 # _2511, MEM[(float *)_1365 + ivtmp.792_3011 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.792
	cmpl	%eax, %ebx	 # ivtmp.792, pretmp_2554
	jle	.L1679	 #,
.L579:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm4, %xmm12	 # alpha, tmp2955
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	4(%r9,%rax,4), %xmm1	 # MEM[(float *)A_1131 + 4B + ivtmp.792_3011 * 4], _2576
 # pms.c:161:     { return a + (b - a) * t; }
	movss	4(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_1135 + 4B + ivtmp.792_3011 * 4], MEM[(float *)B_1135 + 4B + ivtmp.792_3011 * 4]
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%r9,%rax,4), %xmm13	 # MEM[(float *)A_1131 + 44B + ivtmp.792_3011 * 4], pretmp_2572
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm1, %xmm0	 # _2576, _2566
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%rdx,%rax,4), %xmm2	 # MEM[(float *)B_1135 + 44B + ivtmp.792_3011 * 4], pretmp_2565
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	jbe	.L1732	 #,
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm12, %xmm0	 # tmp2955, _2529
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm13, %xmm2	 # pretmp_2572, pretmp_2565
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _1153
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm1, %xmm0	 # _2576, _2528
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm0, 0(%rbp,%rax,4)	 # _2528, MEM[(float *)_1363 + ivtmp.792_3011 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm2, %xmm0	 # pretmp_2565, _2707
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm12, %xmm0	 # tmp2955, _1145
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm13, %xmm0	 # pretmp_2572, _1039
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm0, (%rdi,%rax,4)	 # _1039, MEM[(float *)_1364 + ivtmp.792_3011 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	je	.L1054	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_1135 + 104B + ivtmp.792_3011 * 4], gb
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm1, %xmm1	 # _2514
	jmp	.L578	 #
.L669:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	828(%rsp), %xmm2	 # st.formants[0].freq, st.formants[0].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[0].freq
	jbe	.L673	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	840(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].b0, _3577
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3577
	jp	.L1152	 #,
	je	.L1069	 #,
.L1152:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	852(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z1, _3580
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3578
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	844(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a1, _3581
	mulss	%xmm3, %xmm1	 # _3580, _3581
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3581, _3582
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	848(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2
	mulss	856(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z2, _3585
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3585, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3475
 # pms.c:102:     return y * f->gain;
	mulss	836(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3580, _3475
	movlps	%xmm1, 852(%rsp)	 # _3475, MEM <vector(2) float> [(float *)&st + 52B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L673:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	860(%rsp), %xmm2	 # st.formants[1].freq, st.formants[1].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[1].freq
	jbe	.L677	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	872(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].b0, _3598
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3598
	jp	.L1154	 #,
	je	.L1070	 #,
.L1154:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	884(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z1, _3601
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3599
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	876(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a1, _3602
	mulss	%xmm3, %xmm1	 # _3601, _3602
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3602, _3603
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	880(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2
	mulss	888(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z2, _3606
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3606, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3480
 # pms.c:102:     return y * f->gain;
	mulss	868(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3601, _3480
	movlps	%xmm1, 884(%rsp)	 # _3480, MEM <vector(2) float> [(float *)&st + 84B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L677:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$2, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	892(%rsp), %xmm2	 # st.formants[2].freq, st.formants[2].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[2].freq
	jbe	.L680	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	904(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].b0, _3619
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3619
	jp	.L1156	 #,
	je	.L1071	 #,
.L1156:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	916(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z1, _3622
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3620
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	908(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a1, _3623
	mulss	%xmm3, %xmm1	 # _3622, _3623
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3623, _3624
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	912(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2
	mulss	920(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z2, _3627
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3627, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3482
 # pms.c:102:     return y * f->gain;
	mulss	900(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3622, _3482
	movlps	%xmm1, 916(%rsp)	 # _3482, MEM <vector(2) float> [(float *)&st + 116B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L680:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$3, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	924(%rsp), %xmm2	 # st.formants[3].freq, st.formants[3].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[3].freq
	jbe	.L683	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	936(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].b0, _3640
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3640
	jp	.L1158	 #,
	je	.L1072	 #,
.L1158:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	948(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z1, _3643
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3641
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	940(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a1, _3644
	mulss	%xmm3, %xmm1	 # _3643, _3644
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3644, _3645
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	944(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2
	mulss	952(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z2, _3648
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3648, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _498
 # pms.c:102:     return y * f->gain;
	mulss	932(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3643, _498
	movlps	%xmm1, 948(%rsp)	 # _498, MEM <vector(2) float> [(float *)&st + 148B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L683:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$4, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	956(%rsp), %xmm2	 # st.formants[4].freq, st.formants[4].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[4].freq
	jbe	.L686	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	968(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].b0, _3661
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3661
	jp	.L1160	 #,
	je	.L1073	 #,
.L1160:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	980(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z1, _3664
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3662
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	972(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a1, _3665
	mulss	%xmm3, %xmm1	 # _3664, _3665
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3665, _3666
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	976(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2
	mulss	984(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z2, _3669
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3669, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _823
 # pms.c:102:     return y * f->gain;
	mulss	964(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3664, _823
	movlps	%xmm1, 980(%rsp)	 # _823, MEM <vector(2) float> [(float *)&st + 180B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L686:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$5, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	988(%rsp), %xmm2	 # st.formants[5].freq, st.formants[5].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[5].freq
	jbe	.L689	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1000(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].b0, _3682
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3682
	jp	.L1162	 #,
	je	.L1074	 #,
.L1162:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1012(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z1, _3685
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3683
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1004(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a1, _3686
	mulss	%xmm3, %xmm1	 # _3685, _3686
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3686, _3687
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1008(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2
	mulss	1016(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z2, _3690
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3690, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1790
 # pms.c:102:     return y * f->gain;
	mulss	996(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3685, _1790
	movlps	%xmm1, 1012(%rsp)	 # _1790, MEM <vector(2) float> [(float *)&st + 212B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L689:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$6, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1020(%rsp), %xmm2	 # st.formants[6].freq, st.formants[6].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[6].freq
	jbe	.L692	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1032(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].b0, _3703
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3703
	jp	.L1164	 #,
	je	.L1075	 #,
.L1164:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1044(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z1, _3706
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3704
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1036(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a1, _3707
	mulss	%xmm3, %xmm1	 # _3706, _3707
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3707, _3708
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1040(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2
	mulss	1048(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z2, _3711
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3711, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _839
 # pms.c:102:     return y * f->gain;
	mulss	1028(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3706, _839
	movlps	%xmm1, 1044(%rsp)	 # _839, MEM <vector(2) float> [(float *)&st + 244B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L692:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$7, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1052(%rsp), %xmm2	 # st.formants[7].freq, st.formants[7].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[7].freq
	jbe	.L695	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1064(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].b0, _3724
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3724
	jp	.L1166	 #,
	je	.L1076	 #,
.L1166:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1076(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z1, _3727
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3725
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1068(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a1, _3728
	mulss	%xmm3, %xmm1	 # _3727, _3728
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3728, _3729
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1072(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2
	mulss	1080(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z2, _3732
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3732, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _665
 # pms.c:102:     return y * f->gain;
	mulss	1060(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3727, _665
	movlps	%xmm1, 1076(%rsp)	 # _665, MEM <vector(2) float> [(float *)&st + 276B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L695:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$8, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1084(%rsp), %xmm2	 # st.formants[8].freq, st.formants[8].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[8].freq
	jbe	.L698	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1096(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].b0, _3745
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _3745
	jp	.L1168	 #,
	je	.L1077	 #,
.L1168:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1108(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z1, _3748
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _3746
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1100(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a1, _3749
	mulss	%xmm3, %xmm1	 # _3748, _3749
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3749, _3750
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1104(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2
	mulss	1112(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z2, _3753
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3753, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _669
 # pms.c:102:     return y * f->gain;
	mulss	1092(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3748, _669
	movlps	%xmm1, 1108(%rsp)	 # _669, MEM <vector(2) float> [(float *)&st + 308B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L698:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$9, %ebx	 #, pretmp_2554
	je	.L672	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1116(%rsp), %xmm2	 # st.formants[9].freq, st.formants[9].freq
	comiss	%xmm7, %xmm2	 # tmp3113, st.formants[9].freq
	jbe	.L672	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1128(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].b0, _982
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3113, _982
	jp	.L1170	 #,
	je	.L1078	 #,
.L1170:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1140(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z1, _986
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # excitation, _984
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1132(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a1, _987
	mulss	%xmm3, %xmm1	 # _986, _987
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _987, _988
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1136(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2
	mulss	1144(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2, _991
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _991, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _2408
 # pms.c:102:     return y * f->gain;
	mulss	1124(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _986, _2408
	movlps	%xmm1, 1140(%rsp)	 # _2408, MEM <vector(2) float> [(float *)&st + 340B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, excitation
.L672:
 # pms.c:1043:             samp += fr_sig * 0.25f;                                    
	mulss	.LC60(%rip), %xmm0	 #, _998
 # pms.c:1043:             samp += fr_sig * 0.25f;                                    
	addss	%xmm1, %xmm0	 # excitation, samp
	jmp	.L704	 #
.L1629:
 # pms.c:1001:         float shimmer = 1.0f;
	movss	%xmm6, 160(%rsp)	 # tmp4406, %sfp
	jmp	.L624	 #
.L631:
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L1065	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	544(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365], vect__861.376
	movl	%ebx, %edx	 # pretmp_2554, bnd.365
 # pms.c:76:     f->freq = freq;
	xorl	%edi, %edi	 #
	xorl	%ebp, %ebp	 #
	movq	.LC205(%rip), %rax	 #, tmp3206
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	pxor	%xmm3, %xmm3	 # tmp3201
	movaps	%xmm3, %xmm2	 # tmp3201, tmp3205
	shrl	%edx	 # bnd.365
	movq	%xmm4, %xmm5	 # vect__861.376, tmp3202
	cmpl	$1, %edx	 #, bnd.365
 # pms.c:76:     f->freq = freq;
	movq	496(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364], tmp5675
	movq	%rdi, 844(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 44B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3202, tmp3205
 # pms.c:76:     f->freq = freq;
	movq	%rbp, 876(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 76B]
	movq	%rax, %xmm5	 # tmp3206, tmp3206
	andps	%xmm2, %xmm4	 # mask__2549.377_3985, tmp3207
	andnps	%xmm5, %xmm2	 # tmp3206, tmp3208
	orps	%xmm2, %xmm4	 # tmp3208, vect_iftmp.50_865.378
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	448(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363], vect__863.370
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 256(%rsp)	 # vect_iftmp.50_865.378, %sfp
	psrlq	$32, %xmm4	 #, tmp3217
	movaps	%xmm5, %xmm2	 # vect__863.370, _3989
	movlps	%xmm4, 868(%rsp)	 # tmp3217, MEM <vector(2) float> [(float *)&st + 68B]
	unpcklps	%xmm0, %xmm5	 # tmp5675, _3990
	shufps	$78, %xmm5, %xmm5	 #, _3990, _3990
	unpcklps	%xmm0, %xmm2	 # tmp5675, _3989
	movlps	%xmm2, 828(%rsp)	 # _3989, MEM <vector(2) float> [(float *)&st + 28B]
	movss	256(%rsp), %xmm2	 # %sfp, _3993
	movlps	%xmm5, 860(%rsp)	 # _3990, MEM <vector(2) float> [(float *)&st + 60B]
	movlps	%xmm2, 836(%rsp)	 # _3993, MEM <vector(2) float> [(float *)&st + 36B]
	je	.L646	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	552(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 8B], vect__861.376
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3201, tmp3225
 # pms.c:76:     f->freq = freq;
	xorl	%r11d, %r11d	 #
	xorl	%esi, %esi	 #
	movq	504(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 8B], tmp5679
	cmpl	$2, %edx	 #, bnd.365
	movq	%r11, 908(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 108B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__861.376, tmp3222
 # pms.c:76:     f->freq = freq;
	movq	%rsi, 940(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 140B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3222, tmp3225
	movq	%rax, %xmm5	 # tmp3206, tmp3206
	andps	%xmm2, %xmm4	 # mask__2549.377_4014, tmp3227
	andnps	%xmm5, %xmm2	 # tmp3206, tmp3228
	orps	%xmm2, %xmm4	 # tmp3228, vect_iftmp.50_865.378
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	456(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 8B], vect__863.370
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 256(%rsp)	 # vect_iftmp.50_865.378, %sfp
	psrlq	$32, %xmm4	 #, tmp3237
	movaps	%xmm5, %xmm2	 # vect__863.370, _4018
	movlps	%xmm4, 932(%rsp)	 # tmp3237, MEM <vector(2) float> [(float *)&st + 132B]
	unpcklps	%xmm0, %xmm5	 # tmp5679, _4019
	shufps	$78, %xmm5, %xmm5	 #, _4019, _4019
	unpcklps	%xmm0, %xmm2	 # tmp5679, _4018
	movlps	%xmm2, 892(%rsp)	 # _4018, MEM <vector(2) float> [(float *)&st + 92B]
	movss	256(%rsp), %xmm2	 # %sfp, _4022
	movlps	%xmm5, 924(%rsp)	 # _4019, MEM <vector(2) float> [(float *)&st + 124B]
	movlps	%xmm2, 900(%rsp)	 # _4022, MEM <vector(2) float> [(float *)&st + 100B]
	je	.L646	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	560(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 16B], vect__861.376
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3201, tmp3245
 # pms.c:76:     f->freq = freq;
	xorl	%r9d, %r9d	 #
	xorl	%r10d, %r10d	 #
	movq	512(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 16B], tmp5683
	cmpl	$3, %edx	 #, bnd.365
	movq	%r9, 972(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 172B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__861.376, tmp3242
 # pms.c:76:     f->freq = freq;
	movq	%r10, 1004(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 204B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3242, tmp3245
	movq	%rax, %xmm5	 # tmp3206, tmp3206
	andps	%xmm2, %xmm4	 # mask__2549.377_4043, tmp3247
	andnps	%xmm5, %xmm2	 # tmp3206, tmp3248
	orps	%xmm2, %xmm4	 # tmp3248, vect_iftmp.50_865.378
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	464(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 16B], vect__863.370
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 256(%rsp)	 # vect_iftmp.50_865.378, %sfp
	psrlq	$32, %xmm4	 #, tmp3257
	movaps	%xmm5, %xmm2	 # vect__863.370, _4047
	movlps	%xmm4, 996(%rsp)	 # tmp3257, MEM <vector(2) float> [(float *)&st + 196B]
	unpcklps	%xmm0, %xmm5	 # tmp5683, _4048
	shufps	$78, %xmm5, %xmm5	 #, _4048, _4048
	unpcklps	%xmm0, %xmm2	 # tmp5683, _4047
	movlps	%xmm2, 956(%rsp)	 # _4047, MEM <vector(2) float> [(float *)&st + 156B]
	movss	256(%rsp), %xmm2	 # %sfp, _4051
	movlps	%xmm5, 988(%rsp)	 # _4048, MEM <vector(2) float> [(float *)&st + 188B]
	movlps	%xmm2, 964(%rsp)	 # _4051, MEM <vector(2) float> [(float *)&st + 164B]
	je	.L646	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	568(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 24B], vect__861.376
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3201, tmp3265
 # pms.c:76:     f->freq = freq;
	xorl	%ecx, %ecx	 #
	xorl	%r8d, %r8d	 #
	movq	520(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 24B], tmp5687
	cmpl	$4, %edx	 #, bnd.365
	movq	%rcx, 1036(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 236B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__861.376, tmp3262
 # pms.c:76:     f->freq = freq;
	movq	%r8, 1068(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 268B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3262, tmp3265
	movq	%rax, %xmm5	 # tmp3206, tmp3206
	andps	%xmm2, %xmm4	 # mask__2549.377_4072, tmp3267
	andnps	%xmm5, %xmm2	 # tmp3206, tmp3268
	orps	%xmm2, %xmm4	 # tmp3268, vect_iftmp.50_865.378
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	472(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 24B], vect__863.370
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 256(%rsp)	 # vect_iftmp.50_865.378, %sfp
	psrlq	$32, %xmm4	 #, tmp3277
	movaps	%xmm5, %xmm2	 # vect__863.370, _4076
	movlps	%xmm4, 1060(%rsp)	 # tmp3277, MEM <vector(2) float> [(float *)&st + 260B]
	unpcklps	%xmm0, %xmm5	 # tmp5687, _4077
	shufps	$78, %xmm5, %xmm5	 #, _4077, _4077
	unpcklps	%xmm0, %xmm2	 # tmp5687, _4076
	movlps	%xmm2, 1020(%rsp)	 # _4076, MEM <vector(2) float> [(float *)&st + 220B]
	movss	256(%rsp), %xmm2	 # %sfp, _4080
	movlps	%xmm5, 1052(%rsp)	 # _4077, MEM <vector(2) float> [(float *)&st + 252B]
	movlps	%xmm2, 1028(%rsp)	 # _4080, MEM <vector(2) float> [(float *)&st + 228B]
	je	.L646	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	576(%rsp), %xmm2	 # MEM <vector(2) float> [(float *)_1365 + 32B], vect__861.376
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	528(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1364 + 32B], vect__862.373
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm2, %xmm4	 # vect__861.376, tmp3282
	cmpltps	%xmm4, %xmm3	 #, tmp3282, tmp3285
	movq	%rax, %xmm4	 # tmp3206, tmp3206
 # pms.c:76:     f->freq = freq;
	xorl	%eax, %eax	 #
	movq	%rax, 1100(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 300B]
	xorl	%eax, %eax	 #
	movq	%rax, 1132(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 332B]
	andps	%xmm3, %xmm2	 # mask__2549.377_2843, tmp3287
	andnps	%xmm4, %xmm3	 # tmp3206, tmp3288
	orps	%xmm2, %xmm3	 # tmp3287, vect_iftmp.50_865.378
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	480(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1363 + 32B], vect__863.370
 # pms.c:76:     f->freq = freq;
	movss	%xmm3, 256(%rsp)	 # vect_iftmp.50_865.378, %sfp
	psrlq	$32, %xmm3	 #, tmp3297
	movaps	%xmm4, %xmm2	 # vect__863.370, _2838
	movlps	%xmm3, 1124(%rsp)	 # tmp3297, MEM <vector(2) float> [(float *)&st + 324B]
	unpcklps	%xmm5, %xmm4	 # vect__862.373, _2839
	shufps	$78, %xmm4, %xmm4	 #, _2839, _2839
	unpcklps	%xmm5, %xmm2	 # vect__862.373, _2838
	movlps	%xmm2, 1084(%rsp)	 # _2838, MEM <vector(2) float> [(float *)&st + 284B]
	movss	256(%rsp), %xmm2	 # %sfp, _2849
	movlps	%xmm4, 1116(%rsp)	 # _2839, MEM <vector(2) float> [(float *)&st + 316B]
	movlps	%xmm2, 1092(%rsp)	 # _2849, MEM <vector(2) float> [(float *)&st + 292B]
.L646:
	testb	$1, %bl	 #, pretmp_2554
	je	.L637	 #,
	movl	%ebx, %eax	 # pretmp_2554, k
	andl	$-2, %eax	 #, k
.L645:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	cltq
	movss	544(%rsp,%rax,4), %xmm2	 # MEM[(float[10] *)_1365][k_929], _952
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	comiss	%xmm7, %xmm2	 # tmp3113, _952
	ja	.L648	 #,
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm6, %xmm2	 # tmp4406, _952
.L648:
 # pms.c:76:     f->freq = freq;
	movq	64(%rsp), %rdi	 # %sfp, ivtmp.699
	movq	%rax, %rdx	 # k, tmp3309
	movss	496(%rsp,%rax,4), %xmm3	 # MEM[(float[10] *)_1364][k_929], MEM[(float[10] *)_1364][k_929]
	salq	$5, %rdx	 #, tmp3309
	movss	448(%rsp,%rax,4), %xmm4	 # MEM[(float[10] *)_1363][k_929], _3538
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	xorl	%eax, %eax	 #
 # pms.c:76:     f->freq = freq;
	unpcklps	%xmm3, %xmm4	 # MEM[(float[10] *)_1364][k_929], _3538
	movlps	%xmm4, 28(%rdi,%rdx)	 # _3538, MEM <vector(2) float> [(float *)vectp.497_3542]
 # pms.c:78:     f->gain = gain;
	movss	%xmm2, 836(%rsp,%rdx)	 # _952, MEM <struct SynthState> [(struct Formant *)&st].formants[k_929].gain
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 840(%rsp,%rdx)	 #, MEM <struct SynthState> [(struct Formant *)&st].formants[k_929].b0
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	%rax, 44(%rdi,%rdx)	 #, MEM <vector(2) float> [(float *)vectp.499_3547]
	jmp	.L637	 #
.L1730:
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	movl	72(%rsp), %eax	 # %sfp, _1876
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	pxor	%xmm1, %xmm1	 # _1036
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	pxor	%xmm2, %xmm2	 # _1037
	cvtsi2ssl	308(%rsp), %xmm2	 # %sfp, _1037
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	subl	%r12d, %eax	 # ivtmp.853, _1876
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	cvtsi2ssl	%eax, %xmm1	 # _1876, _1036
 # pms.c:1065:         buf[n] = samp;
	movq	184(%rsp), %rax	 # %sfp, buf
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	divss	%xmm2, %xmm1	 # _1037, _1038
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	mulss	%xmm0, %xmm1	 # samp, samp_1040
 # pms.c:1065:         buf[n] = samp;
	movss	%xmm1, (%rax,%r12,4)	 # samp_1040, MEM[(float *)buf_615 + ivtmp.853_2899 * 4]
 # pms.c:887:     for (int n = 0; n < N; n++) {
	addq	$1, %r12	 #, ivtmp.853
	cmpl	%r12d, 192(%rsp)	 # ivtmp.853, %sfp
	jg	.L757	 #,
	movl	320(%rsp), %edi	 # %sfp, ramp_on
	movq	%rax, %rsi	 # buf, buf
	movl	308(%rsp), %r14d	 # %sfp, ramp_off
	movl	192(%rsp), %r11d	 # %sfp, _738
	movl	324(%rsp), %ebp	 # %sfp, pretmp_2785
	movq	328(%rsp), %rcx	 # %sfp, _4310
	jmp	.L758	 #
.L1064:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movaps	%xmm2, %xmm1	 # tmp3144, f0
	jmp	.L626	 #
.L667:
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	248(%rsp), %xmm0	 # %sfp, _960
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	252(%rsp), %xmm5	 # %sfp, _966
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm2, %xmm0	 # _2768, _960
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	224(%rsp), %xmm0	 # %sfp, y
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm7, %xmm2	 # tmp3113, _964
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm0, %xmm5	 # y, _966
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movaps	%xmm2, %xmm4	 # _964, _967
	subss	%xmm5, %xmm4	 # _966, _967
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	204(%rsp), %xmm4	 # %sfp, _967
	movss	%xmm4, 224(%rsp)	 # _967, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	264(%rsp), %xmm4	 # %sfp, _973
	mulss	%xmm0, %xmm4	 # y, _973
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm4, %xmm2	 # _973, _964
	movss	%xmm2, 204(%rsp)	 # _964, %sfp
	jmp	.L668	 #
.L1718:
 # pms.c:914:             int np = st->phon.nphon;
	movslq	1280(%rsp), %rax	 # st.phon.nphon,
 # pms.c:916:             if (t_ms < phon_t0[np]) {
	movss	0(%r13,%rax,4), %xmm0	 # *_735, *_735
 # pms.c:914:             int np = st->phon.nphon;
	movq	%rax, %rcx	 #,
 # pms.c:916:             if (t_ms < phon_t0[np]) {
	comiss	%xmm2, %xmm0	 # t_ms, *_735
	jbe	.L592	 #,
 # pms.c:918:                 while (lo<=hi) {
	subl	$1, %ecx	 #, hi
	js	.L592	 #,
 # pms.c:917:                 int lo=0, hi=np-1;
	xorl	%r8d, %r8d	 # lo
	jmp	.L599	 #
	.p2align 6
.L1733:
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	leal	-1(%rax), %ecx	 #, hi
.L596:
 # pms.c:918:                 while (lo<=hi) {
	cmpl	%r8d, %ecx	 # lo, hi
	jl	.L592	 #,
.L599:
 # pms.c:919:                     int mid=(lo+hi)/2;
	leal	(%r8,%rcx), %edx	 #, _740
 # pms.c:919:                     int mid=(lo+hi)/2;
	movl	%edx, %eax	 # _740, tmp3053
	shrl	$31, %eax	 #, tmp3053
	addl	%edx, %eax	 # _740, tmp3054
	sarl	%eax	 # mid_741
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	movslq	%eax, %rdi	 # mid_741, _742
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	movss	0(%r13,%rdi,4), %xmm0	 # *_744, *_744
	comiss	%xmm2, %xmm0	 # t_ms, *_744
	ja	.L1733	 #,
 # pms.c:921:                     else if (t_ms >= phon_t0[mid+1]) lo=mid+1;
	comiss	4(%r13,%rdi,4), %xmm2	 # *_749, t_ms
	jb	.L1625	 #,
 # pms.c:921:                     else if (t_ms >= phon_t0[mid+1]) lo=mid+1;
	leal	1(%rax), %r8d	 #, lo
	jmp	.L596	 #
.L1635:
 # pms.c:1045:             samp = 0.0f;
	pxor	%xmm2, %xmm2	 # samp
	jmp	.L705	 #
.L1717:
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
	je	.L1734	 #,
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	4(%r15), %xmm1	 # MEM[(const struct ContourPt *)pretmp_2544].f0_hz, f0
	jmp	.L561	 #
.L592:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L1666	 #,
	cmpl	$2, 268(%rsp)	 #, %sfp
	jbe	.L1061	 #,
	movl	%ebx, %eax	 # pretmp_2554, bnd.380_2880
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC96(%rip), %xmm2	 #, tmp3100
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC61(%rip), %xmm1	 #, tmp3101
	shrl	$2, %eax	 #, bnd.380_2880
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC43(%rip), %xmm0	 #, tmp3102
	subl	$1, %eax	 #, bnd.380_2880
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm2, %xmm2	 # tmp3100
	movaps	%xmm2, 448(%rsp)	 # tmp3100, MEM <vector(4) float> [(float *)_1363]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm1, %xmm1	 # tmp3101
	movaps	%xmm1, 496(%rsp)	 # tmp3101, MEM <vector(4) float> [(float *)_1364]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm0, %xmm0	 # tmp3102
	movaps	%xmm0, 544(%rsp)	 # tmp3102, MEM <vector(4) float> [(float *)_1365]
	jne	.L1735	 #,
.L614:
	movl	%ebx, %eax	 # pretmp_2554, _1367
	andl	$-4, %eax	 #, _1367
	testb	$3, %bl	 #, pretmp_2554
	je	.L1666	 #,
.L613:
	movss	.LC96(%rip), %xmm1	 #, tmp4415
	cltq
	movss	.LC61(%rip), %xmm0	 #, tmp4412
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
.L616:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm1, 0(%rbp,%rax,4)	 # tmp4415, MEM[(float *)_1363 + ivtmp.845_2400 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm0, (%rdi,%rax,4)	 # tmp4412, MEM[(float *)_1364 + ivtmp.845_2400 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm6, (%rcx,%rax,4)	 # tmp4406, MEM[(float *)_1365 + ivtmp.845_2400 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	addq	$1, %rax	 #, ivtmp.845
	cmpl	%eax, %ebx	 # ivtmp.845, pretmp_2554
	jg	.L616	 #,
.L1666:
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	pxor	%xmm12, %xmm12	 # a_amp
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movaps	%xmm12, %xmm13	 #, v_amp
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movaps	%xmm12, %xmm1	 #, f0
 # pms.c:894:         float gain_mult = 1.0f;
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
	jmp	.L563	 #
.L1045:
	movss	.LC51(%rip), %xmm7	 #, tmp4409
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	xorl	%r12d, %r12d	 #
	movl	$0x00000000, 196(%rsp)	 #, %sfp
	xorl	%r11d, %r11d	 # _738
	leal	-1(%rbx), %eax	 #, _917
	movslq	%ebx, %rcx	 # pretmp_2554, _4310
	movl	$0x00000000, 200(%rsp)	 #, %sfp
	movss	%xmm7, 100(%rsp)	 # tmp4409, %sfp
	movss	.LC204(%rip), %xmm7	 #, tmp4430
	movl	$0x00000000, 204(%rsp)	 #, %sfp
	movl	$0x00000000, 224(%rsp)	 #, %sfp
	movl	$0x00000000, 108(%rsp)	 #, %sfp
	movl	$0x00000000, 128(%rsp)	 #, %sfp
	movl	%r12d, 156(%rsp)	 #, %sfp
	movl	%eax, 268(%rsp)	 # _917, %sfp
	movss	%xmm7, 104(%rsp)	 # tmp4430, %sfp
.L538:
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	movl	268(%rsp), %eax	 # %sfp, _718
	movslq	%r11d, %r12	 # _738, ivtmp.767
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	pxor	%xmm7, %xmm7	 # tmp3802
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	movl	%r14d, 184(%rsp)	 # ramp_off, %sfp
	movl	%ebp, 296(%rsp)	 # pretmp_2785, %sfp
	leaq	0(,%rcx,4), %r14	 #, _4300
	movq	%rsi, 120(%rsp)	 # buf, %sfp
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	leaq	4(,%rax,4), %rax	 #, _767
	movq	%rax, 160(%rsp)	 # _767, %sfp
.L980:
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	pxor	%xmm2, %xmm2	 # _2598
	cvtsi2ssl	%r12d, %xmm2	 # ivtmp.767, _2598
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	divss	%xmm8, %xmm2	 # _607, _2599
 # pms.c:888:         float t_ms = (float)n / sr * 1000.0f;
	mulss	100(%rsp), %xmm2	 # %sfp, t_ms
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	jle	.L760	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	828(%rsp), %xmm0	 # st.formants[0].freq, st.formants[0].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$1, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 448(%rsp)	 # st.formants[0].freq, MEM[(float[10] *)_1363][0]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1736	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	860(%rsp), %xmm0	 # st.formants[1].freq, st.formants[1].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$2, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 452(%rsp)	 # st.formants[1].freq, MEM[(float[10] *)_1363][1]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1737	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	892(%rsp), %xmm0	 # st.formants[2].freq, st.formants[2].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 456(%rsp)	 # st.formants[2].freq, MEM[(float[10] *)_1363][2]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	924(%rsp), %xmm0	 # st.formants[3].freq, st.formants[3].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 460(%rsp)	 # st.formants[3].freq, MEM[(float[10] *)_1363][3]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	956(%rsp), %xmm0	 # st.formants[4].freq, st.formants[4].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 464(%rsp)	 # st.formants[4].freq, MEM[(float[10] *)_1363][4]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	988(%rsp), %xmm0	 # st.formants[5].freq, st.formants[5].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 468(%rsp)	 # st.formants[5].freq, MEM[(float[10] *)_1363][5]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1020(%rsp), %xmm0	 # st.formants[6].freq, st.formants[6].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 472(%rsp)	 # st.formants[6].freq, MEM[(float[10] *)_1363][6]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1052(%rsp), %xmm0	 # st.formants[7].freq, st.formants[7].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 476(%rsp)	 # st.formants[7].freq, MEM[(float[10] *)_1363][7]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1084(%rsp), %xmm0	 # st.formants[8].freq, st.formants[8].freq
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$9, %ebx	 #, pretmp_2554
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	%xmm0, 480(%rsp)	 # st.formants[8].freq, MEM[(float[10] *)_1363][8]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L1669	 #,
 # pms.c:897:             freq [k] = st->formants[k].freq;
	movss	1116(%rsp), %xmm0	 # st.formants[9].freq, st.formants[9].freq
	movss	%xmm0, 484(%rsp)	 # st.formants[9].freq, MEM[(float[10] *)_1363][9]
.L1669:
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, _2015
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$3, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 496(%rsp)	 # _2015, MEM[(float[10] *)_1364][0]
	movss	864(%rsp), %xmm0	 # st.formants[1].bw, st.formants[1].bw
	movss	%xmm0, 500(%rsp)	 # st.formants[1].bw, MEM[(float[10] *)_1364][1]
	movss	896(%rsp), %xmm0	 # st.formants[2].bw, st.formants[2].bw
	movss	%xmm0, 504(%rsp)	 # st.formants[2].bw, MEM[(float[10] *)_1364][2]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	928(%rsp), %xmm0	 # st.formants[3].bw, st.formants[3].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$4, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 508(%rsp)	 # st.formants[3].bw, MEM[(float[10] *)_1364][3]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	960(%rsp), %xmm0	 # st.formants[4].bw, st.formants[4].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$5, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 512(%rsp)	 # st.formants[4].bw, MEM[(float[10] *)_1364][4]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	992(%rsp), %xmm0	 # st.formants[5].bw, st.formants[5].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$6, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 516(%rsp)	 # st.formants[5].bw, MEM[(float[10] *)_1364][5]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1024(%rsp), %xmm0	 # st.formants[6].bw, st.formants[6].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$7, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 520(%rsp)	 # st.formants[6].bw, MEM[(float[10] *)_1364][6]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1056(%rsp), %xmm0	 # st.formants[7].bw, st.formants[7].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$8, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 524(%rsp)	 # st.formants[7].bw, MEM[(float[10] *)_1364][7]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1088(%rsp), %xmm0	 # st.formants[8].bw, st.formants[8].bw
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	cmpl	$9, %ebx	 #, pretmp_2554
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	%xmm0, 528(%rsp)	 # st.formants[8].bw, MEM[(float[10] *)_1364][8]
 # pms.c:896:         for(int k=0;k<FORMANTS;k++){
	je	.L762	 #,
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	1120(%rsp), %xmm0	 # st.formants[9].bw, st.formants[9].bw
	movss	%xmm0, 532(%rsp)	 # st.formants[9].bw, MEM[(float[10] *)_1364][9]
.L762:
 # pms.c:899:             fgain[k] = st->formant_gains[k];
	movq	160(%rsp), %r8	 # %sfp,
	leaq	544(%rsp), %rcx	 #, tmp4410
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	leaq	1148(%rsp), %rdx	 #, tmp3624
	call	memcpy	 #
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
.L760:
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L772	 #,
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _1120
 # pms.c:902:         if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _1120
	jle	.L772	 #,
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	(%r15), %xmm0	 # MEM[(const struct ContourPt *)pretmp_2544].time_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	jnb	.L1738	 #,
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
	je	.L780	 #,
	movq	%r15, %rcx	 # pretmp_2544,
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	call	contour_f0.part.0	 #
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
	movaps	%xmm0, %xmm1	 # f0, f0
.L779:
 # pms.c:911:         } else if (st->mode == MODE_PHONEME && phon_t0) {
	cmpb	$0, 150(%rsp)	 #, %sfp
	jne	.L1739	 #,
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	140(%rsp), %xmm5	 # %sfp, pretmp_2540
 # pms.c:894:         float gain_mult = 1.0f;
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
 # pms.c:892:         float a_amp     = st->aspiration_amp;
	movss	144(%rsp), %xmm13	 # %sfp, a_amp
 # pms.c:891:         float v_amp     = st->voicing_amp;
	movss	136(%rsp), %xmm12	 # %sfp, v_amp
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	%xmm5, 112(%rsp)	 # pretmp_2540, %sfp
.L782:
 # pms.c:992:         if (st->vibrato_depth_hz > 0.0f) {
	movss	48(%rsp), %xmm5	 # %sfp, pretmp_2546
	comiss	%xmm7, %xmm5	 # tmp3802, pretmp_2546
	jbe	.L839	 #,
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	movss	.LC192(%rip), %xmm0	 #, _2258
	mulss	1204(%rsp), %xmm0	 # st.vibrato_rate_hz, _2258
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	divss	%xmm8, %xmm0	 # _607, _2257
 # pms.c:993:             st->vibrato_phase += TWO_PI_F * st->vibrato_rate_hz / sr;
	addss	2388(%rsp), %xmm0	 # st.vibrato_phase, prephitmp_2254
 # pms.c:994:             if (st->vibrato_phase >= TWO_PI_F) st->vibrato_phase -= TWO_PI_F;
	comiss	.LC192(%rip), %xmm0	 #, prephitmp_2254
	jb	.L841	 #,
 # pms.c:994:             if (st->vibrato_phase >= TWO_PI_F) st->vibrato_phase -= TWO_PI_F;
	subss	.LC192(%rip), %xmm0	 #, prephitmp_2254
.L841:
	movss	%xmm1, 132(%rsp)	 # f0, %sfp
	movss	%xmm0, 2388(%rsp)	 # prephitmp_2254, st.vibrato_phase
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	call	sinf	 #
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	mulss	48(%rsp), %xmm0	 # %sfp, _2252
 # pms.c:995:             f0 += st->vibrato_depth_hz * sinf(st->vibrato_phase);
	movss	132(%rsp), %xmm1	 # %sfp, f0
	addss	%xmm0, %xmm1	 # _2252, f0
.L839:
 # pms.c:998:         if (st->jitter_percent > 0.0f)
	movss	80(%rsp), %xmm5	 # %sfp, pretmp_2548
	comiss	%xmm7, %xmm5	 # tmp3802, pretmp_2548
	jbe	.L843	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_2245
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _2236
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	divss	.LC2(%rip), %xmm5	 #, _2234
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_2245, _2244
	sall	$13, %eax	 #, _2244
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_2245, _2243
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2243, _2242
	shrl	$17, %edx	 #, _2242
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2243, _2241
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2241, _2240
	sall	$5, %eax	 #, _2240
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2241, _2239
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _2239, _2236
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _2235
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _2239, g_noise_state
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	mulss	%xmm5, %xmm0	 # _2234, _2233
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	addss	%xmm6, %xmm0	 # tmp4406, _2232
 # pms.c:999:             f0 *= 1.0f + white_noise() * (st->jitter_percent / 100.0f);
	mulss	%xmm0, %xmm1	 # _2232, f0
.L843:
 # pms.c:1002:         if (st->shimmer_percent > 0.0f)
	movss	84(%rsp), %xmm5	 # %sfp, pretmp_2550
	comiss	%xmm7, %xmm5	 # tmp3802, pretmp_2550
	jbe	.L1644	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_2228
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _2219
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	divss	.LC2(%rip), %xmm5	 #, _2217
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_2228, _2227
	sall	$13, %eax	 #, _2227
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_2228, _2226
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2226, _2225
	shrl	$17, %edx	 #, _2225
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2226, _2224
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2224, _2223
	sall	$5, %eax	 #, _2223
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2224, _2222
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _2222, _2219
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _2218
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _2222, g_noise_state
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	mulss	%xmm5, %xmm0	 # _2217, _2216
 # pms.c:1003:             shimmer = 1.0f + white_noise() * (st->shimmer_percent / 100.0f);
	addss	%xmm6, %xmm0	 # tmp4406, _2216
	movss	%xmm0, 132(%rsp)	 # _2216, %sfp
.L845:
 # pms.c:1005:         if (f0 > 0.0f) f0 = clampf(f0, 40.0f, 500.0f);
	comiss	%xmm7, %xmm1	 # tmp3802, f0
	jbe	.L847	 #,
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC98(%rip), %xmm2	 #, tmp3833
	comiss	%xmm1, %xmm2	 # f0, tmp3833
	ja	.L1099	 #,
	movss	.LC93(%rip), %xmm2	 #, tmp3835
	movaps	%xmm2, %xmm3	 # tmp3835, tmp3837
	cmpltss	%xmm1, %xmm3	 #, f0, tmp3837
	andps	%xmm3, %xmm2	 # tmp3837, tmp3838
	andnps	%xmm1, %xmm3	 # f0, tmp3839
	orps	%xmm2, %xmm3	 # tmp3838, tmp3839
	movaps	%xmm3, %xmm1	 # tmp3839, f0
.L847:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L849	 #,
	comiss	%xmm8, %xmm7	 # _607, tmp3802
	jnb	.L1740	 #,
	movq	64(%rsp), %rax	 # %sfp, ivtmp.689
	xorl	%edi, %edi	 # ivtmp.692
	movq	%r12, 208(%rsp)	 # ivtmp.767, %sfp
	cmpl	$0, 56(%rsp)	 #, %sfp
	leaq	448(%rsp), %rbp	 #, tmp4407
	movl	%ebx, 288(%rsp)	 # pretmp_2554, %sfp
	movss	%xmm9, 192(%rsp)	 # sm_a, %sfp
	movq	%rbp, %rbx	 # tmp4407, tmp4407
	movss	%xmm10, 216(%rsp)	 # sm_fr, %sfp
	leaq	544(%rsp), %rbp	 #, ivtmp.686
	movss	%xmm1, 256(%rsp)	 # f0, %sfp
	movq	%rax, %rsi	 # ivtmp.689, ivtmp.689
	leaq	496(%rsp), %r12	 #, tmp4408
	je	.L868	 #,
	jmp	.L860	 #
	.p2align 4,,10
	.p2align 3
.L1741:
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm0, %xmm7	 # _2175, tmp3802
	jnb	.L858	 #,
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	mulss	.LC185(%rip), %xmm0	 #, _2165
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	divss	%xmm8, %xmm0	 # _607, _2164
	call	expf	 #
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	movss	.LC192(%rip), %xmm3	 #, _2161
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	movaps	%xmm0, %xmm9	 #, r
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	mulss	%xmm10, %xmm3	 # _2174, _2161
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	divss	%xmm8, %xmm3	 # _607, _2161
	movaps	%xmm3, %xmm0	 # _2161, theta_2160
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	call	cosf	 #
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movss	.LC191(%rip), %xmm1	 #, _2159
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 #, _2158
 # pms.c:87:     f->a2 =  r * r;
	movaps	%xmm9, %xmm0	 # r, _2155
	mulss	%xmm9, %xmm0	 # r, _2155
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm9, %xmm1	 # r, _2159
 # pms.c:87:     f->a2 =  r * r;
	movss	%xmm0, 48(%rsi)	 # _2155, MEM[(float *)_4388 + 48B]
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	movaps	%xmm6, %xmm0	 # tmp4406, _2153
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm3, %xmm1	 # _2158, _2157
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	subss	%xmm9, %xmm0	 # r, _2153
 # pms.c:92:         f->b0 = (1.0f - r);                                             
	unpcklps	%xmm1, %xmm0	 # _2157, _3386
	movlps	%xmm0, 40(%rsi)	 # _3386, MEM <vector(2) float> [(float *)_4388 + 40B]
.L859:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	addq	$4, %rdi	 #, ivtmp.692
	addq	$4, %rbp	 #, ivtmp.686
	addq	$32, %rsi	 #, ivtmp.689
	cmpq	%r14, %rdi	 # _4300, ivtmp.692
	je	.L1673	 #,
.L860:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movss	0(%rbp), %xmm1	 # MEM[(float *)_483], iftmp.50_2176
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm7, %xmm0	 # tmp3802, tmp4520
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%rbx,%rdi), %xmm10	 # MEM[(float *)_1363 + ivtmp.692_4235 * 1], _2174
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltss	%xmm1, %xmm0	 #, iftmp.50_2176, tmp4520
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm10, %xmm7	 # _2174, tmp3802
 # pms.c:76:     f->freq = freq;
	movaps	%xmm10, %xmm4	 # _2174, _3382
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	andps	%xmm0, %xmm1	 # tmp4520, tmp4521
	andnps	%xmm6, %xmm0	 # tmp4406, tmp4522
	orps	%xmm0, %xmm1	 # tmp4522, iftmp.50_2176
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%r12,%rdi), %xmm0	 # MEM[(float *)_1364 + ivtmp.692_4235 * 1], _2175
 # pms.c:78:     f->gain = gain;
	movss	%xmm1, 36(%rsi)	 # iftmp.50_2176, MEM[(float *)_4388 + 36B]
 # pms.c:76:     f->freq = freq;
	unpcklps	%xmm0, %xmm4	 # _2175, _3382
	movlps	%xmm4, 28(%rsi)	 # _3382, MEM <vector(2) float> [(float *)_4388 + 28B]
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	jb	.L1741	 #,
.L858:
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	$0, 40(%rsi)	 #, MEM <vector(2) float> [(float *)_4388 + 40B]
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 48(%rsi)	 #, MEM[(float *)_4388 + 48B]
	jmp	.L859	 #
	.p2align 4,,10
	.p2align 3
.L1646:
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm0, %xmm7	 # _2205, tmp3802
	jnb	.L865	 #,
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	mulss	.LC185(%rip), %xmm0	 #, _2198
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	divss	%xmm8, %xmm0	 # _607, _2197
	call	expf	 #
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	movss	.LC192(%rip), %xmm3	 #, _2194
 # pms.c:84:     float r     = expf(-PI_F * bw / sr);
	movaps	%xmm0, %xmm9	 #, r
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	mulss	%xmm10, %xmm3	 # _2204, _2194
 # pms.c:85:     float theta = TWO_PI_F * freq / sr;
	divss	%xmm8, %xmm3	 # _607, _2194
	movaps	%xmm3, %xmm0	 # _2194, theta_2193
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	call	cosf	 #
 # pms.c:87:     f->a2 =  r * r;
	movaps	%xmm9, %xmm1	 # r, r
	mulss	%xmm9, %xmm1	 # r, r
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 #, _2191
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movss	.LC191(%rip), %xmm0	 #, _2192
	mulss	%xmm9, %xmm0	 # r, _2192
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	mulss	%xmm3, %xmm0	 # _2191, _2190
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	movaps	%xmm0, %xmm3	 # _2190, _3360
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	addss	%xmm6, %xmm0	 # tmp4406, _2186
 # pms.c:86:     f->a1 = -2.0f * r * cosf(theta);
	unpcklps	%xmm1, %xmm3	 # _2188, _3360
	movlps	%xmm3, 44(%rsi)	 # _3360, MEM <vector(2) float> [(float *)_3012 + 44B]
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	addss	%xmm1, %xmm0	 # _2188, _2185
 # pms.c:89:         f->b0 = 1.0f + f->a1 + f->a2;
	movss	.LC166(%rip), %xmm1	 #, tmp4526
	maxss	%xmm0, %xmm1	 # _2185, tmp4526
	movss	%xmm1, 40(%rsi)	 # tmp4526, MEM[(float *)_3012 + 40B]
.L864:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	addq	$4, %rdi	 #, ivtmp.702
	addq	$4, %rbp	 #, ivtmp.696
	addq	$32, %rsi	 #, ivtmp.699
	cmpq	%rdi, %r14	 # ivtmp.702, _4300
	je	.L1673	 #,
.L868:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movss	0(%rbp), %xmm1	 # MEM[(float *)_4311], iftmp.50_2206
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm7, %xmm0	 # tmp3802, tmp4523
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%rbx,%rdi), %xmm10	 # MEM[(float *)_1363 + ivtmp.702_4322 * 1], _2204
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltss	%xmm1, %xmm0	 #, iftmp.50_2206, tmp4523
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	comiss	%xmm10, %xmm7	 # _2204, tmp3802
 # pms.c:76:     f->freq = freq;
	movaps	%xmm10, %xmm4	 # _2204, _3357
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	andps	%xmm0, %xmm1	 # tmp4523, tmp4524
	andnps	%xmm6, %xmm0	 # tmp4406, tmp4525
	orps	%xmm0, %xmm1	 # tmp4525, iftmp.50_2206
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movss	(%r12,%rdi), %xmm0	 # MEM[(float *)_1364 + ivtmp.702_4322 * 1], _2205
 # pms.c:78:     f->gain = gain;
	movss	%xmm1, 36(%rsi)	 # iftmp.50_2206, MEM[(float *)_3012 + 36B]
 # pms.c:76:     f->freq = freq;
	unpcklps	%xmm0, %xmm4	 # _2205, _3357
	movlps	%xmm4, 28(%rsi)	 # _3357, MEM <vector(2) float> [(float *)_3012 + 28B]
 # pms.c:80:     if (freq <= 0.0f || bw <= 0.0f || sr <= 0.0f) {
	jb	.L1646	 #,
.L865:
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	$0, 40(%rsi)	 #, MEM <vector(2) float> [(float *)_3012 + 40B]
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 48(%rsi)	 #, MEM[(float *)_3012 + 48B]
	jmp	.L864	 #
.L1673:
	movq	208(%rsp), %r12	 # %sfp, ivtmp.767
	movl	288(%rsp), %ebx	 # %sfp, pretmp_2554
	movss	192(%rsp), %xmm9	 # %sfp, sm_a
	movss	216(%rsp), %xmm10	 # %sfp, sm_fr
	movss	256(%rsp), %xmm1	 # %sfp, f0
.L849:
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	movaps	%xmm6, %xmm2	 # tmp4406, _2136
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	movss	104(%rsp), %xmm5	 # %sfp, tmp4430
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	movaps	%xmm15, %xmm3	 # sm_coef, _2137
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	subss	%xmm15, %xmm2	 # sm_coef, _2136
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	mulss	%xmm11, %xmm3	 # sm_v, _2137
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	mulss	%xmm15, %xmm9	 # sm_coef, _2133
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	comiss	%xmm11, %xmm5	 # sm_v, tmp4430
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	mulss	%xmm15, %xmm10	 # sm_coef, _2130
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	mulss	%xmm2, %xmm12	 # _2136, _2135
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	mulss	%xmm2, %xmm13	 # _2136, _2132
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	mulss	112(%rsp), %xmm2	 # %sfp, _2129
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	addss	%xmm3, %xmm12	 # _2137, sm_v
 # pms.c:1016:         sm_a  = sm_a  * sm_coef + a_amp  * (1.0f - sm_coef);
	addss	%xmm13, %xmm9	 # _2132, sm_a
 # pms.c:1017:         sm_fr = sm_fr * sm_coef + fr_amp * (1.0f - sm_coef);
	addss	%xmm2, %xmm10	 # _2129, sm_fr
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	jbe	.L869	 #,
 # pms.c:1018:         if (prev_sm_v < 1e-3f && sm_v >= 1e-3f)
	comiss	.LC204(%rip), %xmm12	 #, sm_v
	jb	.L869	 #,
 # pms.c:1019:             st->pitch_phase = 0.0f;
	movss	%xmm7, 2384(%rsp)	 # tmp3802, st.pitch_phase
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	%xmm7, %xmm1	 # tmp3802, f0
	jbe	.L883	 #,
.L872:
 # pms.c:1023:             float period = (float)sr / f0;
	movaps	%xmm8, %xmm2	 # _607, period_2126
	divss	%xmm1, %xmm2	 # f0, period_2126
 # pms.c:1024:             st->pitch_phase += 1.0f / period;
	movaps	%xmm6, %xmm1	 # tmp4406, _2124
	divss	%xmm2, %xmm1	 # period_2126, _2124
 # pms.c:1024:             st->pitch_phase += 1.0f / period;
	addss	2384(%rsp), %xmm1	 # st.pitch_phase, prephitmp_2121
 # pms.c:1025:             if (st->pitch_phase >= 1.0f) st->pitch_phase -= 1.0f;
	comiss	%xmm6, %xmm1	 # tmp4406, prephitmp_2121
	jb	.L874	 #,
 # pms.c:1025:             if (st->pitch_phase >= 1.0f) st->pitch_phase -= 1.0f;
	subss	%xmm6, %xmm1	 # tmp4406, prephitmp_2121
.L874:
	movss	%xmm1, 2384(%rsp)	 # prephitmp_2121, st.pitch_phase
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	movl	808(%rsp), %eax	 # st.voice_type, _2120
 # pms.c:786:     if (vt == VOICE_IMPULSIVE) {
	cmpl	$2, %eax	 #, _2120
	je	.L1742	 #,
 # pms.c:789:         if (phase < 0.7f)
	movss	.LC208(%rip), %xmm2	 #, tmp4024
	comiss	%xmm1, %xmm2	 # prephitmp_2121, tmp4024
	jbe	.L1648	 #,
 # pms.c:790:             v = phase / 0.7f;
	movaps	%xmm1, %xmm3	 # prephitmp_2121, prephitmp_2121
	divss	%xmm2, %xmm3	 # tmp4024, prephitmp_2121
.L881:
 # pms.c:794:         if (vt == VOICE_WHISPER)
	subl	$1, %eax	 #, _2120
	je	.L882	 #,
 # pms.c:793:         v = 2.0f * v - 1.0f;
	addss	%xmm3, %xmm3	 # v, _2102
 # pms.c:793:         v = 2.0f * v - 1.0f;
	subss	%xmm6, %xmm3	 # tmp4406, v
.L877:
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	mulss	%xmm12, %xmm3	 # sm_v, _2117
 # pms.c:1026:             v_sig = glottal_wave(st->pitch_phase, st->voice_type) * sm_v * shimmer;
	mulss	132(%rsp), %xmm3	 # %sfp, v_sig
.L873:
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	comiss	.LC206(%rip), %xmm9	 #, sm_a
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	pxor	%xmm1, %xmm1	 # a_sig
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	jbe	.L885	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_2087
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm0, %xmm0	 # _2078
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	168(%rsp), %xmm2	 # %sfp, _2076
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	128(%rsp), %xmm1	 # %sfp, asp$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	176(%rsp), %xmm4	 # %sfp, _2073
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_2087, _2086
	sall	$13, %eax	 #, _2086
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_2087, _2085
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2085, _2084
	shrl	$17, %edx	 #, _2084
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2085, _2083
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2083, _2082
	sall	$5, %eax	 #, _2082
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2083, _2081
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm0	 # _2081, _2078
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm0	 #, _2077
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _2081, g_noise_state
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm0, %xmm2	 # _2077, _2076
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	172(%rsp), %xmm0	 # %sfp, _2074
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	%xmm2, %xmm1	 # _2076, asp$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm1, %xmm4	 # y, _2073
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	subss	%xmm4, %xmm0	 # _2073, _2072
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	108(%rsp), %xmm0	 # %sfp, _2072
	movss	%xmm0, 128(%rsp)	 # _2072, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	180(%rsp), %xmm0	 # %sfp, _2070
	mulss	%xmm1, %xmm0	 # y, _2070
 # pms.c:1029:         float a_sig  = sm_a  > 1e-5f ? biquad_process(&asp,  white_noise()) * sm_a  : 0.0f;
	mulss	%xmm9, %xmm1	 # sm_a, a_sig
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm0, %xmm2	 # _2070, _2076
	movss	%xmm2, 108(%rsp)	 # _2076, %sfp
.L885:
 # pms.c:1033:             : 0.0f;
	comiss	.LC206(%rip), %xmm10	 #, sm_fr
 # pms.c:1030:         float fr_sig = sm_fr > 1e-5f
	pxor	%xmm0, %xmm0	 # fr_sig
 # pms.c:1033:             : 0.0f;
	jbe	.L887	 #,
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, pretmp_2063
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm2, %xmm2	 # _2040
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # pretmp_2063, _2062
	sall	$13, %eax	 #, _2062
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # pretmp_2063, _2061
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2061, _2058
	shrl	$17, %edx	 #, _2058
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2061, _2057
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2057, _2056
	sall	$5, %eax	 #, _2056
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2057, _2051
 # pms.c:1032:                         : biquad_process(&fric,       white_noise())) * sm_fr
	cmpl	$0, 156(%rsp)	 #, %sfp
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm2	 # _2051, _2040
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm2	 #, _2023
 # pms.c:1032:                         : biquad_process(&fric,       white_noise())) * sm_fr
	je	.L889	 #,
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	232(%rsp), %xmm4	 # %sfp, _1795
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	200(%rsp), %xmm0	 # %sfp, burst_filt$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	240(%rsp), %xmm5	 # %sfp, _1789
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm2, %xmm4	 # _2023, _1795
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	236(%rsp), %xmm2	 # %sfp, _1793
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	%xmm4, %xmm0	 # _1795, burst_filt$z1
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm0, %xmm5	 # y, _1789
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	subss	%xmm5, %xmm2	 # _1789, _1788
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	196(%rsp), %xmm2	 # %sfp, _1788
	movss	%xmm2, 200(%rsp)	 # _1788, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	244(%rsp), %xmm2	 # %sfp, _1748
	mulss	%xmm0, %xmm2	 # y, _1748
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm2, %xmm4	 # _1748, _1795
	movss	%xmm4, 196(%rsp)	 # _1795, %sfp
.L890:
 # pms.c:1030:         float fr_sig = sm_fr > 1e-5f
	mulss	%xmm10, %xmm0	 # sm_fr, fr_sig
	movl	%eax, g_noise_state(%rip)	 # _2051, g_noise_state
.L887:
 # pms.c:1038:         if (cascade) {
	movl	56(%rsp), %edx	 # %sfp,
 # pms.c:1035:         float excitation = v_sig + a_sig;
	addss	%xmm3, %xmm1	 # v_sig, samp
 # pms.c:1038:         if (cascade) {
	testl	%edx, %edx	 #
	je	.L891	 #,
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L1105	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	828(%rsp), %xmm2	 # st.formants[0].freq, st.formants[0].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[0].freq
	jbe	.L1651	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	840(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].b0, _3143
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _3143
	jp	.L895	 #,
	je	.L1743	 #,
.L895:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	852(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z1, _3149
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _3147
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	844(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a1, _3150
	mulss	%xmm3, %xmm4	 # _3149, _3150
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm4, %xmm2	 # _3150, _3151
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	848(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2
	mulss	856(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z2, _3154
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm4, %xmm2	 # _3154, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm4	 # y, _3408
 # pms.c:102:     return y * f->gain;
	mulss	836(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].gain, _3144
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm4	 # _3149, _3408
	movlps	%xmm4, 852(%rsp)	 # _3408, MEM <vector(2) float> [(float *)&st + 52B]
.L897:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm7, %xmm2	 # tmp3802, samp
.L893:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	860(%rsp), %xmm3	 # st.formants[1].freq, st.formants[1].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[1].freq
	jbe	.L899	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	872(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].b0, _3167
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3167
	jp	.L901	 #,
	je	.L1744	 #,
.L901:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	884(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z1, _3173
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3171
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	876(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a1, _3174
	mulss	%xmm4, %xmm3	 # _3173, _3174
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3174, _3175
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	880(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2
	mulss	888(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z2, _3178
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3178, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3410
 # pms.c:102:     return y * f->gain;
	mulss	868(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3173, _3410
	movlps	%xmm3, 884(%rsp)	 # _3410, MEM <vector(2) float> [(float *)&st + 84B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3168
.L903:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3168, samp
.L899:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$2, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	892(%rsp), %xmm3	 # st.formants[2].freq, st.formants[2].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[2].freq
	jbe	.L904	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	904(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].b0, _3191
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3191
	jp	.L906	 #,
	je	.L1745	 #,
.L906:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	916(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z1, _3197
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3195
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	908(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a1, _3198
	mulss	%xmm4, %xmm3	 # _3197, _3198
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3198, _3199
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	912(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2
	mulss	920(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z2, _3202
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3202, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3412
 # pms.c:102:     return y * f->gain;
	mulss	900(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3197, _3412
	movlps	%xmm3, 916(%rsp)	 # _3412, MEM <vector(2) float> [(float *)&st + 116B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3192
.L908:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3192, samp
.L904:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$3, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	924(%rsp), %xmm3	 # st.formants[3].freq, st.formants[3].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[3].freq
	jbe	.L909	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	936(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].b0, _3215
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3215
	jp	.L911	 #,
	je	.L1746	 #,
.L911:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	948(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z1, _3221
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3219
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	940(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a1, _3222
	mulss	%xmm4, %xmm3	 # _3221, _3222
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3222, _3223
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	944(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2
	mulss	952(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z2, _3226
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3226, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3415
 # pms.c:102:     return y * f->gain;
	mulss	932(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3221, _3415
	movlps	%xmm3, 948(%rsp)	 # _3415, MEM <vector(2) float> [(float *)&st + 148B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3216
.L913:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3216, samp
.L909:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$4, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	956(%rsp), %xmm3	 # st.formants[4].freq, st.formants[4].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[4].freq
	jbe	.L914	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	968(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].b0, _3239
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3239
	jp	.L916	 #,
	je	.L1747	 #,
.L916:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	980(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z1, _3245
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3243
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	972(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a1, _3246
	mulss	%xmm4, %xmm3	 # _3245, _3246
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3246, _3247
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	976(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2
	mulss	984(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z2, _3250
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3250, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3417
 # pms.c:102:     return y * f->gain;
	mulss	964(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3245, _3417
	movlps	%xmm3, 980(%rsp)	 # _3417, MEM <vector(2) float> [(float *)&st + 180B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3240
.L918:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3240, samp
.L914:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$5, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	988(%rsp), %xmm3	 # st.formants[5].freq, st.formants[5].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[5].freq
	jbe	.L919	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1000(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].b0, _3263
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3263
	jp	.L921	 #,
	je	.L1748	 #,
.L921:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1012(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z1, _3269
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3267
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1004(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a1, _3270
	mulss	%xmm4, %xmm3	 # _3269, _3270
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3270, _3271
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1008(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2
	mulss	1016(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z2, _3274
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3274, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3433
 # pms.c:102:     return y * f->gain;
	mulss	996(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3269, _3433
	movlps	%xmm3, 1012(%rsp)	 # _3433, MEM <vector(2) float> [(float *)&st + 212B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3264
.L923:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3264, samp
.L919:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$6, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1020(%rsp), %xmm3	 # st.formants[6].freq, st.formants[6].freq
	comiss	%xmm7, %xmm3	 # tmp3802, st.formants[6].freq
	jbe	.L924	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1032(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].b0, _3287
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm5	 # tmp3802, _3287
	jp	.L926	 #,
	je	.L1749	 #,
.L926:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1044(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z1, _3293
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3291
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1036(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a1, _3294
	mulss	%xmm4, %xmm3	 # _3293, _3294
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3294, _3295
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1040(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2
	mulss	1048(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z2, _3298
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3298, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3438
 # pms.c:102:     return y * f->gain;
	mulss	1028(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3293, _3438
	movlps	%xmm3, 1044(%rsp)	 # _3438, MEM <vector(2) float> [(float *)&st + 244B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3288
.L928:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3288, samp
.L924:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$7, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1052(%rsp), %xmm4	 # st.formants[7].freq, st.formants[7].freq
	pxor	%xmm3, %xmm3	 # tmp4136
	comiss	%xmm3, %xmm4	 # tmp4136, st.formants[7].freq
	jbe	.L929	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1064(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].b0, _3311
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm3, %xmm5	 # tmp4136, _3311
	jp	.L931	 #,
	je	.L933	 #,
.L931:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1076(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z1, _3317
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3315
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1068(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a1, _3318
	mulss	%xmm4, %xmm3	 # _3317, _3318
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3318, _3319
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1072(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2
	mulss	1080(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z2, _3322
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3322, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3440
 # pms.c:102:     return y * f->gain;
	mulss	1060(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3317, _3440
	movlps	%xmm3, 1076(%rsp)	 # _3440, MEM <vector(2) float> [(float *)&st + 276B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3312
.L933:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3312, samp
.L929:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$8, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1084(%rsp), %xmm4	 # st.formants[8].freq, st.formants[8].freq
	pxor	%xmm3, %xmm3	 # tmp4146
	comiss	%xmm3, %xmm4	 # tmp4146, st.formants[8].freq
	jbe	.L934	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1096(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].b0, _3335
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm3, %xmm5	 # tmp4146, _3335
	jp	.L936	 #,
	je	.L938	 #,
.L936:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1108(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z1, _3341
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm5	 # samp, _3339
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1100(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a1, _3342
	mulss	%xmm4, %xmm3	 # _3341, _3342
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3342, _3343
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1104(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2
	mulss	1112(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z2, _3346
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm5	 # _3346, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm5, %xmm3	 # y, _3443
 # pms.c:102:     return y * f->gain;
	mulss	1092(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _3341, _3443
	movlps	%xmm3, 1108(%rsp)	 # _3443, MEM <vector(2) float> [(float *)&st + 308B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm5, %xmm3	 # y, _3336
.L938:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm3, %xmm2	 # _3336, samp
.L934:
 # pms.c:1046:             for(int k=0;k<FORMANTS;k++)
	cmpl	$9, %ebx	 #, pretmp_2554
	je	.L892	 #,
 # pms.c:1047:                 if(st->formants[k].freq > 0.0f)
	movss	1116(%rsp), %xmm3	 # st.formants[9].freq, st.formants[9].freq
	pxor	%xmm4, %xmm4	 # tmp4156
	comiss	%xmm4, %xmm3	 # tmp4156, st.formants[9].freq
	jbe	.L892	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1128(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].b0, _1370
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm4, %xmm3	 # tmp4156, _1370
	jp	.L1234	 #,
	je	.L1107	 #,
.L1234:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1140(%rsp), %xmm4	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z1, _1221
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm3, %xmm1	 # _1370, _1251
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1132(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a1, _1201
	mulss	%xmm4, %xmm5	 # _1221, _1201
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm5, %xmm1	 # _1201, _1194
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1144(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2, MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2
	mulss	1136(%rsp), %xmm5	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2, _1190
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm5, %xmm1	 # _1190, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm1, %xmm3	 # y, _3445
 # pms.c:102:     return y * f->gain;
	mulss	1124(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].gain, _1369
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm4, %xmm3	 # _1221, _3445
	movlps	%xmm3, 1140(%rsp)	 # _3445, MEM <vector(2) float> [(float *)&st + 340B]
.L941:
 # pms.c:1048:                     samp += formant_process(&st->formants[k], excitation);
	addss	%xmm1, %xmm2	 # _1369, samp
.L892:
 # pms.c:1049:             samp += fr_sig * 0.35f;
	mulss	.LC210(%rip), %xmm0	 #, _1391
 # pms.c:1049:             samp += fr_sig * 0.35f;
	addss	%xmm2, %xmm0	 # samp, samp
.L943:
 # pms.c:1052:         if (st->lip_radiation_enabled) {
	movl	88(%rsp), %eax	 # %sfp,
	testl	%eax, %eax	 #
	je	.L976	 #,
 # pms.c:1053:             float y = samp - 0.97f * st->lip_rad_z1;
	movss	.LC211(%rip), %xmm1	 #, tmp4271
	mulss	2392(%rsp), %xmm1	 # st.lip_rad_z1, _1173
 # pms.c:1054:             st->lip_rad_z1 = samp;
	movss	%xmm0, 2392(%rsp)	 # samp, st.lip_rad_z1
 # pms.c:1055:             samp = y;
	subss	%xmm1, %xmm0	 # _1173, samp
.L976:
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	movss	92(%rsp), %xmm1	 # %sfp, gain_mult
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	cmpl	%r12d, 96(%rsp)	 # ivtmp.767, %sfp
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	mulss	%xmm14, %xmm1	 # gain_mult, gain_mult
 # pms.c:1058:         samp *= gain_mult * st->output_amplitude;
	mulss	%xmm1, %xmm0	 # _1166, samp
 # pms.c:1062:         if (n >= N - ramp_off && ramp_off > 0)
	jg	.L977	 #,
	cmpb	$0, 151(%rsp)	 #, %sfp
	jne	.L1750	 #,
.L977:
 # pms.c:1065:         buf[n] = samp;
	movq	120(%rsp), %rax	 # %sfp, buf
	movss	%xmm0, (%rax,%r12,4)	 # samp, MEM[(float *)buf_615 + ivtmp.767_3039 * 4]
 # pms.c:887:     for (int n = 0; n < N; n++) {
	addq	$1, %r12	 #, ivtmp.767
	cmpl	%r12d, 72(%rsp)	 # ivtmp.767, %sfp
	jle	.L1657	 #,
.L978:
 # pms.c:1015:         sm_v  = sm_v  * sm_coef + v_amp  * (1.0f - sm_coef);
	movaps	%xmm12, %xmm11	 # sm_v, sm_v
	jmp	.L980	 #
.L869:
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	%xmm7, %xmm1	 # tmp3802, f0
	jbe	.L883	 #,
 # pms.c:1022:         if (f0 > 0.0f && sm_v > 1e-5f) {
	comiss	.LC206(%rip), %xmm12	 #, sm_v
	ja	.L872	 #,
.L883:
 # pms.c:1021:         float v_sig = 0.0f;
	pxor	%xmm3, %xmm3	 # v_sig
	jmp	.L873	 #
.L772:
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
 # pms.c:890:         float f0        = st->f0_hz;
	movss	152(%rsp), %xmm1	 # %sfp, f0
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	jne	.L779	 #,
	movl	1256(%rsp), %eax	 # MEM[(int *)&st + 456B], _2279
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%eax, %eax	 # _2279
	je	.L1086	 #,
.L1670:
	movq	1248(%rsp), %rdx	 # MEM[(struct SpecFrame * *)&st + 448B], B
 # pms.c:593:     if (t_ms <= sd->frames[0].time_ms) { lo = hi = 0; }
	movss	(%rdx), %xmm4	 # _2451->time_ms, _2451->time_ms
	comiss	%xmm2, %xmm4	 # t_ms, _2451->time_ms
	jnb	.L783	 #,
 # pms.c:592:     int lo = 0, hi = sd->nframes-1;
	leal	-1(%rax), %ecx	 #, hi
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	movslq	%eax, %r8	 # _2279, _2296
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	subq	$1, %r8	 #, tmp3633
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	movl	%ecx, %eax	 # hi, i
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	imulq	$148, %r8, %r8	 #, tmp3633, tmp3634
 # pms.c:594:     else if (t_ms >= sd->frames[sd->nframes-1].time_ms) { lo = hi = sd->nframes-1; }
	comiss	(%rdx,%r8), %xmm2	 # _2293->time_ms, t_ms
	jnb	.L784	 #,
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	testl	%ecx, %ecx	 # hi
	jle	.L1088	 #,
	movq	%rdx, %r8	 # B, ivtmp.738
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	xorl	%eax, %eax	 # i
.L788:
 # pms.c:597:             if (t_ms >= sd->frames[i].time_ms && t_ms <= sd->frames[i+1].time_ms) {
	comiss	(%r8), %xmm2	 # MEM[(float *)_3056], t_ms
	jb	.L785	 #,
 # pms.c:597:             if (t_ms >= sd->frames[i].time_ms && t_ms <= sd->frames[i+1].time_ms) {
	movss	148(%r8), %xmm0	 # MEM[(float *)_3056 + 148B], MEM[(float *)_3056 + 148B]
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(float *)_3056 + 148B]
	jnb	.L1751	 #,
.L785:
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	addl	$1, %eax	 #, i
 # pms.c:596:         for (int i = 0; i < sd->nframes-1; i++) {
	addq	$148, %r8	 #, ivtmp.738
	cmpl	%ecx, %eax	 # hi, i
	jl	.L788	 #,
.L1088:
 # pms.c:592:     int lo = 0, hi = sd->nframes-1;
	xorl	%eax, %eax	 # i
.L784:
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movslq	%eax, %r9	 # i, _2446
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	movslq	%ecx, %rax	 # hi, _2443
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	imulq	$148, %r9, %r9	 #, _2446, _2445
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	imulq	$148, %rax, %rax	 #, _2443, _2442
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	addq	%rdx, %r9	 # B, A
 # pms.c:604:     const SpecFrame *B = &sd->frames[hi];
	addq	%rax, %rdx	 # _2442, B
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movss	(%r9), %xmm4	 # A_2444->time_ms, t0
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movss	(%rdx), %xmm0	 # B_2441->time_ms, t1
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	jle	.L1021	 #,
	comiss	%xmm0, %xmm4	 # t1, t0
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movl	144(%r9), %r10d	 # A_2444->has_fgain, _676
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movl	144(%rdx), %r8d	 # B_2441->has_fgain, _2437
	jnb	.L1019	 #,
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm2, %xmm3	 # t_ms, _2322
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm4, %xmm0	 # t0, _2321
	testl	%r10d, %r10d	 # _676
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	subss	%xmm4, %xmm3	 # t0, _2322
	je	.L1752	 #,
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm3, %xmm5	 # _2322, alpha
	xorl	%eax, %eax	 # ivtmp.716
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm0, 112(%rsp)	 # _2321, %sfp
	movd	%xmm3, %esi	 # _2322, _2322
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm0, %xmm5	 # _2321, alpha
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm12, %xmm12	 # tmp3720
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	jmp	.L810	 #
.L1754:
	movaps	%xmm6, %xmm13	 # tmp4406, tmp3724
	movaps	%xmm6, %xmm0	 # tmp4406, tmp3725
	cmpltss	%xmm5, %xmm13	 #, alpha, tmp3724
	andps	%xmm13, %xmm0	 # tmp3724, tmp3725
	andnps	%xmm5, %xmm13	 # alpha, tmp3726
	orps	%xmm0, %xmm13	 # tmp3725, _2397
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm13, %xmm4	 # _2397, _2396
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm14	 # _2396, _2419
.L812:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm3, %xmm1	 # pretmp_2429, _2417
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _2437
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movss	104(%r9,%rax,4), %xmm4	 # MEM[(float *)A_2444 + 104B + ivtmp.716_3046 * 4], ga
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm14, 0(%rbp,%rax,4)	 # _2419, MEM[(float *)_1363 + ivtmp.716_3046 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm13, %xmm1	 # _2397, _2416
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm3, %xmm1	 # pretmp_2429, _2415
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm1, (%rdi,%rax,4)	 # _2415, MEM[(float *)_1364 + ivtmp.716_3046 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	jne	.L809	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm1	 # tmp4406, gb
.L811:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm4, %xmm1	 # ga, _2405
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm13, %xmm1	 # _2397, _2404
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm1	 # ga, _2403
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm1, (%rcx,%rax,4)	 # _2403, MEM[(float *)_1365 + ivtmp.716_3046 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.716
	cmpl	%eax, %ebx	 # ivtmp.716, pretmp_2554
	jle	.L1753	 #,
.L810:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm5, %xmm12	 # alpha, tmp3720
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	4(%r9,%rax,4), %xmm14	 # MEM[(float *)A_2444 + 4B + ivtmp.716_3046 * 4], _2433
 # pms.c:161:     { return a + (b - a) * t; }
	movss	4(%rdx,%rax,4), %xmm4	 # MEM[(float *)B_2441 + 4B + ivtmp.716_3046 * 4], MEM[(float *)B_2441 + 4B + ivtmp.716_3046 * 4]
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%r9,%rax,4), %xmm3	 # MEM[(float *)A_2444 + 44B + ivtmp.716_3046 * 4], pretmp_2429
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm14, %xmm4	 # _2433, _2424
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%rdx,%rax,4), %xmm1	 # MEM[(float *)B_2441 + 44B + ivtmp.716_3046 * 4], pretmp_2423
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	jbe	.L1754	 #,
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm12, %xmm4	 # tmp3720, _2422
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm13, %xmm13	 # _2397
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm14	 # _2422, _2419
	jmp	.L812	 #
.L891:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	828(%rsp), %xmm2	 # st.formants[0].freq, st.formants[0].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[0].freq
	jbe	.L945	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	840(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].b0, _162
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _162
	jp	.L1236	 #,
	je	.L1108	 #,
.L1236:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	852(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z1, _537
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _3024
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	844(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a1, _538
	mulss	%xmm3, %xmm1	 # _537, _538
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _538, _2963
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	848(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[0].a2
	mulss	856(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].z2, _2922
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2922, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3447
 # pms.c:102:     return y * f->gain;
	mulss	836(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[0].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _537, _3447
	movlps	%xmm1, 852(%rsp)	 # _3447, MEM <vector(2) float> [(float *)&st + 52B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L945:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	860(%rsp), %xmm2	 # st.formants[1].freq, st.formants[1].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[1].freq
	jbe	.L949	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	872(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].b0, _810
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _810
	jp	.L1238	 #,
	je	.L1109	 #,
.L1238:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	884(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z1, _2547
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _2570
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	876(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a1, _2875
	mulss	%xmm3, %xmm1	 # _2547, _2875
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2875, _2151
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	888(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].z2, MEM <struct SynthState> [(struct Formant *)&st].formants[1].z2
	mulss	880(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].a2, _2148
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2148, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3466
 # pms.c:102:     return y * f->gain;
	mulss	868(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[1].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _2547, _3466
	movlps	%xmm1, 884(%rsp)	 # _3466, MEM <vector(2) float> [(float *)&st + 84B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L949:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$2, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	892(%rsp), %xmm2	 # st.formants[2].freq, st.formants[2].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[2].freq
	jbe	.L952	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	904(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].b0, _1712
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _1712
	jp	.L1240	 #,
	je	.L1110	 #,
.L1240:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	916(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z1, _583
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _928
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	908(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a1, _890
	mulss	%xmm3, %xmm1	 # _583, _890
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _890, _1018
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	912(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[2].a2
	mulss	920(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].z2, _2346
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2346, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3468
 # pms.c:102:     return y * f->gain;
	mulss	900(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[2].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _583, _3468
	movlps	%xmm1, 916(%rsp)	 # _3468, MEM <vector(2) float> [(float *)&st + 116B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L952:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$3, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	924(%rsp), %xmm2	 # st.formants[3].freq, st.formants[3].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[3].freq
	jbe	.L955	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	936(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].b0, _2647
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _2647
	jp	.L1242	 #,
	je	.L1111	 #,
.L1242:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	948(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z1, _2636
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _2637
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	940(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a1, _2635
	mulss	%xmm3, %xmm1	 # _2636, _2635
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2635, _2634
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	952(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].z2, MEM <struct SynthState> [(struct Formant *)&st].formants[3].z2
	mulss	944(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].a2, _2633
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2633, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _3470
 # pms.c:102:     return y * f->gain;
	mulss	932(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[3].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _2636, _3470
	movlps	%xmm1, 948(%rsp)	 # _3470, MEM <vector(2) float> [(float *)&st + 148B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L955:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$4, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	956(%rsp), %xmm2	 # st.formants[4].freq, st.formants[4].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[4].freq
	jbe	.L958	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	968(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].b0, _2911
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _2911
	jp	.L1244	 #,
	je	.L1112	 #,
.L1244:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	980(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z1, _2845
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _2914
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	972(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a1, _2848
	mulss	%xmm3, %xmm1	 # _2845, _2848
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2848, _2850
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	976(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[4].a2
	mulss	984(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].z2, _2947
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _2947, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1401
 # pms.c:102:     return y * f->gain;
	mulss	964(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[4].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _2845, _1401
	movlps	%xmm1, 980(%rsp)	 # _1401, MEM <vector(2) float> [(float *)&st + 180B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L958:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$5, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	988(%rsp), %xmm2	 # st.formants[5].freq, st.formants[5].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[5].freq
	jbe	.L961	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1000(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].b0, _1626
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _1626
	jp	.L1246	 #,
	je	.L1113	 #,
.L1246:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1012(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z1, _1688
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _1625
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1004(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a1, _1762
	mulss	%xmm3, %xmm1	 # _1688, _1762
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _1762, _1761
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1008(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[5].a2
	mulss	1016(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].z2, _1780
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _1780, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1196
 # pms.c:102:     return y * f->gain;
	mulss	996(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[5].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _1688, _1196
	movlps	%xmm1, 1012(%rsp)	 # _1196, MEM <vector(2) float> [(float *)&st + 212B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L961:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$6, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1020(%rsp), %xmm2	 # st.formants[6].freq, st.formants[6].freq
	comiss	%xmm7, %xmm2	 # tmp3802, st.formants[6].freq
	jbe	.L964	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1032(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].b0, _2145
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm7, %xmm2	 # tmp3802, _2145
	jp	.L1248	 #,
	je	.L1114	 #,
.L1248:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1044(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z1, _3083
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _3081
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1036(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a1, _3084
	mulss	%xmm3, %xmm1	 # _3083, _3084
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3084, _3085
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1040(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[6].a2
	mulss	1048(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].z2, _3088
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3088, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1387
 # pms.c:102:     return y * f->gain;
	mulss	1028(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[6].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3083, _1387
	movlps	%xmm1, 1044(%rsp)	 # _1387, MEM <vector(2) float> [(float *)&st + 244B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L964:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$7, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1052(%rsp), %xmm3	 # st.formants[7].freq, st.formants[7].freq
	pxor	%xmm2, %xmm2	 # tmp4238
	comiss	%xmm2, %xmm3	 # tmp4238, st.formants[7].freq
	jbe	.L967	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1064(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].b0, _3101
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm2, %xmm3	 # tmp4238, _3101
	jp	.L1250	 #,
	je	.L1115	 #,
.L1250:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1076(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z1, _3104
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm3, %xmm1	 # _3101, _3102
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1068(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a1, _3105
	mulss	%xmm2, %xmm3	 # _3104, _3105
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm1	 # _3105, _3106
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1072(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[7].a2
	mulss	1080(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].z2, _3109
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm3, %xmm1	 # _3109, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm1, %xmm3	 # y, _673
 # pms.c:102:     return y * f->gain;
	mulss	1060(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[7].gain, samp
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm2, %xmm3	 # _3104, _673
	movlps	%xmm3, 1076(%rsp)	 # _673, MEM <vector(2) float> [(float *)&st + 276B]
.L967:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$8, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1084(%rsp), %xmm2	 # st.formants[8].freq, st.formants[8].freq
	pxor	%xmm3, %xmm3	 # tmp4248
	comiss	%xmm3, %xmm2	 # tmp4248, st.formants[8].freq
	jbe	.L970	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1096(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].b0, _3122
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm3, %xmm2	 # tmp4248, _3122
	jp	.L1252	 #,
	je	.L1116	 #,
.L1252:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1108(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z1, _3125
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _3123
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1100(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a1, _3126
	mulss	%xmm3, %xmm1	 # _3125, _3126
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3126, _3127
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1104(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2, MEM <struct SynthState> [(struct Formant *)&st].formants[8].a2
	mulss	1112(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].z2, _3130
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _3130, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1640
 # pms.c:102:     return y * f->gain;
	mulss	1092(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[8].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _3125, _1640
	movlps	%xmm1, 1108(%rsp)	 # _1640, MEM <vector(2) float> [(float *)&st + 308B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L970:
 # pms.c:1040:             for(int k=0;k<FORMANTS;k++)
	cmpl	$9, %ebx	 #, pretmp_2554
	je	.L944	 #,
 # pms.c:1041:                 if(st->formants[k].freq > 0.0f)
	movss	1116(%rsp), %xmm2	 # st.formants[9].freq, st.formants[9].freq
	pxor	%xmm3, %xmm3	 # tmp4258
	comiss	%xmm3, %xmm2	 # tmp4258, st.formants[9].freq
	jbe	.L944	 #,
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	movss	1128(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].b0, _1425
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	ucomiss	%xmm3, %xmm2	 # tmp4258, _1425
	jp	.L1254	 #,
	je	.L1117	 #,
.L1254:
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1140(%rsp), %xmm3	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z1, _1413
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	mulss	%xmm1, %xmm2	 # samp, _1420
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1132(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a1, _1412
	mulss	%xmm3, %xmm1	 # _1413, _1412
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _1412, _1411
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	movss	1144(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2, MEM <struct SynthState> [(struct Formant *)&st].formants[9].z2
	mulss	1136(%rsp), %xmm1	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].a2, _1407
 # pms.c:99:     float y = f->b0 * x - f->a1 * f->z1 - f->a2 * f->z2;
	subss	%xmm1, %xmm2	 # _1407, y
 # pms.c:101:     f->z1 = y;
	movaps	%xmm2, %xmm1	 # y, _1157
 # pms.c:102:     return y * f->gain;
	mulss	1124(%rsp), %xmm2	 # MEM <struct SynthState> [(struct Formant *)&st].formants[9].gain, y
 # pms.c:101:     f->z1 = y;
	unpcklps	%xmm3, %xmm1	 # _1413, _1157
	movlps	%xmm1, 1140(%rsp)	 # _1157, MEM <vector(2) float> [(float *)&st + 340B]
 # pms.c:102:     return y * f->gain;
	movaps	%xmm2, %xmm1	 # y, samp
.L944:
 # pms.c:1043:             samp += fr_sig * 0.25f;                                    
	mulss	.LC60(%rip), %xmm0	 #, _1670
 # pms.c:1043:             samp += fr_sig * 0.25f;                                    
	addss	%xmm1, %xmm0	 # samp, samp
	jmp	.L943	 #
.L1644:
 # pms.c:1001:         float shimmer = 1.0f;
	movss	%xmm6, 132(%rsp)	 # tmp4406, %sfp
	jmp	.L845	 #
.L1740:
	cmpl	$1, %ebx	 #, pretmp_2554
	je	.L1100	 #,
	movq	.LC205(%rip), %rax	 #, tmp3848
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	pxor	%xmm3, %xmm3	 # tmp3843
	movaps	%xmm3, %xmm2	 # tmp3843, tmp3847
	movl	%ebx, %edx	 # pretmp_2554, bnd.340
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	544(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365], vect__2149.351
	shrl	%edx	 # bnd.340
 # pms.c:76:     f->freq = freq;
	xorl	%r8d, %r8d	 #
	xorl	%r9d, %r9d	 #
	movq	496(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364], tmp5886
	cmpl	$1, %edx	 #, bnd.340
	movq	%r8, 844(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 44B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__2149.351, tmp3844
 # pms.c:76:     f->freq = freq;
	movq	%r9, 876(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 76B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3844, tmp3847
	movq	%rax, %xmm5	 # tmp3848, tmp3848
	andps	%xmm2, %xmm4	 # mask__1159.352_3362, tmp3849
	andnps	%xmm5, %xmm2	 # tmp3848, tmp3850
	orps	%xmm2, %xmm4	 # tmp3850, vect_iftmp.50_2148.353
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	448(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363], vect__2146.345
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 192(%rsp)	 # vect_iftmp.50_2148.353, %sfp
	psrlq	$32, %xmm4	 #, tmp3859
	movaps	%xmm5, %xmm2	 # vect__2146.345, _3366
	movlps	%xmm4, 868(%rsp)	 # tmp3859, MEM <vector(2) float> [(float *)&st + 68B]
	unpcklps	%xmm0, %xmm5	 # tmp5886, _3367
	shufps	$78, %xmm5, %xmm5	 #, _3367, _3367
	unpcklps	%xmm0, %xmm2	 # tmp5886, _3366
	movlps	%xmm2, 828(%rsp)	 # _3366, MEM <vector(2) float> [(float *)&st + 28B]
	movss	192(%rsp), %xmm2	 # %sfp, _3370
	movlps	%xmm5, 860(%rsp)	 # _3367, MEM <vector(2) float> [(float *)&st + 60B]
	movlps	%xmm2, 836(%rsp)	 # _3370, MEM <vector(2) float> [(float *)&st + 36B]
	je	.L853	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	552(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 8B], vect__2149.351
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3843, tmp3867
 # pms.c:76:     f->freq = freq;
	xorl	%ebp, %ebp	 #
	xorl	%ecx, %ecx	 #
	movq	504(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 8B], tmp5890
	cmpl	$2, %edx	 #, bnd.340
	movq	%rbp, 908(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 108B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__2149.351, tmp3864
 # pms.c:76:     f->freq = freq;
	movq	%rcx, 940(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 140B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3864, tmp3867
	movq	%rax, %xmm5	 # tmp3848, tmp3848
	andps	%xmm2, %xmm4	 # mask__1159.352_3391, tmp3869
	andnps	%xmm5, %xmm2	 # tmp3848, tmp3870
	orps	%xmm2, %xmm4	 # tmp3870, vect_iftmp.50_2148.353
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	456(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 8B], vect__2146.345
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 192(%rsp)	 # vect_iftmp.50_2148.353, %sfp
	psrlq	$32, %xmm4	 #, tmp3879
	movaps	%xmm5, %xmm2	 # vect__2146.345, _3395
	movlps	%xmm4, 932(%rsp)	 # tmp3879, MEM <vector(2) float> [(float *)&st + 132B]
	unpcklps	%xmm0, %xmm5	 # tmp5890, _3396
	shufps	$78, %xmm5, %xmm5	 #, _3396, _3396
	unpcklps	%xmm0, %xmm2	 # tmp5890, _3395
	movlps	%xmm2, 892(%rsp)	 # _3395, MEM <vector(2) float> [(float *)&st + 92B]
	movss	192(%rsp), %xmm2	 # %sfp, _3399
	movlps	%xmm5, 924(%rsp)	 # _3396, MEM <vector(2) float> [(float *)&st + 124B]
	movlps	%xmm2, 900(%rsp)	 # _3399, MEM <vector(2) float> [(float *)&st + 100B]
	je	.L853	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	560(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 16B], vect__2149.351
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3843, tmp3887
 # pms.c:76:     f->freq = freq;
	xorl	%esi, %esi	 #
	xorl	%edi, %edi	 #
	movq	512(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 16B], tmp5894
	cmpl	$3, %edx	 #, bnd.340
	movq	%rsi, 972(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 172B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__2149.351, tmp3884
 # pms.c:76:     f->freq = freq;
	movq	%rdi, 1004(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 204B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3884, tmp3887
	movq	%rax, %xmm5	 # tmp3848, tmp3848
	andps	%xmm2, %xmm4	 # mask__1159.352_3420, tmp3889
	andnps	%xmm5, %xmm2	 # tmp3848, tmp3890
	orps	%xmm2, %xmm4	 # tmp3890, vect_iftmp.50_2148.353
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	464(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 16B], vect__2146.345
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 192(%rsp)	 # vect_iftmp.50_2148.353, %sfp
	psrlq	$32, %xmm4	 #, tmp3899
	movaps	%xmm5, %xmm2	 # vect__2146.345, _3424
	movlps	%xmm4, 996(%rsp)	 # tmp3899, MEM <vector(2) float> [(float *)&st + 196B]
	unpcklps	%xmm0, %xmm5	 # tmp5894, _3425
	shufps	$78, %xmm5, %xmm5	 #, _3425, _3425
	unpcklps	%xmm0, %xmm2	 # tmp5894, _3424
	movlps	%xmm2, 956(%rsp)	 # _3424, MEM <vector(2) float> [(float *)&st + 156B]
	movss	192(%rsp), %xmm2	 # %sfp, _3428
	movlps	%xmm5, 988(%rsp)	 # _3425, MEM <vector(2) float> [(float *)&st + 188B]
	movlps	%xmm2, 964(%rsp)	 # _3428, MEM <vector(2) float> [(float *)&st + 164B]
	je	.L853	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	568(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1365 + 24B], vect__2149.351
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm3, %xmm2	 # tmp3843, tmp3907
 # pms.c:76:     f->freq = freq;
	xorl	%r10d, %r10d	 #
	xorl	%r11d, %r11d	 #
	movq	520(%rsp), %xmm0	 # MEM <vector(2) float> [(float *)_1364 + 24B], tmp5898
	cmpl	$4, %edx	 #, bnd.340
	movq	%r10, 1036(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 236B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm4, %xmm5	 # vect__2149.351, tmp3904
 # pms.c:76:     f->freq = freq;
	movq	%r11, 1068(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 268B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm5, %xmm2	 #, tmp3904, tmp3907
	movq	%rax, %xmm5	 # tmp3848, tmp3848
	andps	%xmm2, %xmm4	 # mask__1159.352_3449, tmp3909
	andnps	%xmm5, %xmm2	 # tmp3848, tmp3910
	orps	%xmm2, %xmm4	 # tmp3910, vect_iftmp.50_2148.353
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	472(%rsp), %xmm5	 # MEM <vector(2) float> [(float *)_1363 + 24B], vect__2146.345
 # pms.c:76:     f->freq = freq;
	movss	%xmm4, 192(%rsp)	 # vect_iftmp.50_2148.353, %sfp
	psrlq	$32, %xmm4	 #, tmp3919
	movaps	%xmm5, %xmm2	 # vect__2146.345, _3453
	movlps	%xmm4, 1060(%rsp)	 # tmp3919, MEM <vector(2) float> [(float *)&st + 260B]
	unpcklps	%xmm0, %xmm5	 # tmp5898, _3454
	shufps	$78, %xmm5, %xmm5	 #, _3454, _3454
	unpcklps	%xmm0, %xmm2	 # tmp5898, _3453
	movlps	%xmm2, 1020(%rsp)	 # _3453, MEM <vector(2) float> [(float *)&st + 220B]
	movss	192(%rsp), %xmm2	 # %sfp, _3457
	movlps	%xmm5, 1052(%rsp)	 # _3454, MEM <vector(2) float> [(float *)&st + 252B]
	movlps	%xmm2, 1028(%rsp)	 # _3457, MEM <vector(2) float> [(float *)&st + 228B]
	je	.L853	 #,
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	movq	576(%rsp), %xmm2	 # MEM <vector(2) float> [(float *)_1365 + 32B], vect__2149.351
 # pms.c:76:     f->freq = freq;
	xorl	%r8d, %r8d	 #
	xorl	%r9d, %r9d	 #
	movq	%r8, 1100(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 300B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	%xmm2, %xmm4	 # vect__2149.351, tmp3924
 # pms.c:76:     f->freq = freq;
	movq	%r9, 1132(%rsp)	 #, MEM <vector(2) float> [(float *)&st + 332B]
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	cmpltps	%xmm4, %xmm3	 #, tmp3924, tmp3927
	movq	%rax, %xmm4	 # tmp3848, tmp3848
	andps	%xmm3, %xmm2	 # mask__1159.352_64, tmp3929
	andnps	%xmm4, %xmm3	 # tmp3848, tmp3930
	orps	%xmm2, %xmm3	 # tmp3929, vect_iftmp.50_2148.353
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movq	480(%rsp), %xmm2	 # MEM <vector(2) float> [(float *)_1363 + 32B], vect__2146.345
	movq	528(%rsp), %xmm4	 # MEM <vector(2) float> [(float *)_1364 + 32B], vect__2147.348
 # pms.c:76:     f->freq = freq;
	movss	%xmm3, 192(%rsp)	 # vect_iftmp.50_2148.353, %sfp
	psrlq	$32, %xmm3	 #, tmp3939
	movaps	%xmm2, %xmm5	 # vect__2146.345, _671
	movlps	%xmm3, 1124(%rsp)	 # tmp3939, MEM <vector(2) float> [(float *)&st + 324B]
	unpcklps	%xmm4, %xmm5	 # vect__2147.348, _671
	movlps	%xmm5, 1084(%rsp)	 # _671, MEM <vector(2) float> [(float *)&st + 284B]
	unpcklps	%xmm4, %xmm2	 # vect__2147.348, _504
	movss	192(%rsp), %xmm5	 # %sfp, _110
	shufps	$78, %xmm2, %xmm2	 #, _504, _504
	movlps	%xmm2, 1116(%rsp)	 # _504, MEM <vector(2) float> [(float *)&st + 316B]
	movlps	%xmm5, 1092(%rsp)	 # _110, MEM <vector(2) float> [(float *)&st + 292B]
.L853:
	movl	%ebx, %eax	 # pretmp_2554, k
	andl	$-2, %eax	 #, k
	testb	$1, %bl	 #, pretmp_2554
	je	.L849	 #,
.L852:
 # pms.c:1010:                            fgain[k] > 0.0f ? fgain[k] : 1.0f,
	cltq
	movss	544(%rsp,%rax,4), %xmm2	 # MEM[(float[10] *)_1365][k_715], _2482
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	comiss	%xmm7, %xmm2	 # tmp3802, _2482
	ja	.L855	 #,
 # pms.c:1009:             formant_update(&st->formants[k], freq[k], bw[k],
	movaps	%xmm6, %xmm2	 # tmp4406, _2482
.L855:
 # pms.c:76:     f->freq = freq;
	movq	64(%rsp), %rsi	 # %sfp, ivtmp.699
	movq	%rax, %rdx	 # k, tmp3950
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	xorl	%ecx, %ecx	 #
 # pms.c:76:     f->freq = freq;
	movss	496(%rsp,%rax,4), %xmm4	 # MEM[(float[10] *)_1364][k_715], MEM[(float[10] *)_1364][k_715]
	salq	$5, %rdx	 #, tmp3950
	movss	448(%rsp,%rax,4), %xmm3	 # MEM[(float[10] *)_1363][k_715], _2406
	unpcklps	%xmm4, %xmm3	 # MEM[(float[10] *)_1364][k_715], _2406
	movlps	%xmm3, 28(%rsi,%rdx)	 # _2406, MEM <vector(2) float> [(float *)vectp.553_2366]
 # pms.c:78:     f->gain = gain;
	movss	%xmm2, 836(%rsp,%rdx)	 # _2482, MEM <struct SynthState> [(struct Formant *)&st].formants[k_715].gain
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movl	$0x00000000, 840(%rsp,%rdx)	 #, MEM <struct SynthState> [(struct Formant *)&st].formants[k_715].b0
 # pms.c:81:         f->b0 = 0.0f; f->a1 = 0.0f; f->a2 = 0.0f;
	movq	%rcx, 44(%rsi,%rdx)	 #, MEM <vector(2) float> [(float *)vectp.555_2364]
	jmp	.L849	 #
.L1099:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movaps	%xmm2, %xmm1	 # tmp3833, f0
	jmp	.L847	 #
.L1750:
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	movl	72(%rsp), %edi	 # %sfp, _613
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	pxor	%xmm1, %xmm1	 # _1061
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	pxor	%xmm2, %xmm2	 # _1058
	cvtsi2ssl	184(%rsp), %xmm2	 # %sfp, _1058
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	movl	%edi, %eax	 # _613, _4459
	subl	%r12d, %eax	 # ivtmp.767, _4459
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	cvtsi2ssl	%eax, %xmm1	 # _4459, _1061
 # pms.c:1065:         buf[n] = samp;
	movq	120(%rsp), %rax	 # %sfp, buf
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	divss	%xmm2, %xmm1	 # _1058, _1057
 # pms.c:1063:             samp *= (float)(N - n) / (float)ramp_off;
	mulss	%xmm0, %xmm1	 # samp, samp_1056
 # pms.c:1065:         buf[n] = samp;
	movss	%xmm1, (%rax,%r12,4)	 # samp_1056, MEM[(float *)buf_615 + ivtmp.767_3039 * 4]
 # pms.c:887:     for (int n = 0; n < N; n++) {
	addq	$1, %r12	 #, ivtmp.767
	cmpl	%r12d, %edi	 # ivtmp.767, _613
	jg	.L978	 #,
	movl	296(%rsp), %ebp	 # %sfp, pretmp_2785
	movq	%rax, %rsi	 # buf, buf
.L979:
 # pms.c:1068:     if (st->normalize_output)
	testl	%ebp, %ebp	 # pretmp_2785
	jne	.L1014	 #,
.L983:
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	movss	.LC43(%rip), %xmm2	 #, tmp4622
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	xorl	%eax, %eax	 # ivtmp.663
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L993:
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	movss	(%rsi,%rax,4), %xmm1	 # MEM[(float *)buf_615 + ivtmp.663_4292 * 4], _1051
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC99(%rip), %xmm5	 #, tmp6038
	comiss	%xmm1, %xmm5	 # _1051, tmp6038
	ja	.L990	 #,
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	movaps	%xmm2, %xmm0	 # tmp4622, tmp4290
	movaps	%xmm2, %xmm3	 # tmp4622, tmp4291
	cmpltss	%xmm1, %xmm0	 #, _1051, tmp4290
	andps	%xmm0, %xmm3	 # tmp4290, tmp4291
	andnps	%xmm1, %xmm0	 # _1051, tmp4292
	orps	%xmm3, %xmm0	 # tmp4291, _1053
	movss	%xmm0, (%rsi,%rax,4)	 # _1053, MEM[(float *)buf_615 + ivtmp.663_4292 * 4]
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	addq	$1, %rax	 #, ivtmp.663
	cmpl	%eax, 72(%rsp)	 # ivtmp.663, %sfp
	jg	.L993	 #,
.L992:
 # pms.c:1073:     free(phon_t0);
	movq	%r13, %rcx	 # phon_t0,
	call	free	 #
 # pms.c:1074:     free(phon_sf);
	movq	272(%rsp), %rcx	 # %sfp,
	call	free	 #
 # pms.c:1075:     free(phon_sb);
	movq	280(%rsp), %rcx	 # %sfp,
	call	free	 #
 # pms.c:1441:     if (st.verbose)
	cmpl	$0, 2380(%rsp)	 #, st.verbose
	jne	.L1755	 #,
 # pms.c:1445:     switch(st.output_format){
	movl	2368(%rsp), %eax	 # st.output_format, _1671
 # pms.c:1445:     switch(st.output_format){
	cmpl	$2, %eax	 #, _1671
	je	.L996	 #,
	ja	.L1013	 #,
.L1675:
	testl	%eax, %eax	 # _1671
	je	.L1756	 #,
 # pms.c:448:     FILE *fp = fopen(path,"wb");
	leaq	.LC216(%rip), %rdx	 #,
 # pms.c:1447:         case FMT_WAV32: ret=wav32_write(st.output_filename,samples,nsamples,st.sample_rate); break;
	movl	812(%rsp), %ebp	 # st.sample_rate, _39
 # pms.c:448:     FILE *fp = fopen(path,"wb");
	leaq	1312(%rsp), %rcx	 #,
	call	fopen	 #
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	testq	%rax, %rax	 # fp
 # pms.c:448:     FILE *fp = fopen(path,"wb");
	movq	%rax, %rbx	 #, fp
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	je	.L1677	 #,
 # pms.c:450:     uint32_t dsz = (uint32_t)n * 4;
	movl	72(%rsp), %r15d	 # %sfp, _613
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rax, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1179011410, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
 # pms.c:452:     w32(fp, 36 + 4 + 12 + dsz);                     
	movq	%rbx, %rcx	 # fp,
 # pms.c:450:     uint32_t dsz = (uint32_t)n * 4;
	leal	0(,%r15,4), %r12d	 #, dsz
 # pms.c:452:     w32(fp, 36 + 4 + 12 + dsz);                     
	leal	52(%r12), %edx	 #, _1347
	call	w32	 #
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1163280727, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$544501094, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$18, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
 # pms.c:417:     fwrite(b,1,2,f);
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$3, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$1, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
 # pms.c:456:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*4);
	movl	%ebp, %edx	 # _39,
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
 # pms.c:456:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*4);
	leal	0(,%rbp,4), %edx	 #, _1349
 # pms.c:456:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*4);
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
 # pms.c:417:     fwrite(b,1,2,f);
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$4, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$32, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$0, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1952670054, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$4, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
 # pms.c:458:     w32(fp,0x74636166u); w32(fp,4); w32(fp,(uint32_t)n);           
	movl	%r15d, %edx	 # _613,
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
 # pms.c:422:     fwrite(b,1,4,f);
	leaq	544(%rsp), %rcx	 #,
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1635017060, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	movl	$1, %edx	 #,
	call	fwrite	 #
 # pms.c:459:     w32(fp,0x61746164u); w32(fp,dsz);
	movl	%r12d, %edx	 # dsz,
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
	jmp	.L1655	 #
	.p2align 4,,10
	.p2align 3
.L990:
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	movl	$0xbf800000, (%rsi,%rax,4)	 #, MEM[(float *)buf_615 + ivtmp.663_4292 * 4]
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	addq	$1, %rax	 #, ivtmp.663
	cmpl	%eax, 72(%rsp)	 # ivtmp.663, %sfp
	jg	.L993	 #,
	jmp	.L992	 #
.L889:
 # pms.c:115:     float y = b->b0 * x + b->z1;
	movss	248(%rsp), %xmm0	 # %sfp, _1970
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movss	252(%rsp), %xmm5	 # %sfp, _1963
 # pms.c:115:     float y = b->b0 * x + b->z1;
	mulss	%xmm2, %xmm0	 # _2023, _1970
 # pms.c:115:     float y = b->b0 * x + b->z1;
	addss	224(%rsp), %xmm0	 # %sfp, y
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm7, %xmm2	 # tmp3802, _1968
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	mulss	%xmm0, %xmm5	 # y, _1963
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	movaps	%xmm2, %xmm4	 # _1968, _1819
	subss	%xmm5, %xmm4	 # _1963, _1819
 # pms.c:116:     b->z1   = b->b1 * x - b->a1 * y + b->z2;
	addss	204(%rsp), %xmm4	 # %sfp, _1819
	movss	%xmm4, 224(%rsp)	 # _1819, %sfp
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	movss	264(%rsp), %xmm4	 # %sfp, _1817
	mulss	%xmm0, %xmm4	 # y, _1817
 # pms.c:117:     b->z2   = b->b2 * x - b->a2 * y;
	subss	%xmm4, %xmm2	 # _1817, _1968
	movss	%xmm2, 204(%rsp)	 # _1968, %sfp
	jmp	.L890	 #
.L1739:
 # pms.c:914:             int np = st->phon.nphon;
	movslq	1280(%rsp), %rax	 # st.phon.nphon,
 # pms.c:916:             if (t_ms < phon_t0[np]) {
	movss	0(%r13,%rax,4), %xmm0	 # *_1737, *_1737
 # pms.c:914:             int np = st->phon.nphon;
	movq	%rax, %rcx	 #,
 # pms.c:916:             if (t_ms < phon_t0[np]) {
	comiss	%xmm2, %xmm0	 # t_ms, *_1737
	jbe	.L814	 #,
 # pms.c:918:                 while (lo<=hi) {
	subl	$1, %ecx	 #, hi
	js	.L814	 #,
 # pms.c:917:                 int lo=0, hi=np-1;
	xorl	%r8d, %r8d	 # lo
	jmp	.L821	 #
	.p2align 6
.L1757:
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	leal	-1(%rax), %ecx	 #, hi
.L818:
 # pms.c:918:                 while (lo<=hi) {
	cmpl	%r8d, %ecx	 # lo, hi
	jl	.L814	 #,
.L821:
 # pms.c:919:                     int mid=(lo+hi)/2;
	leal	(%r8,%rcx), %edx	 #, _1265
 # pms.c:919:                     int mid=(lo+hi)/2;
	movl	%edx, %eax	 # _1265, tmp3742
	shrl	$31, %eax	 #, tmp3742
	addl	%edx, %eax	 # _1265, tmp3743
	sarl	%eax	 # mid_1266
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	movslq	%eax, %rdi	 # mid_1266, _1267
 # pms.c:920:                     if (t_ms < phon_t0[mid])         hi=mid-1;
	movss	0(%r13,%rdi,4), %xmm0	 # *_1269, *_1269
	comiss	%xmm2, %xmm0	 # t_ms, *_1269
	ja	.L1757	 #,
 # pms.c:921:                     else if (t_ms >= phon_t0[mid+1]) lo=mid+1;
	comiss	4(%r13,%rdi,4), %xmm2	 # *_2464, t_ms
	jb	.L1641	 #,
 # pms.c:921:                     else if (t_ms >= phon_t0[mid+1]) lo=mid+1;
	leal	1(%rax), %r8d	 #, lo
	jmp	.L818	 #
.L1651:
 # pms.c:1045:             samp = 0.0f;
	pxor	%xmm2, %xmm2	 # samp
	jmp	.L893	 #
.L1657:
	movl	296(%rsp), %ebp	 # %sfp, pretmp_2785
	movq	120(%rsp), %rsi	 # %sfp, buf
	jmp	.L979	 #
.L1738:
 # pms.c:905:         if (st->mode == MODE_SPEC) {
	cmpl	$1, 76(%rsp)	 #, %sfp
	je	.L1758	 #,
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	4(%r15), %xmm1	 # MEM[(const struct ContourPt *)pretmp_2544].f0_hz, f0
	jmp	.L779	 #
.L814:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L838	 #,
	cmpl	$2, 268(%rsp)	 #, %sfp
	jbe	.L1096	 #,
	movl	%ebx, %eax	 # pretmp_2554, bnd.355_1248
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC96(%rip), %xmm2	 #, tmp3789
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC61(%rip), %xmm1	 #, tmp3790
	shrl	$2, %eax	 #, bnd.355_1248
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	.LC43(%rip), %xmm0	 #, tmp3791
	subl	$1, %eax	 #, bnd.355_1248
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm2, %xmm2	 # tmp3789
	movaps	%xmm2, 448(%rsp)	 # tmp3789, MEM <vector(4) float> [(float *)_1363]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm1, %xmm1	 # tmp3790
	movaps	%xmm1, 496(%rsp)	 # tmp3790, MEM <vector(4) float> [(float *)_1364]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	shufps	$0, %xmm0, %xmm0	 # tmp3791
	movaps	%xmm0, 544(%rsp)	 # tmp3791, MEM <vector(4) float> [(float *)_1365]
	jne	.L1759	 #,
.L835:
	movl	%ebx, %eax	 # pretmp_2554, k
	andl	$-4, %eax	 #, k
	testb	$3, %bl	 #, pretmp_2554
	je	.L838	 #,
.L834:
	movss	.LC96(%rip), %xmm1	 #, tmp4415
	cltq
	movss	.LC61(%rip), %xmm0	 #, tmp4412
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
.L837:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm1, 0(%rbp,%rax,4)	 # tmp4415, MEM[(float *)_1363 + ivtmp.757_3043 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm0, (%rdi,%rax,4)	 # tmp4412, MEM[(float *)_1364 + ivtmp.757_3043 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movss	%xmm6, (%rcx,%rax,4)	 # tmp4406, MEM[(float *)_1365 + ivtmp.757_3043 * 4]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	addq	$1, %rax	 #, ivtmp.757
	cmpl	%eax, %ebx	 # ivtmp.757, pretmp_2554
	jg	.L837	 #,
.L838:
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	pxor	%xmm13, %xmm13	 # a_amp
 # pms.c:894:         float gain_mult = 1.0f;
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movaps	%xmm13, %xmm12	 #, v_amp
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
 # pms.c:987:                 v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f; f0 = 0.0f;
	movaps	%xmm13, %xmm1	 # tmp48, f0
	jmp	.L782	 #
.L1742:
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	movss	.LC207(%rip), %xmm2	 #, tmp4020
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	pxor	%xmm3, %xmm3	 # v
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	comiss	%xmm1, %xmm2	 # prephitmp_2121, tmp4020
	jbe	.L877	 #,
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	divss	%xmm2, %xmm1	 # tmp4020, _2096
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	movaps	%xmm6, %xmm3	 # tmp4406, v
	subss	%xmm1, %xmm3	 # _2096, v
	jmp	.L877	 #
.L1720:
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	movss	.LC207(%rip), %xmm2	 #, tmp3333
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	pxor	%xmm3, %xmm3	 # v
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	comiss	%xmm1, %xmm2	 # _887, tmp3333
	jbe	.L657	 #,
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	divss	%xmm2, %xmm1	 # tmp3333, _1274
 # pms.c:787:         v = (phase < 0.04f) ? (1.0f - phase / 0.04f) : 0.0f;
	movaps	%xmm6, %xmm3	 # tmp4406, v
	subss	%xmm1, %xmm3	 # _1274, v
	jmp	.L657	 #
.L1715:
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, st.formants[0].bw
	movss	%xmm0, 496(%rsp)	 # st.formants[0].bw, MEM[(float[10] *)_1364][0]
	jmp	.L543	 #
.L1736:
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, st.formants[0].bw
	movss	%xmm0, 496(%rsp)	 # st.formants[0].bw, MEM[(float[10] *)_1364][0]
	jmp	.L762	 #
.L1632:
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	movaps	%xmm6, %xmm3	 # tmp4406, v
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	subss	%xmm2, %xmm1	 # tmp3337, _1277
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	divss	.LC209(%rip), %xmm1	 #, _1278
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	subss	%xmm1, %xmm3	 # _1278, v
	jmp	.L661	 #
.L1648:
	movaps	%xmm6, %xmm3	 # tmp4406, v
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	subss	%xmm2, %xmm1	 # tmp4024, _2100
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	divss	.LC209(%rip), %xmm1	 #, _2099
 # pms.c:792:             v = 1.0f - (phase - 0.7f) / 0.3f;
	subss	%xmm1, %xmm3	 # _2099, v
	jmp	.L881	 #
.L1743:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm2, %xmm2	 # _3144
	jmp	.L897	 #
.L1108:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L945	 #
.L1721:
	pxor	%xmm2, %xmm2	 # _3767
	jmp	.L709	 #
.L1069:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L673	 #
.L1716:
 # pms.c:898:             bw   [k] = st->formants[k].bw;
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, st.formants[0].bw
	movss	%xmm0, 496(%rsp)	 # st.formants[0].bw, MEM[(float[10] *)_1364][0]
	movss	864(%rsp), %xmm0	 # st.formants[1].bw, st.formants[1].bw
	movss	%xmm0, 500(%rsp)	 # st.formants[1].bw, MEM[(float[10] *)_1364][1]
	jmp	.L543	 #
.L1737:
	movss	832(%rsp), %xmm0	 # st.formants[0].bw, st.formants[0].bw
	movss	%xmm0, 496(%rsp)	 # st.formants[0].bw, MEM[(float[10] *)_1364][0]
	movss	864(%rsp), %xmm0	 # st.formants[1].bw, st.formants[1].bw
	movss	%xmm0, 500(%rsp)	 # st.formants[1].bw, MEM[(float[10] *)_1364][1]
	jmp	.L762	 #
.L519:
 # pms.c:849:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	movl	1280(%rsp), %ebx	 # st.phon.nphon, _626
 # pms.c:849:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	testl	%ebx, %ebx	 # _626
	jle	.L1044	 #,
 # pms.c:851:         phon_t0 = (float*)malloc((np+1)*sizeof(float));
	leal	1(%rbx), %ecx	 #, _627
 # pms.c:852:         phon_sf = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sf));
	movslq	%ebx, %rbp	 # _626, _631
 # pms.c:852:         phon_sf = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sf));
	imulq	$40, %rbp, %rbp	 #, _631, _632
 # pms.c:851:         phon_t0 = (float*)malloc((np+1)*sizeof(float));
	movslq	%ecx, %rcx	 # _627, _628
 # pms.c:851:         phon_t0 = (float*)malloc((np+1)*sizeof(float));
	salq	$2, %rcx	 #, _629
 # pms.c:851:         phon_t0 = (float*)malloc((np+1)*sizeof(float));
	call	malloc	 #
	movq	%rax, %r13	 # phon_t0, phon_t0
 # pms.c:852:         phon_sf = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sf));
	movq	%rbp, %rcx	 # _632,
	call	malloc	 #
 # pms.c:853:         phon_sb = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sb));
	movq	%rbp, %rcx	 # _632,
 # pms.c:852:         phon_sf = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sf));
	movq	%rax, 272(%rsp)	 # phon_sf, %sfp
 # pms.c:853:         phon_sb = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sb));
	call	malloc	 #
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	movq	1272(%rsp), %rdx	 # st.phon.phonemes, _640
 # pms.c:855:         phon_t0[0] = 0.0f;
	movl	$0x00000000, 0(%r13)	 #, *phon_t0_630
 # pms.c:853:         phon_sb = (float(*)[MAX_FORMANTS])malloc(np*sizeof(*phon_sb));
	movq	%rax, 280(%rsp)	 # phon_sb, %sfp
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	xorl	%eax, %eax	 # ivtmp.880
.L525:
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	imulq	$8100, %rax, %rcx	 #, ivtmp.880, _1828
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	movss	16(%rdx,%rcx), %xmm0	 # MEM[(float *)_640 + 16B + _1828 * 1], MEM[(float *)_640 + 16B + _1828 * 1]
	addss	0(%r13,%rax,4), %xmm0	 # MEM[(float *)phon_t0_630 + ivtmp.880_1833 * 4], _647
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	movss	%xmm0, 4(%r13,%rax,4)	 # _647, MEM[(float *)phon_t0_630 + 4B + ivtmp.880_1833 * 4]
 # pms.c:856:         for (int i=0;i<np;i++) phon_t0[i+1]=phon_t0[i]+st->phon.phonemes[i].duration_ms;
	addq	$1, %rax	 #, ivtmp.880
	cmpl	%eax, %ebx	 # ivtmp.880, _626
	jg	.L525	 #,
	movq	64(%rsp), %rdx	 # %sfp, ivtmp.875
	xorl	%eax, %eax	 # ivtmp.870
 # pms.c:859:             phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
	pxor	%xmm1, %xmm1	 # tmp4643
	movq	272(%rsp), %rcx	 # %sfp, phon_sf
	movq	280(%rsp), %r8	 # %sfp, phon_sb
	jmp	.L526	 #
.L529:
 # pms.c:859:             phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
	movss	28(%rdx), %xmm0	 # MEM[(float *)_1835 + 28B], _650
 # pms.c:859:             phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
	comiss	%xmm1, %xmm0	 # tmp4643, _650
	ja	.L527	 #,
 # pms.c:859:             phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
	movss	.LC96(%rip), %xmm0	 #, _650
.L527:
 # pms.c:859:             phon_sf[0][k] = st->formants[k].freq > 0 ? st->formants[k].freq : 700.0f;
	movss	%xmm0, (%rcx,%rax,4)	 # _650, MEM[(float *)phon_sf_633 + ivtmp.870_1845 * 4]
 # pms.c:860:             phon_sb[0][k] = st->formants[k].bw   > 0 ? st->formants[k].bw  : 110.0f;
	movss	32(%rdx), %xmm0	 # MEM[(float *)_1835 + 32B], _652
 # pms.c:860:             phon_sb[0][k] = st->formants[k].bw   > 0 ? st->formants[k].bw  : 110.0f;
	comiss	%xmm1, %xmm0	 # tmp4643, _652
	ja	.L528	 #,
 # pms.c:860:             phon_sb[0][k] = st->formants[k].bw   > 0 ? st->formants[k].bw  : 110.0f;
	movss	.LC61(%rip), %xmm0	 #, _652
.L528:
 # pms.c:860:             phon_sb[0][k] = st->formants[k].bw   > 0 ? st->formants[k].bw  : 110.0f;
	movss	%xmm0, (%r8,%rax,4)	 # _652, MEM[(float *)phon_sb_634 + ivtmp.870_1845 * 4]
	addq	$32, %rdx	 #, ivtmp.875
	addq	$1, %rax	 #, ivtmp.870
.L526:
 # pms.c:858:         for (int k=0;k<FORMANTS;k++){
	cmpl	%eax, %edi	 # ivtmp.870, FORMANTS.36_775
	jg	.L529	 #,
	movq	272(%rsp), %rax	 # %sfp, phon_sf
	leal	-1(%rbx), %r12d	 #, _1847
	movq	%r13, 48(%rsp)	 # phon_t0, %sfp
	xorl	%ebx, %ebx	 # ivtmp.866
	imulq	$8100, %r12, %r12	 #, _1847, _1846
	movq	%rsi, 56(%rsp)	 # buf, %sfp
	leaq	40(%rax), %rbp	 #, ivtmp.862
	movq	280(%rsp), %rax	 # %sfp, phon_sb
	leaq	40(%rax), %rdi	 #, ivtmp.864
	jmp	.L530	 #
.L1761:
 # pms.c:866:             for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %r14d	 # FORMANTS,
	testl	%r14d, %r14d	 # FORMANTS.41_911
	jle	.L1661	 #,
 # pms.c:865:                                strcmp(prev_name,"_")==0);
	leaq	.LC187(%rip), %rdx	 #,
	movq	%rsi, %rcx	 # prev_name,
	call	strcmp	 #
 # pms.c:871:                     phon_sf[i][k] = st->phon.phonemes[i-1].target_freq[k];
	movq	1272(%rsp), %r9	 # st.phon.phonemes, _674
	testl	%eax, %eax	 # _663
 # pms.c:871:                     phon_sf[i][k] = st->phon.phonemes[i-1].target_freq[k];
	leaq	(%r9,%rbx), %rsi	 #, _675
	je	.L533	 #,
 # pms.c:871:                     phon_sf[i][k] = st->phon.phonemes[i-1].target_freq[k];
	leaq	280(%rsi), %rdx	 #, _287
	movq	%rbp, %rcx	 # ivtmp.862,
	leaq	0(,%r14,4), %r8	 #,
	call	memcpy	 #
 # pms.c:869:                     phon_sb[i][k] = st->phon.phonemes[i].target_bw  [k];
	leaq	320(%rsi), %rdx	 #, _233
	movq	%rdi, %rcx	 # ivtmp.864,
	leaq	0(,%r14,4), %r8	 #,
	call	memcpy	 #
	leaq	8100(%rbx), %rsi	 #, ivtmp.866
.L534:
	addq	$40, %rbp	 #, ivtmp.862
	addq	$40, %rdi	 #, ivtmp.864
	movq	%rsi, %rbx	 # ivtmp.866, ivtmp.866
.L530:
 # pms.c:862:         for (int i=1;i<np;i++){
	cmpq	%rbx, %r12	 # ivtmp.866, _1846
	je	.L1760	 #,
 # pms.c:863:             const char *prev_name = st->phon.phonemes[i-1].name;
	movq	1272(%rsp), %rsi	 # st.phon.phonemes, prev_name
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC186(%rip), %rdx	 #,
 # pms.c:863:             const char *prev_name = st->phon.phonemes[i-1].name;
	addq	%rbx, %rsi	 # ivtmp.866, prev_name
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	movq	%rsi, %rcx	 # prev_name,
	call	*__imp__stricmp(%rip)	 #
 # pms.c:864:             int prev_is_sil = (strcasecmp(prev_name,"sil")==0 ||
	testl	%eax, %eax	 # _662
	jne	.L1761	 #,
 # pms.c:866:             for(int k=0;k<FORMANTS;k++){
	movl	FORMANTS(%rip), %r14d	 # FORMANTS, FORMANTS.41_911
	testl	%r14d, %r14d	 # FORMANTS.41_911
	jle	.L1661	 #,
 # pms.c:868:                     phon_sf[i][k] = st->phon.phonemes[i].target_freq[k];
	movq	1272(%rsp), %r13	 # st.phon.phonemes, _2209
	leaq	8100(%rbx), %rsi	 #, ivtmp.866
	addq	%rsi, %r13	 # ivtmp.866, _2209
.L1016:
 # pms.c:868:                     phon_sf[i][k] = st->phon.phonemes[i].target_freq[k];
	leaq	280(%r13), %rdx	 #, _2791
	movl	%r14d, %ebx	 # FORMANTS.41_911, _2793
	movq	%rbp, %rcx	 # ivtmp.862,
	leaq	0(,%rbx,4), %r8	 #,
	call	memcpy	 #
 # pms.c:869:                     phon_sb[i][k] = st->phon.phonemes[i].target_bw  [k];
	leaq	320(%r13), %rdx	 #, _2786
	movq	%rdi, %rcx	 # ivtmp.864,
	leaq	0(,%rbx,4), %r8	 #,
	call	memcpy	 #
	jmp	.L534	 #
.L1711:
 # pms.c:812:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	movl	1280(%rsp), %r8d	 # st.phon.nphon, _587
 # pms.c:812:     if (st->mode == MODE_PHONEME && st->phon.nphon > 0) {
	testl	%r8d, %r8d	 # _587
	jle	.L507	 #,
 # pms.c:814:         for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
	movq	1272(%rsp), %r9	 # st.phon.phonemes, _588
	xorl	%eax, %eax	 # ivtmp.889
 # pms.c:813:         float total = 0.0f;
	pxor	%xmm1, %xmm1	 # total
.L508:
 # pms.c:814:         for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
	imulq	$8100, %rax, %rdx	 #, ivtmp.889, _1949
 # pms.c:814:         for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
	addq	$1, %rax	 #, ivtmp.889
	cmpl	%eax, %r8d	 # ivtmp.889, _587
 # pms.c:814:         for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
	addss	16(%r9,%rdx), %xmm1	 # MEM[(float *)_588 + 16B + _1949 * 1], total
 # pms.c:814:         for (int i=0;i<st->phon.nphon;i++) total+=st->phon.phonemes[i].duration_ms;
	jg	.L508	 #,
 # pms.c:815:         float needed = total/1000.0f + 0.05f;
	movss	.LC51(%rip), %xmm6	 #, tmp4409
	divss	%xmm6, %xmm1	 # tmp4409, _597
 # pms.c:815:         float needed = total/1000.0f + 0.05f;
	addss	.LC182(%rip), %xmm1	 #, needed
	movaps	%xmm1, %xmm2	 # needed, needed
	maxss	%xmm0, %xmm2	 # dur, needed
	movaps	%xmm2, %xmm0	 # _600, dur
	jmp	.L507	 #
.L1713:
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	cmpl	$0, 1280(%rsp)	 #, st.phon.nphon
	jle	.L536	 #,
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movq	1272(%rsp), %rax	 # st.phon.phonemes, _693
 # pms.c:882:     float sm_v    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].voicing_amp    : st->voicing_amp;
	movss	8084(%rax), %xmm11	 # _693->voicing_amp, sm_v
 # pms.c:883:     float sm_a    = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].aspiration_amp : st->aspiration_amp;
	movss	8088(%rax), %xmm9	 # _693->aspiration_amp, sm_a
 # pms.c:884:     float sm_fr   = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].frication_amp  : st->frication_amp;
	movss	8092(%rax), %xmm10	 # _693->frication_amp, sm_fr
 # pms.c:884:     float sm_fr   = (st->mode == MODE_PHONEME && st->phon.nphon > 0) ? st->phon.phonemes[0].frication_amp  : st->frication_amp;
	jmp	.L537	 #
.L1710:
 # pms.c:1346:     printf("Poor Man's Synthesizer v%s version format %s\n", VERSION_STR, VERSION_FMT);
	leaq	.LC114(%rip), %r8	 #,
	leaq	.LC115(%rip), %rdx	 #,
	leaq	.LC167(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	movl	800(%rsp), %eax	 # st.mode, _549
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	testl	%eax, %eax	 # _549
	jne	.L1762	 #,
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	leaq	.LC86(%rip), %rdx	 #, iftmp.29_550
.L500:
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	leaq	.LC168(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1348:     printf("Filters   : %s\n", st->filter_mode==FILTER_CASCADE?"cascade":"parallel");
	cmpl	$0, 804(%rsp)	 #, st.filter_mode
	jne	.L1040	 #,
 # pms.c:1348:     printf("Filters   : %s\n", st->filter_mode==FILTER_CASCADE?"cascade":"parallel");
	leaq	.LC89(%rip), %rdx	 #, iftmp.30_552
.L501:
 # pms.c:1348:     printf("Filters   : %s\n", st->filter_mode==FILTER_CASCADE?"cascade":"parallel");
	leaq	.LC169(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	movl	808(%rsp), %eax	 # st.voice_type, _553
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	testl	%eax, %eax	 # _553
	je	.L1041	 #,
	leaq	.LC92(%rip), %rdx	 #, iftmp.31_554
 # pms.c:1350:                                st->voice_type==VOICE_WHISPER?"whisper":"impulsive");
	subl	$1, %eax	 #, _553
	jne	.L502	 #,
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	leaq	.LC91(%rip), %rdx	 #, iftmp.31_554
.L502:
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	leaq	.LC170(%rip), %rcx	 #,
 # pms.c:1354:     printf("Voicing   : %.2f   Asp: %.2f   Fric: %.2f\n",
	pxor	%xmm6, %xmm6	 # _561
 # pms.c:1361:     for(int k=0;k<FORMANTS;k++)
	xorl	%ebx, %ebx	 # ivtmp.896
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	call	printf	 #
 # pms.c:1351:     printf("Sample-rt : %d Hz\n", st->sample_rate);
	movl	812(%rsp), %edx	 # st.sample_rate,
	leaq	.LC171(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1352:     printf("Duration  : %.2f s\n", st->duration_sec);
	leaq	.LC172(%rip), %rcx	 #,
	pxor	%xmm1, %xmm1	 # _557
	cvtss2sd	816(%rsp), %xmm1	 # st.duration_sec, _557
	movq	%xmm1, %rdx	 # _557,
	call	printf	 #
 # pms.c:1353:     printf("F0        : %.1f Hz\n", st->f0_hz);
	leaq	.LC173(%rip), %rcx	 #,
	pxor	%xmm1, %xmm1	 # _559
	cvtss2sd	820(%rsp), %xmm1	 # st.f0_hz, _559
	movq	%xmm1, %rdx	 # _559,
	call	printf	 #
 # pms.c:1354:     printf("Voicing   : %.2f   Asp: %.2f   Fric: %.2f\n",
	leaq	.LC174(%rip), %rcx	 #,
	pxor	%xmm1, %xmm1	 # _565
	cvtss2sd	1196(%rsp), %xmm6	 # st.frication_amp, _561
	cvtss2sd	1188(%rsp), %xmm1	 # st.voicing_amp, _565
	movq	%xmm6, %r9	 # _561, _561
	movq	%xmm1, %rdx	 # _565,
	pxor	%xmm6, %xmm6	 # _563
	cvtss2sd	1192(%rsp), %xmm6	 # st.aspiration_amp, _563
	movq	%r9, %xmm3	 # _561,
	movq	%xmm6, %r8	 # _563, _563
	movapd	%xmm6, %xmm2	 # _563,
	call	printf	 #
 # pms.c:1356:     printf("Vibrato   : %.1f Hz depth @ %.1f Hz rate\n",
	pxor	%xmm6, %xmm6	 # _567
	leaq	.LC175(%rip), %rcx	 #,
	cvtss2sd	1204(%rsp), %xmm6	 # st.vibrato_rate_hz, _567
	pxor	%xmm1, %xmm1	 # _569
	movq	%xmm6, %r8	 # _567, _567
	movapd	%xmm6, %xmm2	 # _567,
	cvtss2sd	1200(%rsp), %xmm1	 # st.vibrato_depth_hz, _569
	movq	%xmm1, %rdx	 # _569,
 # pms.c:1358:     printf("Jitter    : %.1f%%  Shimmer: %.1f%%\n",
	pxor	%xmm6, %xmm6	 # _571
 # pms.c:1356:     printf("Vibrato   : %.1f Hz depth @ %.1f Hz rate\n",
	call	printf	 #
 # pms.c:1358:     printf("Jitter    : %.1f%%  Shimmer: %.1f%%\n",
	leaq	.LC176(%rip), %rcx	 #,
	pxor	%xmm1, %xmm1	 # _573
	cvtss2sd	1212(%rsp), %xmm6	 # st.shimmer_percent, _571
	cvtss2sd	1208(%rsp), %xmm1	 # st.jitter_percent, _573
	movq	%xmm6, %r8	 # _571, _571
	movapd	%xmm6, %xmm2	 # _571,
	movq	%xmm1, %rdx	 # _573,
	call	printf	 #
 # pms.c:1360:     printf("Formants  :\n");
	leaq	.LC177(%rip), %rcx	 #,
	call	puts	 #
	movq	64(%rsp), %rdi	 # %sfp, ivtmp.699
	movq	%rdi, %rsi	 # ivtmp.699, ivtmp.908
 # pms.c:1361:     for(int k=0;k<FORMANTS;k++)
	jmp	.L503	 #
.L504:
 # pms.c:1361:     for(int k=0;k<FORMANTS;k++)
	addq	$32, %rsi	 #, ivtmp.908
 # pms.c:1362:         printf("  F%2d : %6.0f Hz  BW %4.0f Hz  Gain %.2f\n",
	pxor	%xmm6, %xmm6	 # _578
	pxor	%xmm0, %xmm0	 # tmp2768
	movl	%ebx, %edx	 # ivtmp.896, ivtmp.896
	cvtss2sd	(%rsi), %xmm6	 # MEM[(float *)_1930], _578
	movq	%xmm6, %r9	 # _578, _578
	cvtss2sd	344(%rdi,%rbx,4), %xmm0	 # MEM[(float *)&st + 344B + ivtmp.896_1943 * 4], tmp2768
	pxor	%xmm6, %xmm6	 # _580
	movq	%r9, %xmm3	 # _578,
	cvtss2sd	-4(%rsi), %xmm6	 # MEM[(float *)_1930 + -4B], _580
	movsd	%xmm0, 32(%rsp)	 # tmp2768,
	movq	%xmm6, %r8	 # _580, _580
	leaq	.LC178(%rip), %rcx	 #,
	movapd	%xmm6, %xmm2	 # _580,
	call	printf	 #
.L503:
 # pms.c:1361:     for(int k=0;k<FORMANTS;k++)
	addq	$1, %rbx	 #, ivtmp.896
	leal	-1(%rbx), %eax	 #, _1935
	cmpl	%eax, FORMANTS(%rip)	 # _1935, FORMANTS
	jg	.L504	 #,
 # pms.c:1364:     printf("Output    : %s\n", st->output_filename);
	leaq	1312(%rsp), %rdx	 #, tmp2772
	leaq	.LC179(%rip), %rcx	 #,
	call	printf	 #
 # pms.c:1365:     printf("===================================\n");
	leaq	.LC180(%rip), %rcx	 #,
	call	puts	 #
 # pms.c:1433:     if (st.verbose) printf("Synthesising...\n");
	cmpl	$0, 2380(%rsp)	 #, st.verbose
	je	.L499	 #,
 # pms.c:1433:     if (st.verbose) printf("Synthesising...\n");
	leaq	.LC181(%rip), %rcx	 #,
	call	puts	 #
	jmp	.L499	 #
.L1714:
 # pms.c:1068:     if (st->normalize_output)
	testl	%ebp, %ebp	 # pretmp_2785
	je	.L992	 #,
.L1014:
	movl	72(%rsp), %edx	 # %sfp, _613
 # pms.c:1055:             samp = y;
	xorl	%eax, %eax	 # ivtmp.678
 # pms.c:802:     float peak = 0.0f;
	pxor	%xmm1, %xmm1	 # peak
	jmp	.L984	 #
	.p2align 5
.L985:
 # pms.c:803:     for (int i=0;i<n;i++){ float a=fabsf(buf[i]); if(a>peak) peak=a; }
	movss	(%rsi,%rax,4), %xmm0	 # MEM[(float *)buf_615 + ivtmp.678_4268 * 4], MEM[(float *)buf_615 + ivtmp.678_4268 * 4]
	andps	.LC212(%rip), %xmm0	 #, a
	maxss	%xmm1, %xmm0	 # peak, a
	addq	$1, %rax	 #, ivtmp.678
	movaps	%xmm0, %xmm1	 # a, peak
.L984:
 # pms.c:803:     for (int i=0;i<n;i++){ float a=fabsf(buf[i]); if(a>peak) peak=a; }
	cmpl	%eax, %edx	 # ivtmp.678, _613
	jg	.L985	 #,
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	comiss	.LC213(%rip), %xmm1	 #, peak
	jbe	.L986	 #,
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	movss	.LC214(%rip), %xmm2	 #, tmp4283
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	xorl	%eax, %eax	 # ivtmp.670
	movl	72(%rsp), %edx	 # %sfp, _613
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	divss	%xmm1, %xmm2	 # peak, s
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	jmp	.L988	 #
	.p2align 5
.L989:
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	movss	(%rsi,%rax,4), %xmm0	 # MEM[(float *)buf_615 + ivtmp.670_4283 * 4], _1311
	mulss	%xmm2, %xmm0	 # s, _1311
	movss	%xmm0, (%rsi,%rax,4)	 # _1311, MEM[(float *)buf_615 + ivtmp.670_4283 * 4]
	addq	$1, %rax	 #, ivtmp.670
.L988:
 # pms.c:804:     if (peak > 1e-7f){ float s=target/peak; for(int i=0;i<n;i++) buf[i]*=s; }
	cmpl	%eax, %edx	 # ivtmp.670, _613
	jg	.L989	 #,
.L986:
 # pms.c:1071:     for(int i=0;i<N;i++) buf[i]=clampf(buf[i],-1.f,1.f);
	cmpl	$0, 228(%rsp)	 #, %sfp
	jg	.L983	 #,
	jmp	.L992	 #
.L1744:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3168
	jmp	.L903	 #
.L1109:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L949	 #
.L1070:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L677	 #
.L1722:
	pxor	%xmm3, %xmm3	 # _3791
	jmp	.L715	 #
.L1656:
	movl	320(%rsp), %edi	 # %sfp, ramp_on
	movl	308(%rsp), %r14d	 # %sfp, ramp_off
	movl	192(%rsp), %r11d	 # %sfp, _738
	movl	324(%rsp), %ebp	 # %sfp, pretmp_2785
	movq	328(%rsp), %rcx	 # %sfp, _4310
	movq	184(%rsp), %rsi	 # %sfp, buf
.L758:
	cmpl	%edi, 72(%rsp)	 # ramp_on, %sfp
	jg	.L538	 #,
	jmp	.L979	 #
.L1755:
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	movl	72(%rsp), %edx	 # %sfp, _613
	pxor	%xmm0, %xmm0	 # _30
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	pxor	%xmm1, %xmm1	 # _32
	cvtsi2ssl	812(%rsp), %xmm1	 # st.sample_rate, _32
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	leaq	.LC215(%rip), %rcx	 #,
	pxor	%xmm6, %xmm6	 # _34
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	cvtsi2ssl	%edx, %xmm0	 # _613, _30
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	divss	%xmm1, %xmm0	 # _32, _33
 # pms.c:1442:         printf("Generated %d samples (%.3f s)\n", nsamples, (float)nsamples / st.sample_rate);
	cvtss2sd	%xmm0, %xmm6	 # _33, _34
	movq	%xmm6, %r8	 # _34, _34
	movapd	%xmm6, %xmm2	 # _34,
	call	printf	 #
 # pms.c:1445:     switch(st.output_format){
	movl	2368(%rsp), %eax	 # st.output_format, _35
 # pms.c:1445:     switch(st.output_format){
	cmpl	$2, %eax	 #, _35
	je	.L996	 #,
	jbe	.L1675	 #,
	cmpl	$3, %eax	 #, _35
	jne	.L1001	 #,
.L1000:
 # pms.c:477:     FILE *fp = fopen(path,"wb");
	leaq	1312(%rsp), %rcx	 #, tmp4394
	leaq	.LC216(%rip), %rdx	 #,
	call	fopen	 #
 # pms.c:478:     if (!fp) return -1;
	testq	%rax, %rax	 # fp
 # pms.c:477:     FILE *fp = fopen(path,"wb");
	movq	%rax, %rbx	 #, fp
 # pms.c:478:     if (!fp) return -1;
	je	.L1676	 #,
.L1655:
 # pms.c:479:     fwrite(s,4,n,fp);
	movq	312(%rsp), %r8	 # %sfp,
	movq	%rbx, %r9	 # fp,
	movl	$4, %edx	 #,
	movq	%rsi, %rcx	 # buf,
	call	fwrite	 #
.L1678:
 # pms.c:480:     fclose(fp); return 0;
	movq	%rbx, %rcx	 # fp,
	call	fclose	 #
.L1001:
 # pms.c:1452:     if (st.verbose) printf("Output written to '%s'\n", st.output_filename);
	cmpl	$0, 2380(%rsp)	 #, st.verbose
	je	.L1012	 #,
 # pms.c:1452:     if (st.verbose) printf("Output written to '%s'\n", st.output_filename);
	leaq	1312(%rsp), %rdx	 #, tmp4398
	leaq	.LC234(%rip), %rcx	 #,
	call	printf	 #
.L1012:
 # pms.c:1454:     free(samples);
	movq	%rsi, %rcx	 # buf,
	call	free	 #
 # pms.c:1455:     free(st.spec.frames);
	movq	1248(%rsp), %rcx	 # st.spec.frames,
	call	free	 #
 # pms.c:1456:     free(st.phon.phonemes);
	movq	1272(%rsp), %rcx	 # st.phon.phonemes,
	call	free	 #
 # pms.c:1457:     free(st.pitch_contour);
	movq	1232(%rsp), %rcx	 # st.pitch_contour,
	call	free	 #
 # pms.c:1458:     return 0;
	jmp	.L322	 #
.L1071:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L680	 #
.L1110:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L952	 #
.L1745:
	pxor	%xmm3, %xmm3	 # _3192
	jmp	.L908	 #
.L1723:
	pxor	%xmm3, %xmm3	 # _3815
	jmp	.L720	 #
.L1704:
 # pms.c:1410:         fprintf(stderr, "ERROR: FORMANTS (%d) must be between 1 and MAX_FORMANTS (%d)\n", FORMANTS, MAX_FORMANTS);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1410:         fprintf(stderr, "ERROR: FORMANTS (%d) must be between 1 and MAX_FORMANTS (%d)\n", FORMANTS, MAX_FORMANTS);
	movl	$10, %r9d	 #,
	movl	%ebx, %r8d	 # FORMANTS.1_5,
	leaq	.LC165(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _8,
	call	fprintf	 #
 # pms.c:1411:         return 1;
	jmp	.L330	 #
.L564:
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L1763	 #,
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movl	144(%rdx), %r10d	 # MEM[(const struct SpecFrame *)_127].has_fgain, _596
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movq	%rdx, %r9	 # B, A
.L573:
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movq	216(%rsp), %rsi	 # %sfp, _2798
	leaq	4(%r9), %rdx	 #, _411
	movss	%xmm2, 160(%rsp)	 # t_ms, %sfp
	leaq	448(%rsp), %rbp	 #, tmp4407
	movl	%r10d, 120(%rsp)	 # _596, %sfp
	movq	%rbp, %rcx	 # tmp4407,
	movq	%r9, 112(%rsp)	 # A, %sfp
	movq	%rsi, %r8	 # _2798,
	call	memcpy	 #
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movq	112(%rsp), %r9	 # %sfp, A
	leaq	496(%rsp), %rcx	 #,
	movq	%rsi, %r8	 # _2798,
	leaq	44(%r9), %rdx	 #, _359
	call	memcpy	 #
	movq	112(%rsp), %r9	 # %sfp, A
	xorl	%eax, %eax	 # ivtmp.816
	movl	120(%rsp), %r10d	 # %sfp, _596
	leaq	544(%rsp), %rcx	 #, tmp4410
	movss	160(%rsp), %xmm2	 # %sfp, t_ms
.L588:
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	testl	%r10d, %r10d	 # _596
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, ga
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	je	.L587	 #,
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movss	104(%r9,%rax,4), %xmm0	 # MEM[(float *)A_408 + 104B + ivtmp.816_4198 * 4], ga
.L587:
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm0, (%rcx,%rax,4)	 # ga, MEM[(float *)_1365 + ivtmp.816_4198 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.816
	cmpl	%eax, %ebx	 # ivtmp.816, pretmp_2554
	jg	.L588	 #,
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm4	 # A_408->frication_amp, fr_amp
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm13	 # A_408->voicing_amp, v_amp
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm4	 # A_408->gain_mult, gain_mult
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm12	 # A_408->aspiration_amp, a_amp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_408->f0, f0
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	%xmm4, 120(%rsp)	 # gain_mult, %sfp
.L571:
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L563	 #,
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _637
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _637
	jle	.L563	 #,
.L1683:
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	(%r15), %xmm0	 # MEM[(const struct ContourPt *)pretmp_2544].time_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	jnb	.L1667	 #,
.L1628:
	movq	%r15, %rcx	 # pretmp_2544,
	call	contour_f0.part.0	 #
	movaps	%xmm0, %xmm1	 # f0, f0
	jmp	.L563	 #
.L783:
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L1764	 #,
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movl	144(%rdx), %r10d	 # MEM[(const struct SpecFrame *)_2451].has_fgain, _676
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movq	%rdx, %r9	 # B, A
.L1019:
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movq	160(%rsp), %rsi	 # %sfp, _767
	leaq	4(%r9), %rdx	 #, _476
	movss	%xmm2, 192(%rsp)	 # t_ms, %sfp
	leaq	448(%rsp), %rbp	 #, tmp4407
	movl	%r10d, 132(%rsp)	 # _676, %sfp
	movq	%rbp, %rcx	 # tmp4407,
	movq	%r9, 112(%rsp)	 # A, %sfp
	movq	%rsi, %r8	 # _767,
	call	memcpy	 #
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movq	112(%rsp), %r9	 # %sfp, A
	leaq	496(%rsp), %rcx	 #,
	movq	%rsi, %r8	 # _767,
	leaq	44(%r9), %rdx	 #, _672
	call	memcpy	 #
	movl	132(%rsp), %r10d	 # %sfp, _676
	xorl	%eax, %eax	 # ivtmp.728
	movq	112(%rsp), %r9	 # %sfp, A
	leaq	544(%rsp), %rcx	 #, tmp4410
	movss	192(%rsp), %xmm2	 # %sfp, t_ms
	jmp	.L796	 #
	.p2align 5
.L1766:
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, ga
.L798:
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm0, (%rcx,%rax,4)	 # ga, MEM[(float *)_1365 + ivtmp.728_3070 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.728
	cmpl	%eax, %ebx	 # ivtmp.728, pretmp_2554
	jle	.L1765	 #,
.L796:
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	testl	%r10d, %r10d	 # _676
	je	.L1766	 #,
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movss	104(%r9,%rax,4), %xmm0	 # MEM[(float *)A_1042 + 104B + ivtmp.728_3070 * 4], ga
	jmp	.L798	 #
.L662:
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_1283
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm3, %xmm3	 # _1291
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_1283, _1284
	sall	$13, %eax	 #, _1284
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_1283, _1285
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _1285, _1286
	shrl	$17, %edx	 #, _1286
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _1285, _1287
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _1287, _1288
	sall	$5, %eax	 #, _1288
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _1287, _1289
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm3	 # _1289, _1291
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _1289, g_noise_state
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm3	 #, _1292
 # pms.c:795:             v = white_noise() * 0.45f;                                 
	mulss	.LC200(%rip), %xmm3	 #, v
	jmp	.L657	 #
.L882:
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	g_noise_state(%rip), %edx	 # g_noise_state, g_noise_state.62_2114
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	pxor	%xmm3, %xmm3	 # _2105
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	movl	%edx, %eax	 # g_noise_state.62_2114, _2113
	sall	$13, %eax	 #, _2113
 # pms.c:150:     g_noise_state ^= g_noise_state << 13;
	xorl	%edx, %eax	 # g_noise_state.62_2114, _2112
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	movl	%eax, %edx	 # _2112, _2111
	shrl	$17, %edx	 #, _2111
 # pms.c:151:     g_noise_state ^= g_noise_state >> 17;
	xorl	%eax, %edx	 # _2112, _2110
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%edx, %eax	 # _2110, _2109
	sall	$5, %eax	 #, _2109
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	xorl	%edx, %eax	 # _2110, _2108
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	cvtsi2ssl	%eax, %xmm3	 # _2108, _2105
 # pms.c:152:     g_noise_state ^= g_noise_state <<  5;
	movl	%eax, g_noise_state(%rip)	 # _2108, g_noise_state
 # pms.c:153:     return (float)(int32_t)g_noise_state * (1.0f / 2147483648.0f);
	mulss	.LC203(%rip), %xmm3	 #, _2104
 # pms.c:795:             v = white_noise() * 0.45f;                                 
	mulss	.LC200(%rip), %xmm3	 #, v
	jmp	.L877	 #
.L1724:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3839
	jmp	.L725	 #
.L1072:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L683	 #
.L1111:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L955	 #
.L1746:
	pxor	%xmm3, %xmm3	 # _3216
	jmp	.L913	 #
.L1700:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	40(%rax), %xmm0	 # vp_477->bw[0], vp_477->bw[0]
	movss	%xmm0, 832(%rsp)	 # vp_477->bw[0], st.formants[0].bw
	jmp	.L447	 #
.L1759:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm2, 464(%rsp)	 # tmp3789, MEM <vector(4) float> [(float *)_1363 + 16B]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm1, 512(%rsp)	 # tmp3790, MEM <vector(4) float> [(float *)_1364 + 16B]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm0, 560(%rsp)	 # tmp3791, MEM <vector(4) float> [(float *)_1365 + 16B]
	jmp	.L835	 #
.L1735:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm2, 464(%rsp)	 # tmp3100, MEM <vector(4) float> [(float *)_1363 + 16B]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm1, 512(%rsp)	 # tmp3101, MEM <vector(4) float> [(float *)_1364 + 16B]
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	movaps	%xmm0, 560(%rsp)	 # tmp3102, MEM <vector(4) float> [(float *)_1365 + 16B]
	jmp	.L614	 #
.L1705:
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2690
	movss	%xmm0, 1176(%rsp)	 # tmp2690, st.formant_gains[7]
	jmp	.L483	 #
.L1701:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	44(%rax), %xmm0	 # vp_477->bw[1], vp_477->bw[1]
	movss	%xmm0, 864(%rsp)	 # vp_477->bw[1], st.formants[1].bw
	jmp	.L450	 #
.L1706:
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2692
	movss	%xmm0, 1180(%rsp)	 # tmp2692, st.formant_gains[8]
	jmp	.L485	 #
.L1697:
 # pms.c:1218:             NEED_VAL(a); const char *m=argv[++i];
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1218:             NEED_VAL(a); const char *m=argv[++i];
	movq	8(%rdi,%r14,8), %r12	 # *_246, m
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC89(%rip), %rdx	 #,
	movq	__imp__stricmp(%rip), %r13	 #, tmp2380
	movq	%r12, %rcx	 # m,
	call	*%r13	 # tmp2380
 # pms.c:1219:             if(!strcasecmp(m,"cascade"))       st->filter_mode=FILTER_CASCADE;
	testl	%eax, %eax	 # _248
	jne	.L357	 #,
 # pms.c:1219:             if(!strcasecmp(m,"cascade"))       st->filter_mode=FILTER_CASCADE;
	xorl	%edx, %edx	 #
	movl	%edx, 804(%rsp)	 #, st.filter_mode
	jmp	.L332	 #
.L1702:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	48(%rax), %xmm0	 # vp_477->bw[2], vp_477->bw[2]
	movss	%xmm0, 896(%rsp)	 # vp_477->bw[2], st.formants[2].bw
	jmp	.L452	 #
.L1698:
	movl	FORMANTS(%rip), %ebx	 # FORMANTS, FORMANTS.1_5
	jmp	.L438	 #
.L1707:
 # pms.c:1415:         if (st.formant_gains[k] < 1e-9f) st.formant_gains[k] = 1.0f;
	movss	.LC43(%rip), %xmm0	 #, tmp2694
	movss	%xmm0, 1184(%rsp)	 # tmp2694, st.formant_gains[9]
	jmp	.L487	 #
.L1762:
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	leaq	.LC88(%rip), %rdx	 #, iftmp.29_550
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	subl	$1, %eax	 #, _549
	jne	.L500	 #,
 # pms.c:1347:     printf("Mode      : %s\n", st->mode==MODE_DEMO?"demo":st->mode==MODE_SPEC?"spec":"phoneme");
	leaq	.LC87(%rip), %rdx	 #, iftmp.29_550
	jmp	.L500	 #
.L1699:
 # pms.c:1324:         if (st->voice_type == VOICE_IMPULSIVE) vp = &g_preset_impulsive;
	leaq	g_preset_natural(%rip), %rax	 #, vp
	jmp	.L435	 #
.L574:
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm4, %xmm5	 # _1212, alpha
	xorl	%eax, %eax	 # ivtmp.804
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	pxor	%xmm12, %xmm12	 # tmp2993
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm3, %xmm5	 # _1213, alpha
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm3, 120(%rsp)	 # _1213, %sfp
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	jmp	.L586	 #
.L1767:
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm0, %xmm1	 # _2614, _2614
	mulss	%xmm12, %xmm1	 # tmp2993, _2614
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm1, %xmm4	 # _2612, _2609
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm1, %xmm1	 # _2603
.L585:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm13, %xmm3	 # pretmp_2619, pretmp_2613
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _1153
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm4, 0(%rbp,%rax,4)	 # _2609, MEM[(float *)_1363 + ivtmp.804_4094 * 4]
 # pms.c:610:         float ga = A->has_fgain ? A->fgain[k] : 1.0f;
	movss	104(%r9,%rax,4), %xmm4	 # MEM[(float *)A_1131 + 104B + ivtmp.804_4094 * 4], ga
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm3, %xmm0	 # pretmp_2613, _2607
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _2603, _2606
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm13, %xmm0	 # pretmp_2619, _2605
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm0, (%rdi,%rax,4)	 # _2605, MEM[(float *)_1364 + ivtmp.804_4094 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, gb
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	je	.L584	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_1135 + 104B + ivtmp.804_4094 * 4], gb
.L584:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm4, %xmm0	 # ga, _2587
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _2603, _2586
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # ga, _2585
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm0, (%rcx,%rax,4)	 # _2585, MEM[(float *)_1365 + ivtmp.804_4094 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.804
	cmpl	%eax, %ebx	 # ivtmp.804, pretmp_2554
	jle	.L1679	 #,
.L586:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm5, %xmm12	 # alpha, tmp2993
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	4(%r9,%rax,4), %xmm4	 # MEM[(float *)A_1131 + 4B + ivtmp.804_4094 * 4], _2623
 # pms.c:161:     { return a + (b - a) * t; }
	movss	4(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_1135 + 4B + ivtmp.804_4094 * 4], MEM[(float *)B_1135 + 4B + ivtmp.804_4094 * 4]
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%r9,%rax,4), %xmm13	 # MEM[(float *)A_1131 + 44B + ivtmp.804_4094 * 4], pretmp_2619
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm4, %xmm0	 # _2623, _2614
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%rdx,%rax,4), %xmm3	 # MEM[(float *)B_1135 + 44B + ivtmp.804_4094 * 4], pretmp_2613
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	ja	.L1767	 #,
	movaps	%xmm6, %xmm1	 # tmp4406, tmp3004
	movaps	%xmm6, %xmm2	 # tmp4406, tmp3005
	cmpltss	%xmm5, %xmm1	 #, alpha, tmp3004
	andps	%xmm1, %xmm2	 # tmp3004, tmp3005
	andnps	%xmm5, %xmm1	 # alpha, tmp3006
	orps	%xmm2, %xmm1	 # tmp3005, _2603
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm1, %xmm0	 # _2603, _2602
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm4	 # _2602, _2609
	jmp	.L585	 #
.L1752:
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm3, %xmm4	 # _2322, alpha
	xorl	%eax, %eax	 # ivtmp.704
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm2, 112(%rsp)	 # t_ms, %sfp
	pxor	%xmm12, %xmm12	 # tmp3682
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm0, %xmm4	 # _2321, alpha
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	%xmm0, 132(%rsp)	 # _2321, %sfp
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	jmp	.L803	 #
.L1769:
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm12, %xmm1	 # tmp3682, _2355
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _2437
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm5, %xmm1	 # _2391, _2354
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm1, 0(%rbp,%rax,4)	 # _2354, MEM[(float *)_1363 + ivtmp.704_4408 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm0, %xmm1	 # pretmp_2381, pretmp_2381
	subss	%xmm14, %xmm1	 # pretmp_2387, pretmp_2381
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm12, %xmm1	 # tmp3682, _3549
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm14, %xmm1	 # pretmp_2387, _3546
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm1, (%rdi,%rax,4)	 # _3546, MEM[(float *)_1364 + ivtmp.704_4408 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	jne	.L802	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm1	 # tmp4406, gb
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm5, %xmm5	 # _2361
.L805:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm6, %xmm1	 # tmp4406, _2360
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm5, %xmm1	 # _2361, _2359
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm6, %xmm1	 # tmp4406, _2358
 # pms.c:612:         fgain[k] = interp(ga, gb, t0,t1,t_ms);
	movss	%xmm1, (%rcx,%rax,4)	 # _2358, MEM[(float *)_1365 + ivtmp.704_4408 * 4]
 # pms.c:607:     for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.704
	cmpl	%eax, %ebx	 # ivtmp.704, pretmp_2554
	jle	.L1768	 #,
.L803:
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm4, %xmm12	 # alpha, tmp3682
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	4(%r9,%rax,4), %xmm5	 # MEM[(float *)A_2444 + 4B + ivtmp.704_4408 * 4], _2391
 # pms.c:161:     { return a + (b - a) * t; }
	movss	4(%rdx,%rax,4), %xmm1	 # MEM[(float *)B_2441 + 4B + ivtmp.704_4408 * 4], MEM[(float *)B_2441 + 4B + ivtmp.704_4408 * 4]
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%r9,%rax,4), %xmm14	 # MEM[(float *)A_2444 + 44B + ivtmp.704_4408 * 4], pretmp_2387
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm5, %xmm1	 # _2391, _2382
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	44(%rdx,%rax,4), %xmm0	 # MEM[(float *)B_2441 + 44B + ivtmp.704_4408 * 4], pretmp_2381
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	ja	.L1769	 #,
	movaps	%xmm6, %xmm13	 # tmp4406, tmp3707
	movaps	%xmm6, %xmm2	 # tmp4406, tmp3708
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	testl	%r8d, %r8d	 # _2437
	cmpltss	%xmm4, %xmm13	 #, alpha, tmp3707
	andps	%xmm13, %xmm2	 # tmp3707, tmp3708
	andnps	%xmm4, %xmm13	 # alpha, tmp3709
	orps	%xmm2, %xmm13	 # tmp3708, _2379
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm13, %xmm1	 # _2379, _2378
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm5, %xmm1	 # _2391, _2377
 # pms.c:608:         freq [k] = interp(A->freq[k], B->freq[k], t0,t1,t_ms);
	movss	%xmm1, 0(%rbp,%rax,4)	 # _2377, MEM[(float *)_1363 + ivtmp.704_4408 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movaps	%xmm0, %xmm1	 # pretmp_2381, pretmp_2381
	subss	%xmm14, %xmm1	 # pretmp_2387, pretmp_2381
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm13, %xmm1	 # _2379, _3022
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm14, %xmm1	 # pretmp_2387, _2340
 # pms.c:609:         bw   [k] = interp(A->bw  [k], B->bw  [k], t0,t1,t_ms);
	movss	%xmm1, (%rdi,%rax,4)	 # _2340, MEM[(float *)_1364 + ivtmp.704_4408 * 4]
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm1	 # tmp4406, gb
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	je	.L806	 #,
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm1	 # MEM[(float *)B_2441 + 104B + ivtmp.704_4408 * 4], gb
.L806:
	movaps	%xmm6, %xmm5	 # tmp4406, tmp3701
	movaps	%xmm6, %xmm13	 # tmp4406, tmp3702
	cmpltss	%xmm4, %xmm5	 #, alpha, tmp3701
	andps	%xmm5, %xmm13	 # tmp3701, tmp3702
	andnps	%xmm4, %xmm5	 # alpha, tmp3703
	orps	%xmm13, %xmm5	 # tmp3702, _2361
	jmp	.L805	 #
.L1703:
 # pms.c:1328:             if(!explicit_bw     [k]) st->formants[k].bw   = vp->bw  [k];
	movss	52(%rax), %xmm0	 # vp_477->bw[3], vp_477->bw[3]
	movss	%xmm0, 928(%rsp)	 # vp_477->bw[3], st.formants[3].bw
	jmp	.L454	 #
.L1117:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L944	 #
.L1107:
	pxor	%xmm1, %xmm1	 # _1369
	jmp	.L941	 #
.L1080:
	pxor	%xmm1, %xmm1	 # _1015
	jmp	.L753	 #
.L1078:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L672	 #
.L1763:
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movaps	%xmm0, %xmm3	 # t0, t1
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movq	%rdx, %r9	 # B, A
.L1023:
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm4	 # A_407->frication_amp, fr_amp
 # pms.c:165:     if (t1 <= t0) return v0;
	comiss	%xmm3, %xmm0	 # t1, t0
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm13	 # A_407->voicing_amp, v_amp
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm4	 # A_407->gain_mult, gain_mult
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm12	 # A_407->aspiration_amp, a_amp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_407->f0, f0
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	%xmm4, 120(%rsp)	 # gain_mult, %sfp
 # pms.c:165:     if (t1 <= t0) return v0;
	jnb	.L571	 #,
	movaps	%xmm2, %xmm4	 # t_ms, _1212
	subss	%xmm0, %xmm3	 # t0, _1213
	subss	%xmm0, %xmm4	 # t0, _1212
	movd	%xmm4, %r10d	 # _1212, _1212
.L572:
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movd	%r10d, %xmm0	 # _1212, _1212
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%rdx), %xmm4	 # B_510->voicing_amp, _1162
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm3, %xmm0	 # _1213, _1212
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm3, %xmm3	 # _1218
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm0, %xmm3	 # alpha, _1218
	ja	.L590	 #,
	movaps	%xmm6, %xmm3	 # tmp4406, tmp3033
	movaps	%xmm6, %xmm5	 # tmp4406, tmp3034
	cmpltss	%xmm0, %xmm3	 #, alpha, tmp3033
	andps	%xmm3, %xmm5	 # tmp3033, tmp3034
	andnps	%xmm0, %xmm3	 # alpha, tmp3035
	orps	%xmm5, %xmm3	 # tmp3034, _1218
.L590:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm13, %xmm4	 # v_amp, _1162
	movaps	%xmm4, %xmm0	 # _1162, _1217
	movss	112(%rsp), %xmm4	 # %sfp, fr_amp
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _1218, _1219
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm13	 # _1219, v_amp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	88(%rdx), %xmm0	 # B_510->aspiration_amp, B_510->aspiration_amp
	subss	%xmm12, %xmm0	 # a_amp, _1227
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _1218, _1229
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm12	 # _1229, a_amp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	92(%rdx), %xmm0	 # B_510->frication_amp, B_510->frication_amp
	subss	%xmm4, %xmm0	 # fr_amp, _1237
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _1218, _1239
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # fr_amp, _1239
 # pms.c:161:     { return a + (b - a) * t; }
	movss	120(%rsp), %xmm4	 # %sfp, gain_mult
 # pms.c:161:     { return a + (b - a) * t; }
	movss	%xmm0, 112(%rsp)	 # _1239, %sfp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	96(%rdx), %xmm0	 # B_510->f0, B_510->f0
	subss	%xmm1, %xmm0	 # f0, _1247
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _1218, _1249
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm1	 # _1249, f0
 # pms.c:161:     { return a + (b - a) * t; }
	movss	100(%rdx), %xmm0	 # B_510->gain_mult, B_510->gain_mult
	subss	%xmm4, %xmm0	 # gain_mult, _1257
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _1218, _1259
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # gain_mult, _1259
	movss	%xmm0, 120(%rsp)	 # _1259, %sfp
	jmp	.L571	 #
.L1764:
 # pms.c:605:     float t0 = A->time_ms, t1 = B->time_ms;
	movaps	%xmm4, %xmm0	 # t0, t1
 # pms.c:603:     const SpecFrame *A = &sd->frames[lo];
	movq	%rdx, %r9	 # B, A
.L1021:
 # pms.c:165:     if (t1 <= t0) return v0;
	comiss	%xmm0, %xmm4	 # t1, t0
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm5	 # A_1041->frication_amp, fr_amp
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm12	 # A_1041->voicing_amp, v_amp
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm13	 # A_1041->aspiration_amp, a_amp
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	%xmm5, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_1041->f0, f0
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm14	 # A_1041->gain_mult, gain_mult
 # pms.c:165:     if (t1 <= t0) return v0;
	jnb	.L790	 #,
	movaps	%xmm2, %xmm3	 # t_ms, _2322
	subss	%xmm4, %xmm0	 # t0, _2321
	subss	%xmm4, %xmm3	 # t0, _2322
.L1018:
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	movaps	%xmm3, %xmm4	 # _2322, _2322
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%rdx), %xmm5	 # B_959->voicing_amp, _2323
 # pms.c:166:     float alpha = (t - t0) / (t1 - t0);
	divss	%xmm0, %xmm4	 # _2321, _2322
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _2319
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm4, %xmm0	 # alpha, _2319
	ja	.L791	 #,
	movaps	%xmm6, %xmm0	 # tmp4406, tmp3647
	movaps	%xmm6, %xmm3	 # tmp4406, tmp3648
	cmpltss	%xmm4, %xmm0	 #, alpha, tmp3647
	andps	%xmm0, %xmm3	 # tmp3647, tmp3648
	andnps	%xmm4, %xmm0	 # alpha, tmp3649
	orps	%xmm3, %xmm0	 # tmp3648, _2319
.L791:
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm12, %xmm5	 # v_amp, _2323
	movaps	%xmm5, %xmm3	 # _2323, _2318
	movss	112(%rsp), %xmm5	 # %sfp, fr_amp
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm0, %xmm3	 # _2319, _2317
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm3, %xmm12	 # _2317, v_amp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	88(%rdx), %xmm3	 # B_959->aspiration_amp, B_959->aspiration_amp
	subss	%xmm13, %xmm3	 # a_amp, _2314
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm0, %xmm3	 # _2319, _2313
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm3, %xmm13	 # _2313, a_amp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	92(%rdx), %xmm3	 # B_959->frication_amp, B_959->frication_amp
	subss	%xmm5, %xmm3	 # fr_amp, _2310
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm0, %xmm3	 # _2319, _2309
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm5, %xmm3	 # fr_amp, _2309
	movss	%xmm3, 112(%rsp)	 # _2309, %sfp
 # pms.c:161:     { return a + (b - a) * t; }
	movss	96(%rdx), %xmm3	 # B_959->f0, B_959->f0
	subss	%xmm1, %xmm3	 # f0, _2306
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm0, %xmm3	 # _2319, _2305
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm3, %xmm1	 # _2305, f0
 # pms.c:161:     { return a + (b - a) * t; }
	movss	100(%rdx), %xmm3	 # B_959->gain_mult, B_959->gain_mult
	subss	%xmm14, %xmm3	 # gain_mult, _2302
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _2302, _2301
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm0, %xmm14	 # _2301, gain_mult
.L790:
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L782	 #,
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _1120
 # pms.c:908:             if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _1120
	jle	.L782	 #,
.L1687:
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	(%r15), %xmm0	 # MEM[(const struct ContourPt *)pretmp_2544].time_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	comiss	%xmm2, %xmm0	 # t_ms, MEM[(const struct ContourPt *)pretmp_2544].time_ms
	jnb	.L1672	 #,
.L1643:
	movq	%r15, %rcx	 # pretmp_2544,
	call	contour_f0.part.0	 #
	movaps	%xmm0, %xmm1	 # f0, f0
	jmp	.L782	 #
.L996:
 # pms.c:466:     FILE *fp = fopen(path,"wb");
	leaq	1312(%rsp), %rcx	 #, tmp4379
	leaq	.LC216(%rip), %rdx	 #,
	call	fopen	 #
 # pms.c:467:     if (!fp) return -1;
	testq	%rax, %rax	 # fp
 # pms.c:466:     FILE *fp = fopen(path,"wb");
	movq	%rax, %rdi	 #, fp
 # pms.c:467:     if (!fp) return -1;
	je	.L1676	 #,
	movl	72(%rsp), %ebp	 # %sfp, _613
	xorl	%ebx, %ebx	 # ivtmp.659
	movss	.LC43(%rip), %xmm7	 #, tmp4620
 # pms.c:469:         int16_t v=(int16_t)(clampf(s[i],-1.f,1.f)*32767.f);
	movss	.LC226(%rip), %xmm6	 #, tmp4621
	jmp	.L1009	 #
.L1011:
 # pms.c:469:         int16_t v=(int16_t)(clampf(s[i],-1.f,1.f)*32767.f);
	movss	(%rsi,%rbx,4), %xmm1	 # MEM[(const float *)buf_615 + ivtmp.659_147 * 4], _1357
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC99(%rip), %xmm0	 #, _1360
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _1357, _1360
	ja	.L1010	 #,
	movaps	%xmm7, %xmm0	 # tmp4620, tmp4384
	movaps	%xmm7, %xmm2	 # tmp4620, tmp4385
	cmpltss	%xmm1, %xmm0	 #, _1357, tmp4384
	andps	%xmm0, %xmm2	 # tmp4384, tmp4385
	andnps	%xmm1, %xmm0	 # _1357, tmp4386
	orps	%xmm2, %xmm0	 # tmp4385, _1360
.L1010:
 # pms.c:469:         int16_t v=(int16_t)(clampf(s[i],-1.f,1.f)*32767.f);
	mulss	%xmm6, %xmm0	 # tmp4621, _1361
 # pms.c:471:         fwrite(b,1,2,fp);
	movq	%rdi, %r9	 # fp,
	movl	$2, %r8d	 #,
	leaq	544(%rsp), %rcx	 #, tmp4391
	movl	$1, %edx	 #,
	addq	$1, %rbx	 #, ivtmp.659
 # pms.c:469:         int16_t v=(int16_t)(clampf(s[i],-1.f,1.f)*32767.f);
	cvttss2sil	%xmm0, %eax	 # _1361, tmp4390
 # pms.c:470:         uint8_t b[2]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF)};
	movw	%ax, 544(%rsp)	 # tmp4390, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:471:         fwrite(b,1,2,fp);
	call	fwrite	 #
.L1009:
 # pms.c:468:     for (int i=0;i<n;i++){
	cmpl	%ebx, %ebp	 # ivtmp.659, _613
	jg	.L1011	 #,
 # pms.c:473:     fclose(fp); return 0;
	movq	%rdi, %rcx	 # fp,
	call	fclose	 #
	jmp	.L1001	 #
.L809:
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm1	 # MEM[(float *)B_2441 + 104B + ivtmp.716_3046 * 4], gb
	jmp	.L811	 #
.L1679:
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm4	 # A_1131->frication_amp, fr_amp
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm4	 # A_1131->gain_mult, gain_mult
	movss	120(%rsp), %xmm3	 # %sfp, _1213
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm13	 # A_1131->voicing_amp, v_amp
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	%xmm4, 120(%rsp)	 # gain_mult, %sfp
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm12	 # A_1131->aspiration_amp, a_amp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_1131->f0, f0
	jmp	.L572	 #
.L1054:
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movaps	%xmm6, %xmm0	 # tmp4406, gb
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm1, %xmm1	 # _2514
	jmp	.L578	 #
.L802:
 # pms.c:611:         float gb = B->has_fgain ? B->fgain[k] : 1.0f;
	movss	104(%rdx,%rax,4), %xmm1	 # MEM[(float *)B_2441 + 104B + ivtmp.704_4408 * 4], gb
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm5, %xmm5	 # _2361
	jmp	.L805	 #
.L1641:
 # pms.c:928:             if (pi >= 0) {
	addl	$1, %edx	 #, _1265
	jl	.L814	 #,
 # pms.c:929:                 const PhonemeInst *ph = &st->phon.phonemes[pi];
	imulq	$8100, %rdi, %rsi	 #, _1267, _1207
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	movaps	%xmm2, %xmm1	 # t_ms, t_within
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	movaps	%xmm6, %xmm0	 # tmp4406, tmp3752
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	movss	%xmm2, 132(%rsp)	 # t_ms, %sfp
 # pms.c:929:                 const PhonemeInst *ph = &st->phon.phonemes[pi];
	addq	1272(%rsp), %rsi	 # st.phon.phonemes, _1207
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	subss	0(%r13,%rdi,4), %xmm1	 # *_1205, t_within
 # pms.c:931:                 float dur_ph = ph->duration_ms > 1.0f ? ph->duration_ms : 1.0f;
	movss	16(%rsi), %xmm3	 # ph_1209->duration_ms, _1203
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	movaps	%xmm1, %xmm5	 # t_within, _1198
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	movq	%rsi, %rcx	 # ph,
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	cmpltss	%xmm3, %xmm0	 #, _1203, tmp3752
	andps	%xmm0, %xmm3	 # tmp3752, tmp3753
	andnps	%xmm6, %xmm0	 # tmp4406, tmp3754
	orps	%xmm3, %xmm0	 # tmp3753, _1421
	divss	%xmm0, %xmm5	 # _1421, _1198
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	call	phon_pitch	 #
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm3, %xmm3	 # tmp3755
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	movss	136(%rsp), %xmm12	 # %sfp, v_amp
 # pms.c:937:                 fr_amp = ph->frication_amp;
	movss	8092(%rsi), %xmm4	 # ph_1209->frication_amp, fr_amp
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	movaps	%xmm0, %xmm1	 # f0, f0
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	movss	8084(%rsi), %xmm0	 # ph_1209->voicing_amp, pretmp_1197
 # pms.c:939:                 if (ph->plosive_type > 0) {
	movl	8096(%rsi), %eax	 # ph_1209->plosive_type, pretmp_1186
 # pms.c:937:                 fr_amp = ph->frication_amp;
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:936:                 a_amp  = ph->aspiration_amp;
	movss	8088(%rsi), %xmm13	 # ph_1209->aspiration_amp, a_amp
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	mulss	%xmm0, %xmm12	 # pretmp_1197, v_amp
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	132(%rsp), %xmm2	 # %sfp, t_ms
	comiss	%xmm5, %xmm3	 # _1198, tmp3755
	ja	.L822	 #,
	movaps	%xmm6, %xmm3	 # tmp4406, tmp3759
 # pms.c:974:                     is_burst = 0;
	xorl	%ebp, %ebp	 #
	movaps	%xmm6, %xmm4	 # tmp4406, tmp3760
	cmpltss	%xmm5, %xmm3	 #, _1198, tmp3759
 # pms.c:939:                 if (ph->plosive_type > 0) {
	testl	%eax, %eax	 # pretmp_1186
 # pms.c:974:                     is_burst = 0;
	movl	%ebp, 156(%rsp)	 #, %sfp
	andps	%xmm3, %xmm4	 # tmp3759, tmp3760
	andnps	%xmm5, %xmm3	 # _1198, tmp3761
	orps	%xmm4, %xmm3	 # tmp3760, _2480
 # pms.c:939:                 if (ph->plosive_type > 0) {
	jle	.L823	 #,
 # pms.c:941:                     if (pct < 0.40f) {
	movss	.LC196(%rip), %xmm5	 #, tmp3762
	comiss	%xmm3, %xmm5	 # _2480, tmp3762
	ja	.L824	 #,
 # pms.c:951:                     } else if (pct < 0.55f) {
	movss	.LC197(%rip), %xmm4	 #, tmp3763
	comiss	%xmm3, %xmm4	 # _2480, tmp3763
	jbe	.L1642	 #,
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	movaps	%xmm3, %xmm0	 # _2480, _2473
 # pms.c:955:                         a_amp  = 0.0f;
	pxor	%xmm13, %xmm13	 # a_amp
 # pms.c:954:                         v_amp  = 0.0f;
	movaps	%xmm13, %xmm12	 #, v_amp
	movss	%xmm2, 192(%rsp)	 # t_ms, %sfp
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	movss	%xmm3, 132(%rsp)	 # _2480, %sfp
	subss	%xmm5, %xmm0	 # tmp3762, _2473
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	divss	.LC198(%rip), %xmm0	 #, bp_2472
 # pms.c:953:                         burst_env = sinf(bp * PI_F);                               
	mulss	.LC189(%rip), %xmm0	 #, _2471
	call	sinf	 #
 # pms.c:956:                         fr_amp = 1.4f * burst_env;
	mulss	.LC199(%rip), %xmm0	 #, burst_env
 # pms.c:957:                         f0     = 0.0f;
	movaps	%xmm13, %xmm1	 # tmp48, f0
 # pms.c:958:                         is_burst = 1;
	movl	$1, 156(%rsp)	 #, %sfp
	movss	132(%rsp), %xmm3	 # %sfp, _2480
	movss	192(%rsp), %xmm2	 # %sfp, t_ms
 # pms.c:956:                         fr_amp = 1.4f * burst_env;
	movss	%xmm0, 112(%rsp)	 # burst_env, %sfp
.L823:
 # pms.c:977:                 for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L832	 #,
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	imulq	$40, %rdi, %rdx	 #, _1267, _2774
	movq	272(%rsp), %rax	 # %sfp, phon_sf
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	leaq	(%rax,%rdx), %r9	 #, _678
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	addq	280(%rsp), %rdx	 # %sfp, _1702
	xorl	%eax, %eax	 # ivtmp.743
.L831:
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	movss	(%r9,%rax,4), %xmm4	 # MEM[(float *)_678 + ivtmp.743_3053 * 4], _2504
 # pms.c:161:     { return a + (b - a) * t; }
	movss	280(%rsi,%rax,4), %xmm0	 # MEM[(float *)ph_1209 + 280B + ivtmp.743_3053 * 4], MEM[(float *)ph_1209 + 280B + ivtmp.743_3053 * 4]
	subss	%xmm4, %xmm0	 # _2504, _2503
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _2480, _2502
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # _2504, _2501
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	movss	(%rdx,%rax,4), %xmm4	 # MEM[(float *)_1702 + ivtmp.743_3053 * 4], _2498
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	movss	%xmm0, 0(%rbp,%rax,4)	 # _2501, MEM[(float *)_1363 + ivtmp.743_3053 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movss	320(%rsi,%rax,4), %xmm0	 # MEM[(float *)ph_1209 + 320B + ivtmp.743_3053 * 4], MEM[(float *)ph_1209 + 320B + ivtmp.743_3053 * 4]
 # pms.c:980:                     fgain[k] = 1.0f;
	movss	%xmm6, (%rcx,%rax,4)	 # tmp4406, MEM[(float *)_1365 + ivtmp.743_3053 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm4, %xmm0	 # _2498, _2497
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _2480, _2496
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # _2498, _2495
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	movss	%xmm0, (%rdi,%rax,4)	 # _2495, MEM[(float *)_1364 + ivtmp.743_3053 * 4]
 # pms.c:977:                 for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.743
	cmpl	%eax, %ebx	 # ivtmp.743, pretmp_2554
	jg	.L831	 #,
.L832:
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L1093	 #,
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _2490
 # pms.c:894:         float gain_mult = 1.0f;
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _2490
	jg	.L1687	 #,
	jmp	.L782	 #
.L1073:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L686	 #
.L1112:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L958	 #
.L1625:
 # pms.c:928:             if (pi >= 0) {
	addl	$1, %edx	 #, _740
	jl	.L592	 #,
 # pms.c:929:                 const PhonemeInst *ph = &st->phon.phonemes[pi];
	imulq	$8100, %rdi, %r8	 #, _742, _755
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	movaps	%xmm2, %xmm1	 # t_ms, t_within
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	movaps	%xmm6, %xmm0	 # tmp4406, tmp3063
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	movss	%xmm2, 120(%rsp)	 # t_ms, %sfp
 # pms.c:929:                 const PhonemeInst *ph = &st->phon.phonemes[pi];
	addq	1272(%rsp), %r8	 # st.phon.phonemes, ph
 # pms.c:930:                 t_within = t_ms - phon_t0[pi];
	subss	0(%r13,%rdi,4), %xmm1	 # *_758, t_within
 # pms.c:931:                 float dur_ph = ph->duration_ms > 1.0f ? ph->duration_ms : 1.0f;
	movss	16(%r8), %xmm3	 # ph_756->duration_ms, _761
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	movaps	%xmm1, %xmm5	 # t_within, _764
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	movq	%r8, %rcx	 # ph,
	movq	%r8, 112(%rsp)	 # ph, %sfp
 # pms.c:932:                 float pct    = clampf(t_within / dur_ph, 0.0f, 1.0f);
	cmpltss	%xmm3, %xmm0	 #, _761, tmp3063
	andps	%xmm0, %xmm3	 # tmp3063, tmp3064
	andnps	%xmm6, %xmm0	 # tmp4406, tmp3065
	orps	%xmm3, %xmm0	 # tmp3064, _763
	divss	%xmm0, %xmm5	 # _763, _764
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	call	phon_pitch	 #
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm3, %xmm3	 # tmp3066
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	movq	%rcx, %r8	 #, ph
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	movss	136(%rsp), %xmm13	 # %sfp, v_amp
 # pms.c:937:                 fr_amp = ph->frication_amp;
	movss	8092(%rcx), %xmm4	 # ph_756->frication_amp, fr_amp
 # pms.c:934:                 f0     = phon_pitch(ph, t_within);
	movaps	%xmm0, %xmm1	 # f0, f0
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	movss	8084(%rcx), %xmm0	 # ph_756->voicing_amp, pretmp_2780
 # pms.c:939:                 if (ph->plosive_type > 0) {
	movl	8096(%rcx), %eax	 # ph_756->plosive_type, pretmp_2784
 # pms.c:937:                 fr_amp = ph->frication_amp;
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:935:                 v_amp  = ph->voicing_amp    * st->voicing_amp;   
	mulss	%xmm0, %xmm13	 # pretmp_2780, v_amp
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	120(%rsp), %xmm2	 # %sfp, t_ms
 # pms.c:936:                 a_amp  = ph->aspiration_amp;
	movss	8088(%rcx), %xmm12	 # ph_756->aspiration_amp, a_amp
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm5, %xmm3	 # _764, tmp3066
	ja	.L600	 #,
	movaps	%xmm6, %xmm3	 # tmp4406, tmp3070
 # pms.c:974:                     is_burst = 0;
	xorl	%edx, %edx	 #
	movaps	%xmm6, %xmm4	 # tmp4406, tmp3071
	cmpltss	%xmm5, %xmm3	 #, _764, tmp3070
 # pms.c:939:                 if (ph->plosive_type > 0) {
	testl	%eax, %eax	 # pretmp_2784
 # pms.c:974:                     is_burst = 0;
	movl	%edx, 156(%rsp)	 #, %sfp
	andps	%xmm3, %xmm4	 # tmp3070, tmp3071
	andnps	%xmm5, %xmm3	 # _764, tmp3072
	orps	%xmm4, %xmm3	 # tmp3071, _766
 # pms.c:939:                 if (ph->plosive_type > 0) {
	jle	.L601	 #,
 # pms.c:941:                     if (pct < 0.40f) {
	movss	.LC196(%rip), %xmm4	 #, tmp3073
	comiss	%xmm3, %xmm4	 # _766, tmp3073
	ja	.L1015	 #,
 # pms.c:951:                     } else if (pct < 0.55f) {
	movss	.LC197(%rip), %xmm5	 #, tmp3074
	comiss	%xmm3, %xmm5	 # _766, tmp3074
	jbe	.L1627	 #,
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	movaps	%xmm3, %xmm0	 # _766, _776
	movss	%xmm3, 120(%rsp)	 # _766, %sfp
 # pms.c:955:                         a_amp  = 0.0f;
	pxor	%xmm12, %xmm12	 # a_amp
 # pms.c:954:                         v_amp  = 0.0f;
	movaps	%xmm12, %xmm13	 #, v_amp
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	subss	%xmm4, %xmm0	 # tmp3073, _776
 # pms.c:952:                         float bp = (pct - 0.40f) / 0.15f;                              
	divss	.LC198(%rip), %xmm0	 #, bp_777
 # pms.c:953:                         burst_env = sinf(bp * PI_F);                               
	mulss	.LC189(%rip), %xmm0	 #, _778
	movss	%xmm2, 160(%rsp)	 # t_ms, %sfp
	movq	%rcx, 256(%rsp)	 # ph, %sfp
	call	sinf	 #
	movss	120(%rsp), %xmm3	 # %sfp, _766
 # pms.c:957:                         f0     = 0.0f;
	movaps	%xmm12, %xmm1	 #, f0
 # pms.c:958:                         is_burst = 1;
	movl	$1, 156(%rsp)	 #, %sfp
 # pms.c:956:                         fr_amp = 1.4f * burst_env;
	mulss	.LC199(%rip), %xmm0	 #, burst_env
	movq	256(%rsp), %r8	 # %sfp, ph
	movss	160(%rsp), %xmm2	 # %sfp, t_ms
	movss	%xmm0, 112(%rsp)	 # burst_env, %sfp
.L601:
 # pms.c:977:                 for (int k=0;k<FORMANTS;k++){
	testl	%ebx, %ebx	 # pretmp_2554
	jle	.L610	 #,
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	imulq	$40, %rdi, %rdx	 #, _742, _789
	movq	272(%rsp), %rax	 # %sfp, phon_sf
	leaq	544(%rsp), %rcx	 #, tmp4410
	leaq	448(%rsp), %rbp	 #, tmp4407
	leaq	496(%rsp), %rdi	 #, tmp4408
	leaq	(%rax,%rdx), %r9	 #, _791
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	addq	280(%rsp), %rdx	 # %sfp, _798
	xorl	%eax, %eax	 # ivtmp.831
.L609:
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	movss	(%r9,%rax,4), %xmm4	 # MEM[(float *)_791 + ivtmp.831_4422 * 4], _792
 # pms.c:161:     { return a + (b - a) * t; }
	movss	280(%r8,%rax,4), %xmm0	 # MEM[(float *)ph_756 + 280B + ivtmp.831_4422 * 4], MEM[(float *)ph_756 + 280B + ivtmp.831_4422 * 4]
	subss	%xmm4, %xmm0	 # _792, _793
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _766, _794
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # _792, _795
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	movss	(%rdx,%rax,4), %xmm4	 # MEM[(float *)_798 + ivtmp.831_4422 * 4], _799
 # pms.c:978:                     freq [k] = lerpf(phon_sf[pi][k], ph->target_freq[k], pct);
	movss	%xmm0, 0(%rbp,%rax,4)	 # _795, MEM[(float *)_1363 + ivtmp.831_4422 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	movss	320(%r8,%rax,4), %xmm0	 # MEM[(float *)ph_756 + 320B + ivtmp.831_4422 * 4], MEM[(float *)ph_756 + 320B + ivtmp.831_4422 * 4]
 # pms.c:980:                     fgain[k] = 1.0f;
	movss	%xmm6, (%rcx,%rax,4)	 # tmp4406, MEM[(float *)_1365 + ivtmp.831_4422 * 4]
 # pms.c:161:     { return a + (b - a) * t; }
	subss	%xmm4, %xmm0	 # _799, _800
 # pms.c:161:     { return a + (b - a) * t; }
	mulss	%xmm3, %xmm0	 # _766, _801
 # pms.c:161:     { return a + (b - a) * t; }
	addss	%xmm4, %xmm0	 # _799, _802
 # pms.c:979:                     bw   [k] = lerpf(phon_sb[pi][k], ph->target_bw  [k], pct);
	movss	%xmm0, (%rdi,%rax,4)	 # _802, MEM[(float *)_1364 + ivtmp.831_4422 * 4]
 # pms.c:977:                 for (int k=0;k<FORMANTS;k++){
	addq	$1, %rax	 #, ivtmp.831
	cmpl	%eax, %ebx	 # ivtmp.831, pretmp_2554
	jg	.L609	 #,
.L610:
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	testq	%r15, %r15	 # pretmp_2544
	je	.L1665	 #,
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	movl	1240(%rsp), %edx	 # st.n_contour, _804
 # pms.c:894:         float gain_mult = 1.0f;
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
 # pms.c:983:                 if (st->pitch_contour && st->n_contour > 0)
	testl	%edx, %edx	 # _804
	jg	.L1683	 #,
	jmp	.L563	 #
.L1747:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3240
	jmp	.L918	 #
.L1725:
	pxor	%xmm3, %xmm3	 # _3863
	jmp	.L730	 #
.L780:
	movl	1256(%rsp), %eax	 # MEM[(int *)&st + 456B], _2279
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%eax, %eax	 # _2279
	jne	.L1670	 #,
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
	movss	136(%rsp), %xmm12	 # %sfp, v_amp
	movss	144(%rsp), %xmm13	 # %sfp, a_amp
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
	jmp	.L1643	 #
.L1105:
 # pms.c:1045:             samp = 0.0f;
	pxor	%xmm2, %xmm2	 # samp
	jmp	.L892	 #
.L560:
	movslq	1256(%rsp), %rcx	 # MEM[(int *)&st + 456B],
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%ecx, %ecx	 # _129
	jne	.L1663	 #,
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
	movss	144(%rsp), %xmm12	 # %sfp, a_amp
	movss	136(%rsp), %xmm13	 # %sfp, v_amp
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
	jmp	.L1628	 #
.L1708:
 # pms.c:1420:         if (spec_parse(st.input_filename, &st.spec) < 0) return 1;
	leaq	1248(%rsp), %rdx	 #, tmp2696
	leaq	1824(%rsp), %rcx	 #, tmp2698
	call	spec_parse	 #
 # pms.c:1420:         if (spec_parse(st.input_filename, &st.spec) < 0) return 1;
	addl	$1, %eax	 #, _12
	je	.L330	 #,
 # pms.c:1421:         if (st.spec.sample_rate != 22050) st.sample_rate = st.spec.sample_rate;
	movl	1260(%rsp), %eax	 # st.spec.sample_rate, _13
 # pms.c:1421:         if (st.spec.sample_rate != 22050) st.sample_rate = st.spec.sample_rate;
	cmpl	$22050, %eax	 #, _13
	je	.L491	 #,
 # pms.c:1421:         if (st.spec.sample_rate != 22050) st.sample_rate = st.spec.sample_rate;
	movl	%eax, 812(%rsp)	 # _13, st.sample_rate
.L491:
 # pms.c:1422:         if (st.spec.filter_mode != FILTER_CASCADE) st.filter_mode = st.spec.filter_mode;
	movl	1264(%rsp), %eax	 # st.spec.filter_mode, _14
 # pms.c:1422:         if (st.spec.filter_mode != FILTER_CASCADE) st.filter_mode = st.spec.filter_mode;
	testl	%eax, %eax	 # _14
	je	.L492	 #,
 # pms.c:1422:         if (st.spec.filter_mode != FILTER_CASCADE) st.filter_mode = st.spec.filter_mode;
	movl	%eax, 804(%rsp)	 # _14, st.filter_mode
.L492:
 # pms.c:1423:         float needed = st.spec.duration_ms / 1000.0f + 0.1f;
	movss	.LC51(%rip), %xmm6	 #, tmp4409
	movss	1268(%rsp), %xmm0	 # st.spec.duration_ms, st.spec.duration_ms
	divss	%xmm6, %xmm0	 # tmp4409, _16
 # pms.c:1423:         float needed = st.spec.duration_ms / 1000.0f + 0.1f;
	addss	.LC84(%rip), %xmm0	 #, needed
 # pms.c:1424:         if (st.duration_sec < needed) st.duration_sec = needed;
	comiss	816(%rsp), %xmm0	 # st.duration_sec, needed
	jbe	.L494	 #,
 # pms.c:1424:         if (st.duration_sec < needed) st.duration_sec = needed;
	movss	%xmm0, 816(%rsp)	 # needed, st.duration_sec
	jmp	.L494	 #
.L1726:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3887
	jmp	.L735	 #
.L1113:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L961	 #
.L1748:
	pxor	%xmm3, %xmm3	 # _3264
	jmp	.L923	 #
.L1074:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L689	 #
.L1013:
 # pms.c:1445:     switch(st.output_format){
	cmpl	$3, %eax	 #, _1671
	je	.L1000	 #,
	jmp	.L1012	 #
.L1756:
 # pms.c:427:     FILE *fp = fopen(path,"wb");
	leaq	.LC216(%rip), %rdx	 #,
 # pms.c:1446:         case FMT_WAV16: ret=wav16_write(st.output_filename,samples,nsamples,st.sample_rate); break;
	movl	812(%rsp), %ebp	 # st.sample_rate, _36
 # pms.c:427:     FILE *fp = fopen(path,"wb");
	leaq	1312(%rsp), %rcx	 #,
	call	fopen	 #
 # pms.c:428:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	testq	%rax, %rax	 # fp
 # pms.c:427:     FILE *fp = fopen(path,"wb");
	movq	%rax, %rbx	 #, fp
 # pms.c:428:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	je	.L1677	 #,
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rax, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1179011410, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	leaq	544(%rsp), %rcx	 #,
	call	fwrite	 #
 # pms.c:430:     w32(fp,(uint32_t)(36 + n*2));
	movl	72(%rsp), %r15d	 # %sfp, _613
 # pms.c:430:     w32(fp,(uint32_t)(36 + n*2));
	movq	%rbx, %rcx	 # fp,
	leal	36(%r15,%r15), %edx	 #,
	movl	%r15d, %r12d	 # _613, _613
	call	w32	 #
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1163280727, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$544501094, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$16, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movzwl	.LC222(%rip), %r13d	 #, tmp4319
 # pms.c:417:     fwrite(b,1,2,f);
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	leaq	544(%rsp), %rcx	 #,
	movl	$1, %edx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	%r13w, 544(%rsp)	 # tmp4319, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	%r13w, 544(%rsp)	 # tmp4319, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
 # pms.c:434:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*2);
	movl	%ebp, %edx	 # _36,
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
 # pms.c:434:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*2);
	leal	(%rbp,%rbp), %edx	 #, _1322
 # pms.c:434:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*2);
	movq	%rbx, %rcx	 # fp,
 # pms.c:437:     for (int i=0;i<n;i++){
	xorl	%ebp, %ebp	 # ivtmp.655
 # pms.c:434:     w32(fp,(uint32_t)sr); w32(fp,(uint32_t)sr*2);
	call	w32	 #
 # pms.c:417:     fwrite(b,1,2,f);
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$2, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:416:     uint8_t b[2] = {(uint8_t)(v & 0xFF),(uint8_t)(v >> 8)};
	movw	$16, 544(%rsp)	 #, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:417:     fwrite(b,1,2,f);
	call	fwrite	 #
 # pms.c:422:     fwrite(b,1,4,f);
	movq	%rbx, %r9	 # fp,
	movl	$4, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	544(%rsp), %rcx	 #,
 # pms.c:420:     uint8_t b[4]={(uint8_t)(v&0xFF),(uint8_t)((v>>8)&0xFF),
	movl	$1635017060, 544(%rsp)	 #, MEM <vector(4) unsigned char> [(unsigned char *)_1365]
 # pms.c:422:     fwrite(b,1,4,f);
	call	fwrite	 #
 # pms.c:436:     w32(fp,0x61746164u); w32(fp,(uint32_t)n*2);             
	leal	(%r15,%r15), %edx	 #, _1324
 # pms.c:436:     w32(fp,0x61746164u); w32(fp,(uint32_t)n*2);             
	movq	%rbx, %rcx	 # fp,
	call	w32	 #
	movss	.LC43(%rip), %xmm7	 #, tmp4617
 # pms.c:439:         int16_t iv = (int16_t)(v * 32767.0f);
	movss	.LC226(%rip), %xmm6	 #, tmp4618
 # pms.c:437:     for (int i=0;i<n;i++){
	jmp	.L1004	 #
.L1006:
 # pms.c:438:         float v = clampf(s[i],-1.f,1.f);
	movss	(%rsi,%rbp,4), %xmm1	 # MEM[(const float *)buf_615 + ivtmp.655_4203 * 4], _1329
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC99(%rip), %xmm0	 #, _1332
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _1329, _1332
	ja	.L1005	 #,
	movaps	%xmm7, %xmm0	 # tmp4617, tmp4335
	movaps	%xmm7, %xmm2	 # tmp4617, tmp4336
	cmpltss	%xmm1, %xmm0	 #, _1329, tmp4335
	andps	%xmm0, %xmm2	 # tmp4335, tmp4336
	andnps	%xmm1, %xmm0	 # _1329, tmp4337
	orps	%xmm2, %xmm0	 # tmp4336, _1332
.L1005:
 # pms.c:439:         int16_t iv = (int16_t)(v * 32767.0f);
	mulss	%xmm6, %xmm0	 # tmp4618, _1333
 # pms.c:441:         fwrite(b,1,2,fp);
	movq	%rbx, %r9	 # fp,
	movl	$2, %r8d	 #,
	movl	$1, %edx	 #,
	addq	$1, %rbp	 #, ivtmp.655
	leaq	544(%rsp), %rcx	 #,
 # pms.c:439:         int16_t iv = (int16_t)(v * 32767.0f);
	cvttss2sil	%xmm0, %eax	 # _1333, tmp4341
 # pms.c:440:         uint8_t b[2]={(uint8_t)(iv&0xFF),(uint8_t)((iv>>8)&0xFF)};
	movw	%ax, 544(%rsp)	 # tmp4341, MEM <vector(2) unsigned char> [(unsigned char *)_1365]
 # pms.c:441:         fwrite(b,1,2,fp);
	call	fwrite	 #
.L1004:
 # pms.c:437:     for (int i=0;i<n;i++){
	cmpl	%ebp, %r12d	 # ivtmp.655, _613
	jg	.L1006	 #,
	jmp	.L1678	 #
.L1727:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3911
	jmp	.L740	 #
.L1114:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L964	 #
.L1749:
	pxor	%xmm3, %xmm3	 # _3288
	jmp	.L928	 #
.L1075:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L692	 #
.L1709:
 # pms.c:1426:         if (phoneme_parse(st.input_filename, &st.phon) < 0) return 1;
	leaq	1272(%rsp), %rdx	 #, tmp2704
	leaq	1824(%rsp), %rcx	 #, tmp2706
	call	phoneme_parse	 #
 # pms.c:1426:         if (phoneme_parse(st.input_filename, &st.phon) < 0) return 1;
	addl	$1, %eax	 #, _18
	je	.L330	 #,
 # pms.c:1427:         if (st.phon.sample_rate != 22050) st.sample_rate = st.phon.sample_rate;
	movl	1284(%rsp), %eax	 # st.phon.sample_rate, _19
 # pms.c:1427:         if (st.phon.sample_rate != 22050) st.sample_rate = st.phon.sample_rate;
	cmpl	$22050, %eax	 #, _19
	je	.L497	 #,
 # pms.c:1427:         if (st.phon.sample_rate != 22050) st.sample_rate = st.phon.sample_rate;
	movl	%eax, 812(%rsp)	 # _19, st.sample_rate
.L497:
 # pms.c:1428:         if (st.phon.filter_mode != FILTER_CASCADE) st.filter_mode = st.phon.filter_mode;
	movl	1288(%rsp), %eax	 # st.phon.filter_mode, _20
 # pms.c:1428:         if (st.phon.filter_mode != FILTER_CASCADE) st.filter_mode = st.phon.filter_mode;
	testl	%eax, %eax	 # _20
	je	.L494	 #,
 # pms.c:1428:         if (st.phon.filter_mode != FILTER_CASCADE) st.filter_mode = st.phon.filter_mode;
	movl	%eax, 804(%rsp)	 # _20, st.filter_mode
	jmp	.L494	 #
.L1035:
 # pms.c:1323:         if (st->voice_type == VOICE_WHISPER)   vp = &g_preset_whisper;
	leaq	g_preset_whisper(%rip), %rax	 #, vp
	jmp	.L435	 #
.L1765:
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm4	 # A_1042->frication_amp, fr_amp
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm12	 # A_1042->voicing_amp, v_amp
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm13	 # A_1042->aspiration_amp, a_amp
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_1042->f0, f0
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm14	 # A_1042->gain_mult, gain_mult
	jmp	.L790	 #
.L1086:
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
 # pms.c:894:         float gain_mult = 1.0f;
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
 # pms.c:892:         float a_amp     = st->aspiration_amp;
	movss	144(%rsp), %xmm13	 # %sfp, a_amp
 # pms.c:891:         float v_amp     = st->voicing_amp;
	movss	136(%rsp), %xmm12	 # %sfp, v_amp
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
	jmp	.L782	 #
.L1051:
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
 # pms.c:894:         float gain_mult = 1.0f;
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
 # pms.c:892:         float a_amp     = st->aspiration_amp;
	movss	144(%rsp), %xmm12	 # %sfp, a_amp
 # pms.c:891:         float v_amp     = st->voicing_amp;
	movss	136(%rsp), %xmm13	 # %sfp, v_amp
 # pms.c:893:         float fr_amp    = st->frication_amp;
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
	jmp	.L563	 #
.L1041:
 # pms.c:1349:     printf("Voice     : %s\n", st->voice_type==VOICE_NATURAL?"natural":
	leaq	.LC90(%rip), %rdx	 #, iftmp.31_554
	jmp	.L502	 #
.L1040:
 # pms.c:1348:     printf("Filters   : %s\n", st->filter_mode==FILTER_CASCADE?"cascade":"parallel");
	leaq	.LC49(%rip), %rdx	 #, iftmp.30_552
	jmp	.L501	 #
.L1728:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm3, %xmm3	 # _3935
	jmp	.L745	 #
.L1076:
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L695	 #
.L1115:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L967	 #
.L1753:
	movss	112(%rsp), %xmm0	 # %sfp, _2321
	movd	%esi, %xmm3	 # _2322, _2322
.L804:
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	92(%r9), %xmm4	 # A_2444->frication_amp, fr_amp
 # pms.c:614:     *voicing    = interp(A->voicing_amp,    B->voicing_amp,    t0,t1,t_ms);
	movss	84(%r9), %xmm12	 # A_2444->voicing_amp, v_amp
 # pms.c:615:     *aspiration = interp(A->aspiration_amp, B->aspiration_amp, t0,t1,t_ms);
	movss	88(%r9), %xmm13	 # A_2444->aspiration_amp, a_amp
 # pms.c:616:     *frication  = interp(A->frication_amp,  B->frication_amp,  t0,t1,t_ms);
	movss	%xmm4, 112(%rsp)	 # fr_amp, %sfp
 # pms.c:617:     *f0         = interp(A->f0,             B->f0,             t0,t1,t_ms);
	movss	96(%r9), %xmm1	 # A_2444->f0, f0
 # pms.c:618:     *gain_mult  = interp(A->gain_mult,      B->gain_mult,      t0,t1,t_ms);
	movss	100(%r9), %xmm14	 # A_2444->gain_mult, gain_mult
	jmp	.L1018	 #
.L1768:
	movss	112(%rsp), %xmm2	 # %sfp, t_ms
	movss	132(%rsp), %xmm0	 # %sfp, _2321
	jmp	.L804	 #
.L1065:
 # pms.c:1008:         for(int k=0;k<FORMANTS;k++){
	xorl	%eax, %eax	 # k
	jmp	.L645	 #
.L1100:
	xorl	%eax, %eax	 # k
	jmp	.L852	 #
.L1734:
	movslq	1256(%rsp), %rcx	 # MEM[(int *)&st + 456B],
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%ecx, %ecx	 # _129
	jne	.L1663	 #,
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
	movss	%xmm6, 120(%rsp)	 # tmp4406, %sfp
	movss	144(%rsp), %xmm12	 # %sfp, a_amp
	movss	136(%rsp), %xmm13	 # %sfp, v_amp
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
.L1667:
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	4(%r15), %xmm1	 # MEM[(const struct ContourPt *)pretmp_2544].f0_hz, f0
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	jmp	.L563	 #
.L1758:
	movl	1256(%rsp), %eax	 # MEM[(int *)&st + 456B], _2279
 # pms.c:590:     if (sd->nframes == 0) return;
	testl	%eax, %eax	 # _2279
	jne	.L1670	 #,
	movss	140(%rsp), %xmm4	 # %sfp, pretmp_2540
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
	movss	136(%rsp), %xmm12	 # %sfp, v_amp
	movss	144(%rsp), %xmm13	 # %sfp, a_amp
	movss	%xmm4, 112(%rsp)	 # pretmp_2540, %sfp
.L1672:
 # pms.c:338:     if (t_ms <= pts[0].time_ms)   return pts[0].f0_hz;
	movss	4(%r15), %xmm1	 # MEM[(const struct ContourPt *)pretmp_2544].f0_hz, f0
	jmp	.L782	 #
.L1760:
	movq	48(%rsp), %r13	 # %sfp, phon_t0
	movq	56(%rsp), %rsi	 # %sfp, buf
	jmp	.L520	 #
.L1077:
 # pms.c:98:     if (f->b0 == 0.0f) return 0.0f;
	pxor	%xmm1, %xmm1	 # excitation
	jmp	.L698	 #
.L1116:
	pxor	%xmm1, %xmm1	 # samp
	jmp	.L970	 #
.L1729:
	pxor	%xmm3, %xmm3	 # _3959
	jmp	.L750	 #
.L1661:
	leaq	8100(%rbx), %rsi	 #, ivtmp.866
	jmp	.L534	 #
.L1712:
 # pms.c:828:     if (!buf){ fprintf(stderr,"Error: out of memory (%d samples)\n",N); return -1; }
	movq	__imp___acrt_iob_func(%rip), %rbx	 #, tmp2797
	movl	$2, %ecx	 #,
	call	*%rbx	 # tmp2797
 # pms.c:828:     if (!buf){ fprintf(stderr,"Error: out of memory (%d samples)\n",N); return -1; }
	movl	72(%rsp), %r8d	 # %sfp,
	leaq	.LC183(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _616,
	call	fprintf	 #
 # pms.c:1439:         fprintf(stderr,"Error: synthesis failed\n"); return 1;
	movl	$2, %ecx	 #,
	call	*%rbx	 # tmp2797
 # pms.c:1439:         fprintf(stderr,"Error: synthesis failed\n"); return 1;
	movl	$24, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	.LC184(%rip), %rcx	 #,
 # pms.c:1439:         fprintf(stderr,"Error: synthesis failed\n"); return 1;
	movq	%rax, %r9	 #, _27
 # pms.c:1439:         fprintf(stderr,"Error: synthesis failed\n"); return 1;
	call	fwrite	 #
 # pms.c:1439:         fprintf(stderr,"Error: synthesis failed\n"); return 1;
	jmp	.L330	 #
.L822:
 # pms.c:939:                 if (ph->plosive_type > 0) {
	testl	%eax, %eax	 # pretmp_1186
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm3, %xmm3	 # _2480
 # pms.c:939:                 if (ph->plosive_type > 0) {
	jle	.L1671	 #,
.L824:
 # pms.c:942:                         if (ph->plosive_type == 2) {
	cmpl	$2, %eax	 #, pretmp_1186
	movl	$0x00000000, 112(%rsp)	 #, %sfp
	pxor	%xmm13, %xmm13	 # a_amp
	je	.L1092	 #,
 # pms.c:974:                     is_burst = 0;
	xorl	%r11d, %r11d	 #
 # pms.c:947:                             v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f;
	movaps	%xmm13, %xmm12	 #, v_amp
 # pms.c:949:                         f0 = (ph->plosive_type == 2) ? phon_pitch(ph, t_within) : 0.0f;
	movaps	%xmm13, %xmm1	 # tmp48, f0
 # pms.c:974:                     is_burst = 0;
	movl	%r11d, 156(%rsp)	 #, %sfp
	jmp	.L823	 #
.L600:
 # pms.c:939:                 if (ph->plosive_type > 0) {
	testl	%eax, %eax	 # pretmp_2784
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm3, %xmm3	 # _766
 # pms.c:939:                 if (ph->plosive_type > 0) {
	jle	.L1664	 #,
.L1015:
 # pms.c:942:                         if (ph->plosive_type == 2) {
	cmpl	$2, %eax	 #, pretmp_2784
	movl	$0x00000000, 112(%rsp)	 #, %sfp
	pxor	%xmm12, %xmm12	 # a_amp
	je	.L1059	 #,
 # pms.c:974:                     is_burst = 0;
	xorl	%eax, %eax	 #
 # pms.c:947:                             v_amp = 0.0f; a_amp = 0.0f; fr_amp = 0.0f;
	movaps	%xmm12, %xmm13	 #, v_amp
 # pms.c:949:                         f0 = (ph->plosive_type == 2) ? phon_pitch(ph, t_within) : 0.0f;
	movaps	%xmm12, %xmm1	 #, f0
 # pms.c:974:                     is_burst = 0;
	movl	%eax, 156(%rsp)	 #, %sfp
	jmp	.L601	 #
.L1043:
 # pms.c:840:     for (int k=0;k<FORMANTS;k++) formant_reset(&st->formants[k]);
	xorl	%eax, %eax	 # k
	jmp	.L521	 #
.L360:
 # pms.c:1228:         if (!strcmp(a,"--voice")){
	leaq	.LC132(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1228:         if (!strcmp(a,"--voice")){
	testl	%eax, %eax	 # _263
	jne	.L363	 #,
 # pms.c:1229:             NEED_VAL(a); const char *vt=argv[++i];
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1229:             NEED_VAL(a); const char *vt=argv[++i];
	movq	8(%rdi,%r14,8), %r12	 # *_268, vt
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC90(%rip), %rdx	 #,
	movq	__imp__stricmp(%rip), %r13	 #, tmp2402
	movq	%r12, %rcx	 # vt,
	call	*%r13	 # tmp2402
 # pms.c:1230:             if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
	testl	%eax, %eax	 # _270
	jne	.L365	 #,
 # pms.c:1230:             if(!strcasecmp(vt,"natural"))    st->voice_type=VOICE_NATURAL;
	xorl	%eax, %eax	 #
	movl	%eax, 808(%rsp)	 #, st.voice_type
	jmp	.L332	 #
.L357:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC49(%rip), %rdx	 #,
	movq	%r12, %rcx	 # m,
	call	*%r13	 # tmp2380
 # pms.c:1220:             else if(!strcasecmp(m,"parallel")) st->filter_mode=FILTER_PARALLEL;
	testl	%eax, %eax	 # _249
	jne	.L359	 #,
 # pms.c:1220:             else if(!strcasecmp(m,"parallel")) st->filter_mode=FILTER_PARALLEL;
	movl	$1, 804(%rsp)	 #, st.filter_mode
	jmp	.L332	 #
.L1059:
 # pms.c:943:                             v_amp  = 0.18f;
	movss	.LC97(%rip), %xmm13	 #, v_amp
.L1664:
 # pms.c:974:                     is_burst = 0;
	xorl	%eax, %eax	 #
	movl	%eax, 156(%rsp)	 #, %sfp
	jmp	.L601	 #
.L1093:
 # pms.c:894:         float gain_mult = 1.0f;
	movaps	%xmm6, %xmm14	 # tmp4406, gain_mult
	jmp	.L782	 #
.L1092:
 # pms.c:943:                             v_amp  = 0.18f;
	movss	.LC97(%rip), %xmm12	 #, v_amp
.L1671:
 # pms.c:974:                     is_burst = 0;
	xorl	%r10d, %r10d	 #
	movl	%r10d, 156(%rsp)	 #, %sfp
	jmp	.L823	 #
.L1061:
 # pms.c:988:                 for(int k=0;k<FORMANTS;k++){freq[k]=700.f;bw[k]=110.f;fgain[k]=1.f;}
	xorl	%eax, %eax	 # _1367
	jmp	.L613	 #
.L1096:
	xorl	%eax, %eax	 # k
	jmp	.L834	 #
.L1037:
 # pms.c:1141:     for(int k=0;k<FORMANTS;k++){
	xorl	%ecx, %ecx	 #
 # pms.c:1141:     for(int k=0;k<FORMANTS;k++){
	xorl	%edx, %edx	 # tmp.406
	jmp	.L439	 #
.L1731:
 # pms.c:598:                 lo = i; hi = i+1; break;
	leal	1(%r9), %eax	 #, hi
 # pms.c:598:                 lo = i; hi = i+1; break;
	jmp	.L565	 #
.L1751:
 # pms.c:598:                 lo = i; hi = i+1; break;
	leal	1(%rax), %ecx	 #, hi
	jmp	.L784	 #
.L363:
 # pms.c:1236:         if (!strcmp(a,"--voicing-amp")){
	leaq	.LC133(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1236:         if (!strcmp(a,"--voicing-amp")){
	testl	%eax, %eax	 # _274
	jne	.L368	 #,
 # pms.c:1237:             NEED_VAL(a); st->voicing_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1237:             NEED_VAL(a); st->voicing_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_279, *_279
	call	atof	 #
 # pms.c:1237:             NEED_VAL(a); st->voicing_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	pxor	%xmm1, %xmm1	 # _282
	cvtsd2ss	%xmm0, %xmm1	 # _281, _282
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _285
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _282, _285
	ja	.L370	 #,
	movss	.LC43(%rip), %xmm2	 #, tmp2416
	movaps	%xmm2, %xmm0	 # tmp2416, tmp2418
	cmpltss	%xmm1, %xmm0	 #, _282, tmp2418
	andps	%xmm0, %xmm2	 # tmp2418, tmp2419
	andnps	%xmm1, %xmm0	 # _282, tmp2420
	orps	%xmm2, %xmm0	 # tmp2419, _285
.L370:
 # pms.c:1237:             NEED_VAL(a); st->voicing_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movss	%xmm0, 1188(%rsp)	 # _285, st.voicing_amp
 # pms.c:1238:             explicit_voicing=1; continue;
	jmp	.L332	 #
.L1642:
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	movaps	%xmm3, %xmm5	 # _2480, _2479
 # pms.c:961:                         if (ph->plosive_type == 1) {
	subl	$1, %eax	 #, pretmp_1186
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	subss	%xmm4, %xmm5	 # tmp3763, _2479
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	movaps	%xmm5, %xmm4	 # _2479, _2479
	divss	.LC200(%rip), %xmm4	 #, _2479
 # pms.c:961:                         if (ph->plosive_type == 1) {
	je	.L1770	 #,
 # pms.c:966:                             v_amp  = ph->voicing_amp * rp;
	mulss	%xmm4, %xmm0	 # rp, pretmp_1197
 # pms.c:968:                             fr_amp = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
 # pms.c:966:                             v_amp  = ph->voicing_amp * rp;
	movaps	%xmm0, %xmm12	 # pretmp_1197, v_amp
 # pms.c:967:                             a_amp  = ph->aspiration_amp * (1.0f - rp);
	movaps	%xmm6, %xmm0	 # tmp4406, _2476
	subss	%xmm4, %xmm0	 # rp, _2476
 # pms.c:967:                             a_amp  = ph->aspiration_amp * (1.0f - rp);
	mulss	%xmm0, %xmm13	 # _2476, a_amp
	jmp	.L823	 #
.L1627:
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	movaps	%xmm3, %xmm4	 # _766, _781
 # pms.c:961:                         if (ph->plosive_type == 1) {
	subl	$1, %eax	 #, pretmp_2784
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	subss	%xmm5, %xmm4	 # tmp3074, _781
 # pms.c:960:                         float rp = (pct - 0.55f) / 0.45f;                                 
	divss	.LC200(%rip), %xmm4	 #, rp
 # pms.c:961:                         if (ph->plosive_type == 1) {
	je	.L1771	 #,
 # pms.c:966:                             v_amp  = ph->voicing_amp * rp;
	mulss	%xmm4, %xmm0	 # rp, pretmp_2780
 # pms.c:968:                             fr_amp = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
 # pms.c:966:                             v_amp  = ph->voicing_amp * rp;
	movaps	%xmm0, %xmm13	 # pretmp_2780, v_amp
 # pms.c:967:                             a_amp  = ph->aspiration_amp * (1.0f - rp);
	movaps	%xmm6, %xmm0	 # tmp4406, _785
	subss	%xmm4, %xmm0	 # rp, _785
 # pms.c:967:                             a_amp  = ph->aspiration_amp * (1.0f - rp);
	mulss	%xmm0, %xmm12	 # _785, a_amp
	jmp	.L601	 #
.L365:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC91(%rip), %rdx	 #,
	movq	%r12, %rcx	 # vt,
	call	*%r13	 # tmp2402
 # pms.c:1231:             else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
	testl	%eax, %eax	 # _271
	jne	.L366	 #,
 # pms.c:1231:             else if(!strcasecmp(vt,"whisper"))   st->voice_type=VOICE_WHISPER;
	movl	$1, 808(%rsp)	 #, st.voice_type
	jmp	.L332	 #
.L368:
 # pms.c:1240:         if (!strcmp(a,"--aspiration-amp")){
	leaq	.LC134(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1240:         if (!strcmp(a,"--aspiration-amp")){
	testl	%eax, %eax	 # _286
	jne	.L371	 #,
 # pms.c:1241:             NEED_VAL(a); st->aspiration_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1241:             NEED_VAL(a); st->aspiration_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_291, *_291
	call	atof	 #
 # pms.c:1241:             NEED_VAL(a); st->aspiration_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	pxor	%xmm1, %xmm1	 # _294
	cvtsd2ss	%xmm0, %xmm1	 # _293, _294
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _297
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _294, _297
	ja	.L373	 #,
	movss	.LC43(%rip), %xmm2	 #, tmp2428
	movaps	%xmm2, %xmm0	 # tmp2428, tmp2430
	cmpltss	%xmm1, %xmm0	 #, _294, tmp2430
	andps	%xmm0, %xmm2	 # tmp2430, tmp2431
	andnps	%xmm1, %xmm0	 # _294, tmp2432
	orps	%xmm2, %xmm0	 # tmp2431, _297
.L373:
 # pms.c:1241:             NEED_VAL(a); st->aspiration_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movss	%xmm0, 1192(%rsp)	 # _297, st.aspiration_amp
 # pms.c:1242:             explicit_asp=1; continue;
	jmp	.L332	 #
.L1770:
 # pms.c:963:                             a_amp  = ph->aspiration_amp * rp;
	mulss	%xmm4, %xmm13	 # rp, a_amp
 # pms.c:964:                             fr_amp = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
 # pms.c:962:                             v_amp  = 0.0f;
	pxor	%xmm12, %xmm12	 # v_amp
	jmp	.L823	 #
.L1771:
 # pms.c:963:                             a_amp  = ph->aspiration_amp * rp;
	mulss	%xmm4, %xmm12	 # rp, a_amp
 # pms.c:964:                             fr_amp = 0.0f;
	movl	$0x00000000, 112(%rsp)	 #, %sfp
 # pms.c:962:                             v_amp  = 0.0f;
	pxor	%xmm13, %xmm13	 # v_amp
	jmp	.L601	 #
.L371:
 # pms.c:1244:         if (!strcmp(a,"--frication-amp")){
	leaq	.LC135(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1244:         if (!strcmp(a,"--frication-amp")){
	testl	%eax, %eax	 # _298
	jne	.L374	 #,
 # pms.c:1245:             NEED_VAL(a); st->frication_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1245:             NEED_VAL(a); st->frication_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_303, *_303
	call	atof	 #
 # pms.c:1245:             NEED_VAL(a); st->frication_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	pxor	%xmm1, %xmm1	 # _306
	cvtsd2ss	%xmm0, %xmm1	 # _305, _306
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _309
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _306, _309
	ja	.L376	 #,
	movss	.LC43(%rip), %xmm2	 #, tmp2440
	movaps	%xmm2, %xmm0	 # tmp2440, tmp2442
	cmpltss	%xmm1, %xmm0	 #, _306, tmp2442
	andps	%xmm0, %xmm2	 # tmp2442, tmp2443
	andnps	%xmm1, %xmm0	 # _306, tmp2444
	orps	%xmm2, %xmm0	 # tmp2443, _309
.L376:
 # pms.c:1245:             NEED_VAL(a); st->frication_amp=clampf((float)atof(argv[++i]),0.f,1.f);
	movss	%xmm0, 1196(%rsp)	 # _309, st.frication_amp
 # pms.c:1246:             explicit_fric=1; continue;
	jmp	.L332	 #
.L366:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC92(%rip), %rdx	 #,
	movq	%r12, %rcx	 # vt,
	call	*%r13	 # tmp2402
 # pms.c:1232:             else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
	testl	%eax, %eax	 # _272
	jne	.L367	 #,
 # pms.c:1232:             else if(!strcasecmp(vt,"impulsive")) st->voice_type=VOICE_IMPULSIVE;
	movl	$2, 808(%rsp)	 #, st.voice_type
	jmp	.L332	 #
.L374:
 # pms.c:1249:         if (!strcmp(a,"--vibrato-depth")){
	leaq	.LC136(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1249:         if (!strcmp(a,"--vibrato-depth")){
	testl	%eax, %eax	 # _310
	jne	.L377	 #,
 # pms.c:1250:             NEED_VAL(a); st->vibrato_depth_hz=clampf((float)atof(argv[++i]),0.f,10.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1250:             NEED_VAL(a); st->vibrato_depth_hz=clampf((float)atof(argv[++i]),0.f,10.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_315, *_315
	call	atof	 #
 # pms.c:1250:             NEED_VAL(a); st->vibrato_depth_hz=clampf((float)atof(argv[++i]),0.f,10.f);
	pxor	%xmm1, %xmm1	 # _318
	cvtsd2ss	%xmm0, %xmm1	 # _317, _318
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _321
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _318, _321
	ja	.L379	 #,
	movss	.LC137(%rip), %xmm2	 #, tmp2452
	movaps	%xmm2, %xmm0	 # tmp2452, tmp2454
	cmpltss	%xmm1, %xmm0	 #, _318, tmp2454
	andps	%xmm0, %xmm2	 # tmp2454, tmp2455
	andnps	%xmm1, %xmm0	 # _318, tmp2456
	orps	%xmm2, %xmm0	 # tmp2455, _321
.L379:
 # pms.c:1250:             NEED_VAL(a); st->vibrato_depth_hz=clampf((float)atof(argv[++i]),0.f,10.f);
	movss	%xmm0, 1200(%rsp)	 # _321, st.vibrato_depth_hz
 # pms.c:1251:             explicit_vibdepth=1; continue;
	jmp	.L332	 #
.L377:
 # pms.c:1253:         if (!strcmp(a,"--vibrato-rate")){
	leaq	.LC138(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1253:         if (!strcmp(a,"--vibrato-rate")){
	testl	%eax, %eax	 # _322
	jne	.L380	 #,
 # pms.c:1254:             NEED_VAL(a); st->vibrato_rate_hz=clampf((float)atof(argv[++i]),0.5f,20.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1254:             NEED_VAL(a); st->vibrato_rate_hz=clampf((float)atof(argv[++i]),0.5f,20.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_327, *_327
	call	atof	 #
 # pms.c:1254:             NEED_VAL(a); st->vibrato_rate_hz=clampf((float)atof(argv[++i]),0.5f,20.f);
	pxor	%xmm1, %xmm1	 # _330
	cvtsd2ss	%xmm0, %xmm1	 # _329, _330
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	movss	.LC85(%rip), %xmm0	 #, _333
	comiss	%xmm1, %xmm0	 # _330, _333
	ja	.L382	 #,
	movss	.LC139(%rip), %xmm2	 #, tmp2464
	movaps	%xmm2, %xmm0	 # tmp2464, tmp2466
	cmpltss	%xmm1, %xmm0	 #, _330, tmp2466
	andps	%xmm0, %xmm2	 # tmp2466, tmp2467
	andnps	%xmm1, %xmm0	 # _330, tmp2468
	orps	%xmm2, %xmm0	 # tmp2467, _333
.L382:
 # pms.c:1254:             NEED_VAL(a); st->vibrato_rate_hz=clampf((float)atof(argv[++i]),0.5f,20.f);
	movss	%xmm0, 1204(%rsp)	 # _333, st.vibrato_rate_hz
 # pms.c:1255:             explicit_vibrate=1; continue;
	jmp	.L332	 #
.L1676:
	movq	__imp___acrt_iob_func(%rip), %rbx	 #, tmp4432
.L1003:
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	movl	$2, %ecx	 #,
	call	*%rbx	 # tmp4432
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	movl	$30, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	.LC233(%rip), %rcx	 #,
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	movq	%rax, %r9	 #, _46
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	call	fwrite	 #
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	movq	%rsi, %rcx	 # buf,
	call	free	 #
 # pms.c:1451:     if (ret < 0){ fprintf(stderr,"Error: could not write output\n"); free(samples); return 1; }
	jmp	.L330	 #
.L343:
 # pms.c:1202:             else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1202:             else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
	leaq	.LC123(%rip), %rdx	 #,
	movq	%rbp, %r8	 # vt,
	movq	%rax, %rcx	 # _206,
	call	fprintf	 #
	jmp	.L330	 #
.L367:
 # pms.c:1233:             else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1233:             else{fprintf(stderr,"Error: unknown voice type '%s'\n",vt);return -1;}
	leaq	.LC123(%rip), %rdx	 #,
	movq	%r12, %r8	 # vt,
	movq	%rax, %rcx	 # _273,
	call	fprintf	 #
	jmp	.L330	 #
.L380:
 # pms.c:1257:         if (!strcmp(a,"--jitter")){
	leaq	.LC140(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1257:         if (!strcmp(a,"--jitter")){
	testl	%eax, %eax	 # _334
	jne	.L383	 #,
 # pms.c:1258:             NEED_VAL(a); st->jitter_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1258:             NEED_VAL(a); st->jitter_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_339, *_339
	call	atof	 #
 # pms.c:1258:             NEED_VAL(a); st->jitter_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	pxor	%xmm1, %xmm1	 # _342
	cvtsd2ss	%xmm0, %xmm1	 # _341, _342
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _345
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _342, _345
	ja	.L385	 #,
	movss	.LC137(%rip), %xmm2	 #, tmp2476
	movaps	%xmm2, %xmm0	 # tmp2476, tmp2478
	cmpltss	%xmm1, %xmm0	 #, _342, tmp2478
	andps	%xmm0, %xmm2	 # tmp2478, tmp2479
	andnps	%xmm1, %xmm0	 # _342, tmp2480
	orps	%xmm2, %xmm0	 # tmp2479, _345
.L385:
 # pms.c:1258:             NEED_VAL(a); st->jitter_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	movss	%xmm0, 1208(%rsp)	 # _345, st.jitter_percent
 # pms.c:1259:             explicit_jitter=1; continue;
	jmp	.L332	 #
.L383:
 # pms.c:1261:         if (!strcmp(a,"--shimmer")){
	leaq	.LC141(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1261:         if (!strcmp(a,"--shimmer")){
	testl	%eax, %eax	 # _346
	jne	.L386	 #,
 # pms.c:1262:             NEED_VAL(a); st->shimmer_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1262:             NEED_VAL(a); st->shimmer_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	movq	8(%rdi,%r14,8), %rcx	 # *_351, *_351
	call	atof	 #
 # pms.c:1262:             NEED_VAL(a); st->shimmer_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	pxor	%xmm1, %xmm1	 # _354
	cvtsd2ss	%xmm0, %xmm1	 # _353, _354
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	pxor	%xmm0, %xmm0	 # _357
 # pms.c:158:     { return v < lo ? lo : v > hi ? hi : v; }
	comiss	%xmm1, %xmm0	 # _354, _357
	ja	.L388	 #,
	movss	.LC137(%rip), %xmm2	 #, tmp2488
	movaps	%xmm2, %xmm0	 # tmp2488, tmp2490
	cmpltss	%xmm1, %xmm0	 #, _354, tmp2490
	andps	%xmm0, %xmm2	 # tmp2490, tmp2491
	andnps	%xmm1, %xmm0	 # _354, tmp2492
	orps	%xmm2, %xmm0	 # tmp2491, _357
.L388:
 # pms.c:1262:             NEED_VAL(a); st->shimmer_percent=clampf((float)atof(argv[++i]),0.f,10.f);
	movss	%xmm0, 1212(%rsp)	 # _357, st.shimmer_percent
 # pms.c:1263:             explicit_shimmer=1; continue;
	jmp	.L332	 #
.L386:
 # pms.c:1265:         if (!strcmp(a,"--pitch-contour")){
	leaq	.LC142(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1265:         if (!strcmp(a,"--pitch-contour")){
	testl	%eax, %eax	 # _358
	jne	.L389	 #,
 # pms.c:1266:             NEED_VAL(a);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1267:             if(contour_parse(argv[++i],&st->pitch_contour,&st->n_contour)<0) return -1;
	movq	8(%rdi,%r14,8), %r13	 # *_365, _366
 # pms.c:747:     FILE *fp = fopen(path,"r");
	leaq	.LC44(%rip), %rdx	 #,
	movq	%r13, %rcx	 # _366,
	call	fopen	 #
 # pms.c:748:     if (!fp){ fprintf(stderr,"Error: cannot open contour '%s'\n",path); return -1; }
	testq	%rax, %rax	 # fp
 # pms.c:747:     FILE *fp = fopen(path,"r");
	movq	%rax, %r12	 #, fp
 # pms.c:748:     if (!fp){ fprintf(stderr,"Error: cannot open contour '%s'\n",path); return -1; }
	je	.L1772	 #,
 # pms.c:749:     *out = (ContourPt*)malloc(MAX_CONTOUR_PTS * sizeof(ContourPt));
	movl	$65536, %ecx	 #,
	call	malloc	 #
 # pms.c:749:     *out = (ContourPt*)malloc(MAX_CONTOUR_PTS * sizeof(ContourPt));
	movq	%rax, 1232(%rsp)	 # tmp4722, MEM[(struct ContourPt * *)&st + 432B]
 # pms.c:750:     *cnt = 0;
	xorl	%eax, %eax	 #
	movl	%eax, 1240(%rsp)	 #, MEM[(int *)&st + 440B]
.L392:
 # pms.c:752:     while (fgets(line,sizeof(line),fp) && *cnt < MAX_CONTOUR_PTS) {
	leaq	544(%rsp), %rcx	 #,
	movq	%r12, %r8	 # fp,
	movl	$256, %edx	 #,
	call	fgets	 #
 # pms.c:752:     while (fgets(line,sizeof(line),fp) && *cnt < MAX_CONTOUR_PTS) {
	testq	%rax, %rax	 # _533
	je	.L397	 #,
 # pms.c:752:     while (fgets(line,sizeof(line),fp) && *cnt < MAX_CONTOUR_PTS) {
	cmpl	$8191, 1240(%rsp)	 #, MEM[(int *)&st + 440B]
	jg	.L397	 #,
 # pms.c:753:         char *p=line; while(*p==' '||*p=='\t')p++;
	leaq	544(%rsp), %rcx	 #, p
	jmp	.L398	 #
.L393:
 # pms.c:753:         char *p=line; while(*p==' '||*p=='\t')p++;
	addq	$1, %rcx	 #, p
.L398:
 # pms.c:753:         char *p=line; while(*p==' '||*p=='\t')p++;
	movzbl	(%rcx), %eax	 # MEM[(char *)p_515], _517
 # pms.c:753:         char *p=line; while(*p==' '||*p=='\t')p++;
	cmpb	$32, %al	 #, _517
	je	.L393	 #,
	cmpb	$9, %al	 #, _517
	je	.L393	 #,
	subl	$10, %eax	 #, _2714
	cmpb	$25, %al	 #, _2714
	ja	.L394	 #,
	movl	$33554441, %edx	 #, tmp2507
	btq	%rax, %rdx	 # _2714, tmp2507
	jc	.L392	 #,
.L394:
 # pms.c:756:         if (sscanf(p,"%f %f",&t,&f)==2){
	leaq	348(%rsp), %r9	 #,
	leaq	344(%rsp), %r8	 #,
	leaq	.LC144(%rip), %rdx	 #,
	call	sscanf	 #
 # pms.c:756:         if (sscanf(p,"%f %f",&t,&f)==2){
	cmpl	$2, %eax	 #, _524
	jne	.L392	 #,
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	movslq	1240(%rsp), %rcx	 # MEM[(int *)&st + 440B],
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	movq	1232(%rsp), %rdx	 # MEM[(struct ContourPt * *)&st + 432B], MEM[(struct ContourPt * *)&st + 432B]
	movss	348(%rsp), %xmm1	 # f, f
	movss	344(%rsp), %xmm0	 # t, _3355
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	movq	%rcx, %rax	 #,
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	addl	$1, %eax	 #, tmp2517
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	unpcklps	%xmm1, %xmm0	 # f, _3355
	movlps	%xmm0, (%rdx,%rcx,8)	 # _3355, MEM <vector(2) float> [(float *)_529]
 # pms.c:757:             (*out)[*cnt].time_ms=t; (*out)[*cnt].f0_hz=f; (*cnt)++;
	movl	%eax, 1240(%rsp)	 # tmp2517, MEM[(int *)&st + 440B]
	jmp	.L392	 #
.L1772:
 # pms.c:748:     if (!fp){ fprintf(stderr,"Error: cannot open contour '%s'\n",path); return -1; }
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:748:     if (!fp){ fprintf(stderr,"Error: cannot open contour '%s'\n",path); return -1; }
	leaq	.LC143(%rip), %rdx	 #,
	movq	%r13, %r8	 # _366,
	movq	%rax, %rcx	 # _513,
	call	fprintf	 #
	jmp	.L330	 #
.L389:
 # pms.c:1273:             if ((fi=match_fi_arg(a,"--f"))  > 0){
	leaq	.LC145(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	match_fi_arg	 #
 # pms.c:1273:             if ((fi=match_fi_arg(a,"--f"))  > 0){
	testl	%eax, %eax	 # fi
 # pms.c:1273:             if ((fi=match_fi_arg(a,"--f"))  > 0){
	movl	%eax, %r15d	 #, fi
 # pms.c:1273:             if ((fi=match_fi_arg(a,"--f"))  > 0){
	je	.L399	 #,
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	movq	8(%rdi,%r14,8), %rcx	 # *_373, *_373
	call	atof	 #
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	leal	-1(%r15), %eax	 #, _376
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	cltq
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	cvtsd2ss	%xmm0, %xmm0	 # _375, tmp2527
 # pms.c:1275:                 explicit_formant[fi-1]=1; continue;
	movl	$1, 448(%rsp,%rax,4)	 #, MEM[(int[10] *)_1363][_376]
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	movq	%rax, %rdx	 # _376, tmp2524
	salq	$5, %rdx	 #, tmp2524
 # pms.c:1274:                 NEED_VAL(a); st->formants[fi-1].freq=(float)atof(argv[++i]);
	movss	%xmm0, 828(%rsp,%rdx)	 # tmp2527, st.formants[_376].freq
 # pms.c:1275:                 explicit_formant[fi-1]=1; continue;
	jmp	.L332	 #
.L397:
 # pms.c:760:     fclose(fp); return 0;
	movq	%r12, %rcx	 # fp,
	call	fclose	 #
	jmp	.L332	 #
.L533:
 # pms.c:868:                     phon_sf[i][k] = st->phon.phonemes[i].target_freq[k];
	leaq	8100(%rbx), %rsi	 #, ivtmp.866
	leaq	(%r9,%rsi), %r13	 #, _2209
	jmp	.L1016	 #
.L359:
 # pms.c:1221:             else{fprintf(stderr,"Error: unknown synthesis mode '%s'\n",m);return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1221:             else{fprintf(stderr,"Error: unknown synthesis mode '%s'\n",m);return -1;}
	leaq	.LC130(%rip), %rdx	 #,
	movq	%r12, %r8	 # m,
	movq	%rax, %rcx	 # _250,
	call	fprintf	 #
	jmp	.L330	 #
.L1677:
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	call	*__imp__errno(%rip)	 #
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	movl	(%rax), %ecx	 #* _1341,
	call	strerror	 #
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	movq	__imp___acrt_iob_func(%rip), %rbx	 #, tmp4432
	movl	$2, %ecx	 #,
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	movq	%rax, %rbp	 #, _1343
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	call	*%rbx	 # tmp4432
 # pms.c:449:     if (!fp){ fprintf(stderr,"Error: cannot open '%s': %s\n",path,strerror(errno)); return -1; }
	leaq	1312(%rsp), %r8	 #,
	movq	%rbp, %r9	 # _1343,
	leaq	.LC217(%rip), %rdx	 #,
	movq	%rax, %rcx	 # _1344,
	call	fprintf	 #
	jmp	.L1003	 #
.L399:
 # pms.c:1277:             if ((fi=match_fi_arg(a,"--bw")) > 0){
	leaq	.LC146(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	match_fi_arg	 #
 # pms.c:1277:             if ((fi=match_fi_arg(a,"--bw")) > 0){
	testl	%eax, %eax	 # fi
 # pms.c:1277:             if ((fi=match_fi_arg(a,"--bw")) > 0){
	movl	%eax, %r15d	 #, fi
 # pms.c:1277:             if ((fi=match_fi_arg(a,"--bw")) > 0){
	je	.L401	 #,
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	movq	8(%rdi,%r14,8), %rcx	 # *_383, *_383
	call	atof	 #
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	leal	-1(%r15), %eax	 #, _386
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	cltq
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	cvtsd2ss	%xmm0, %xmm0	 # _385, tmp2537
 # pms.c:1279:                 explicit_bw[fi-1]=1; continue;
	movl	$1, 496(%rsp,%rax,4)	 #, MEM[(int[10] *)_1364][_386]
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	movq	%rax, %rdx	 # _386, tmp2534
	salq	$5, %rdx	 #, tmp2534
 # pms.c:1278:                 NEED_VAL(a); st->formants[fi-1].bw=(float)atof(argv[++i]);
	movss	%xmm0, 832(%rsp,%rdx)	 # tmp2537, st.formants[_386].bw
 # pms.c:1279:                 explicit_bw[fi-1]=1; continue;
	jmp	.L332	 #
.L401:
 # pms.c:1281:             if ((fi=match_fi_arg(a,"--gain")) > 0){
	leaq	.LC147(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	match_fi_arg	 #
 # pms.c:1281:             if ((fi=match_fi_arg(a,"--gain")) > 0){
	testl	%eax, %eax	 # fi
 # pms.c:1281:             if ((fi=match_fi_arg(a,"--gain")) > 0){
	movl	%eax, %r15d	 #, fi
 # pms.c:1281:             if ((fi=match_fi_arg(a,"--gain")) > 0){
	je	.L403	 #,
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	movq	8(%rdi,%r14,8), %rcx	 # *_393, *_393
	call	atof	 #
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	leal	-1(%r15), %eax	 #, _396
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	cltq
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	cvtsd2ss	%xmm0, %xmm0	 # _395, tmp2549
	movss	%xmm0, 1148(%rsp,%rax,4)	 # tmp2549, st.formant_gains[_396]
 # pms.c:1282:                 NEED_VAL(a); st->formant_gains[fi-1]=(float)atof(argv[++i]); continue;
	jmp	.L332	 #
.L403:
 # pms.c:1285:         if (!strcmp(a,"--bw6-10")){
	leaq	.LC148(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1285:         if (!strcmp(a,"--bw6-10")){
	testl	%eax, %eax	 # _398
	je	.L1773	 #,
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	leaq	.LC149(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	testl	%eax, %eax	 # _410
	jne	.L409	 #,
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	movq	8(%rdi,%r14,8), %rcx	 # *_415, *_415
	call	atof	 #
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	cvttsd2sil	%xmm0, %eax	 # _417, tmp2564
	movl	%eax, FORMANTS(%rip)	 # tmp2564, FORMANTS
 # pms.c:1291:         if (!strcmp(a,"--formants")){ NEED_VAL(a); FORMANTS=(int)atof(argv[++i]); continue; }
	jmp	.L332	 #
.L1773:
 # pms.c:1286:             NEED_VAL(a); float bw=(float)atof(argv[++i]);
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1286:             NEED_VAL(a); float bw=(float)atof(argv[++i]);
	movq	8(%rdi,%r14,8), %rcx	 # *_403, *_403
	call	atof	 #
 # pms.c:1287:             for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
	movl	FORMANTS(%rip), %edx	 # FORMANTS, FORMANTS.1_5
 # pms.c:1287:             for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
	movl	$5, %eax	 #, ivtmp.939
 # pms.c:1286:             NEED_VAL(a); float bw=(float)atof(argv[++i]);
	cvtsd2ss	%xmm0, %xmm0	 # _405, bw
 # pms.c:1287:             for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
	jmp	.L407	 #
.L408:
 # pms.c:1287:             for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
	movq	%rax, %rcx	 # ivtmp.939, _1900
	addq	$1, %rax	 #, ivtmp.939
	salq	$5, %rcx	 #, _1900
	movss	%xmm0, 832(%rsp,%rcx)	 # bw, MEM[(float *)&st + 32B + _1900 * 1]
.L407:
 # pms.c:1287:             for(int k=5;k<FORMANTS;k++) st->formants[k].bw=bw;
	cmpl	%eax, %edx	 # ivtmp.939, FORMANTS.1_5
	jg	.L408	 #,
	jmp	.L332	 #
.L409:
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	leaq	.LC150(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	testl	%eax, %eax	 # _419
	jne	.L411	 #,
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	movq	8(%rdi,%r14,8), %rcx	 # *_424, *_424
	call	atof	 #
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	cvtsd2ss	%xmm0, %xmm0	 # _426, tmp2571
	movss	%xmm0, 1216(%rsp)	 # tmp2571, st.aspiration_cutoff
 # pms.c:1293:         if (!strcmp(a,"--aspiration-cutoff")){ NEED_VAL(a); st->aspiration_cutoff=(float)atof(argv[++i]); continue; }
	jmp	.L332	 #
.L411:
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	leaq	.LC151(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	testl	%eax, %eax	 # _428
	jne	.L413	 #,
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	movq	8(%rdi,%r14,8), %rcx	 # *_433, *_433
	call	atof	 #
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	cvtsd2ss	%xmm0, %xmm0	 # _435, tmp2578
	movss	%xmm0, 1220(%rsp)	 # tmp2578, st.frication_center
 # pms.c:1294:         if (!strcmp(a,"--frication-center")) { NEED_VAL(a); st->frication_center  =(float)atof(argv[++i]); continue; }
	jmp	.L332	 #
.L413:
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	leaq	.LC152(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	testl	%eax, %eax	 # _437
	jne	.L415	 #,
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	movq	8(%rdi,%r14,8), %rcx	 # *_442, *_442
	call	atof	 #
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	cvtsd2ss	%xmm0, %xmm0	 # _444, tmp2585
	movss	%xmm0, 1224(%rsp)	 # tmp2585, st.frication_bandwidth
 # pms.c:1295:         if (!strcmp(a,"--frication-bandwidth")){ NEED_VAL(a); st->frication_bandwidth=(float)atof(argv[++i]); continue; }
	jmp	.L332	 #
.L415:
 # pms.c:1297:         if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }
	leaq	.LC153(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1297:         if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }
	testl	%eax, %eax	 # _446
	jne	.L417	 #,
 # pms.c:1297:         if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1297:         if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }
	movq	8(%rdi,%r14,8), %rdx	 # *_451, *_451
	leaq	1312(%rsp), %rcx	 #, tmp2592
	movl	$511, %r8d	 #,
	call	strncpy	 #
 # pms.c:1297:         if (!strcmp(a,"--output")){ NEED_VAL(a); strncpy(st->output_filename,argv[++i],511); continue; }
	jmp	.L332	 #
.L417:
 # pms.c:1299:         if (!strcmp(a,"--output-format")){
	leaq	.LC154(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1299:         if (!strcmp(a,"--output-format")){
	testl	%eax, %eax	 # _454
	jne	.L419	 #,
 # pms.c:1300:             NEED_VAL(a); const char *f=argv[++i];
	cmpl	%ebx, %esi	 # i, argc
	jle	.L1659	 #,
 # pms.c:1300:             NEED_VAL(a); const char *f=argv[++i];
	movq	8(%rdi,%r14,8), %r12	 # *_459, f
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC155(%rip), %rdx	 #,
	movq	__imp__stricmp(%rip), %r13	 #, tmp2598
	movq	%r12, %rcx	 # f,
	call	*%r13	 # tmp2598
 # pms.c:1301:             if(!strcasecmp(f,"wav16"))  st->output_format=FMT_WAV16;
	testl	%eax, %eax	 # _461
	jne	.L421	 #,
 # pms.c:1301:             if(!strcasecmp(f,"wav16"))  st->output_format=FMT_WAV16;
	xorl	%eax, %eax	 #
	movl	%eax, 2368(%rsp)	 #, st.output_format
	jmp	.L332	 #
.L419:
 # pms.c:1308:         if (!strcmp(a,"--normalize"))        { st->normalize_output=1;      continue; }
	leaq	.LC160(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1308:         if (!strcmp(a,"--normalize"))        { st->normalize_output=1;      continue; }
	testl	%eax, %eax	 # _466
	je	.L1774	 #,
 # pms.c:1309:         if (!strcmp(a,"--no-normalize"))     { st->normalize_output=0;      continue; }
	leaq	.LC161(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1309:         if (!strcmp(a,"--no-normalize"))     { st->normalize_output=0;      continue; }
	testl	%eax, %eax	 # _467
	je	.L1775	 #,
 # pms.c:1310:         if (!strcmp(a,"--no-lip-radiation")) { st->lip_radiation_enabled=0; continue; }
	leaq	.LC162(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1310:         if (!strcmp(a,"--no-lip-radiation")) { st->lip_radiation_enabled=0; continue; }
	testl	%eax, %eax	 # _468
	je	.L1776	 #,
 # pms.c:1311:         if (!strcmp(a,"--verbose"))          { st->verbose=1;               continue; }
	leaq	.LC163(%rip), %rdx	 #,
	movq	%r12, %rcx	 # a,
	call	strcmp	 #
 # pms.c:1311:         if (!strcmp(a,"--verbose"))          { st->verbose=1;               continue; }
	testl	%eax, %eax	 # _469
	je	.L1777	 #,
 # pms.c:1313:         if (a[0] != '-') {
	cmpb	$45, (%r12)	 #, *a_167
	je	.L430	 #,
 # pms.c:1314:             strncpy(st->output_filename, a, 511); continue;
	leaq	1312(%rsp), %rcx	 #, tmp2616
	movl	$511, %r8d	 #,
	movq	%r12, %rdx	 # a,
	call	strncpy	 #
.L426:
 # pms.c:1185:             mode_set=1; continue;
	movl	%r13d, %ebx	 # i, i
	jmp	.L332	 #
.L421:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC156(%rip), %rdx	 #,
	movq	%r12, %rcx	 # f,
	call	*%r13	 # tmp2598
 # pms.c:1302:             else if(!strcasecmp(f,"wav32")) st->output_format=FMT_WAV32;
	testl	%eax, %eax	 # _462
	jne	.L422	 #,
 # pms.c:1302:             else if(!strcasecmp(f,"wav32")) st->output_format=FMT_WAV32;
	movl	$1, 2368(%rsp)	 #, st.output_format
	jmp	.L332	 #
.L430:
 # pms.c:1317:         fprintf(stderr,"Warning: unknown argument '%s' (ignored)\n", a);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1317:         fprintf(stderr,"Warning: unknown argument '%s' (ignored)\n", a);
	leaq	.LC164(%rip), %rdx	 #,
	movq	%r12, %r8	 # a,
	movq	%rax, %rcx	 # _472,
	call	fprintf	 #
	jmp	.L426	 #
.L422:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC157(%rip), %rdx	 #,
	movq	%r12, %rcx	 # f,
	call	*%r13	 # tmp2598
 # pms.c:1303:             else if(!strcasecmp(f,"raw16")) st->output_format=FMT_RAW16;
	testl	%eax, %eax	 # _463
	jne	.L423	 #,
 # pms.c:1303:             else if(!strcasecmp(f,"raw16")) st->output_format=FMT_RAW16;
	movl	$2, 2368(%rsp)	 #, st.output_format
	jmp	.L332	 #
.L1777:
 # pms.c:1311:         if (!strcmp(a,"--verbose"))          { st->verbose=1;               continue; }
	movl	$1, 2380(%rsp)	 #, st.verbose
 # pms.c:1311:         if (!strcmp(a,"--verbose"))          { st->verbose=1;               continue; }
	jmp	.L426	 #
.L1775:
 # pms.c:1309:         if (!strcmp(a,"--no-normalize"))     { st->normalize_output=0;      continue; }
	xorl	%eax, %eax	 #
	movl	%eax, 2372(%rsp)	 #, st.normalize_output
 # pms.c:1309:         if (!strcmp(a,"--no-normalize"))     { st->normalize_output=0;      continue; }
	jmp	.L426	 #
.L1774:
 # pms.c:1308:         if (!strcmp(a,"--normalize"))        { st->normalize_output=1;      continue; }
	movl	$1, 2372(%rsp)	 #, st.normalize_output
 # pms.c:1308:         if (!strcmp(a,"--normalize"))        { st->normalize_output=1;      continue; }
	jmp	.L426	 #
.L1776:
 # pms.c:1310:         if (!strcmp(a,"--no-lip-radiation")) { st->lip_radiation_enabled=0; continue; }
	xorl	%eax, %eax	 #
	movl	%eax, 2376(%rsp)	 #, st.lip_radiation_enabled
 # pms.c:1310:         if (!strcmp(a,"--no-lip-radiation")) { st->lip_radiation_enabled=0; continue; }
	jmp	.L426	 #
.L423:
 # C:/mingw64/x86_64-w64-mingw32/include/string.h:131:   __CRT_INLINE int __cdecl strcasecmp (const char *__sz1, const char *__sz2) { return _stricmp (__sz1, __sz2); }
	leaq	.LC158(%rip), %rdx	 #,
	movq	%r12, %rcx	 # f,
	call	*%r13	 # tmp2598
 # pms.c:1304:             else if(!strcasecmp(f,"raw32")) st->output_format=FMT_RAW32;
	testl	%eax, %eax	 # _464
	jne	.L424	 #,
 # pms.c:1304:             else if(!strcasecmp(f,"raw32")) st->output_format=FMT_RAW32;
	movl	$3, 2368(%rsp)	 #, st.output_format
	jmp	.L332	 #
.L424:
 # pms.c:1305:             else{fprintf(stderr,"Error: unknown output format '%s'\n",f);return -1;}
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # pms.c:1305:             else{fprintf(stderr,"Error: unknown output format '%s'\n",f);return -1;}
	leaq	.LC159(%rip), %rdx	 #,
	movq	%r12, %r8	 # f,
	movq	%rax, %rcx	 # _465,
	call	fprintf	 #
	jmp	.L330	 #
	.seh_endproc
	.section .rdata,"dr"
	.align 32
g_preset_impulsive:
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1117782016
	.long	1120403456
	.long	1117782016
	.long	1120403456
	.long	1121714176
	.long	1123024896
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
 # voicing_amp:
	.long	1062836634
 # aspiration_amp:
	.long	1034147594
 # frication_amp:
	.long	0
 # f0:
	.long	1125515264
 # vibrato_depth:
	.long	0
 # vibrato_rate:
	.long	1084227584
 # jitter_pct:
	.long	1056964608
 # shimmer_pct:
	.long	1065353216
	.align 32
g_preset_whisper:
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1125515264
	.long	1128792064
	.long	1125515264
	.long	1127481344
	.long	1128792064
	.long	1128792064
	.long	1128792064
	.long	1128792064
	.long	1128792064
	.long	1130102784
 # voicing_amp:
	.long	1055286886
 # aspiration_amp:
	.long	1059481190
 # frication_amp:
	.long	1028443341
 # f0:
	.long	1119748096
 # vibrato_depth:
	.long	1056964608
 # vibrato_rate:
	.long	1083179008
 # jitter_pct:
	.long	1082130432
 # shimmer_pct:
	.long	1082130432
	.align 32
g_preset_natural:
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1075838976
 # aspiration_amp:
	.long	1039516303
 # frication_amp:
	.long	0
 # f0:
	.long	1123024896
 # vibrato_depth:
	.long	1069547520
 # vibrato_rate:
	.long	1085276160
 # jitter_pct:
	.long	1065353216
 # shimmer_pct:
	.long	1073741824
	.align 32
g_phoneme_db:
 # name:
	.ascii "a\0"
	.space 14
 # dur_ms:
	.long	1132068864
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1123024896
 # name:
	.ascii "e\0"
	.space 14
 # dur_ms:
	.long	1130102784
 # freq:
	.long	1141473280
	.long	1155350528
	.long	1158660096
	.long	1162592256
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1123024896
 # name:
	.ascii "i\0"
	.space 14
 # dur_ms:
	.long	1128792064
 # freq:
	.long	1133248512
	.long	1158373376
	.long	1161117696
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1114636288
	.long	1120403456
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1123024896
 # name:
	.ascii "o\0"
	.space 14
 # dur_ms:
	.long	1132068864
 # freq:
	.long	1142292480
	.long	1145569280
	.long	1159479296
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1123024896
	.long	1125515264
	.long	1123024896
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
	.long	1128792064
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "u\0"
	.space 14
 # dur_ms:
	.long	1130102784
 # freq:
	.long	1133903872
	.long	1145569280
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1117782016
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "ae\0"
	.space 13
 # dur_ms:
	.long	1131413504
 # freq:
	.long	1144750080
	.long	1152319488
	.long	1160298496
	.long	1163984896
	.long	1167048704
	.long	1169096704
	.long	1171144704
	.long	1173192704
	.long	1174822912
	.long	1175846912
 # bw:
	.long	1123024896
	.long	1125515264
	.long	1123024896
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
	.long	1128792064
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1123024896
 # name:
	.ascii "ah\0"
	.space 13
 # dur_ms:
	.long	1130758144
 # freq:
	.long	1145569280
	.long	1150681088
	.long	1160298496
	.long	1163575296
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1124204544
	.long	1125515264
	.long	1123024896
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
	.long	1128792064
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122762752
 # name:
	.ascii "aw\0"
	.space 13
 # dur_ms:
	.long	1132593152
 # freq:
	.long	1142292480
	.long	1147207680
	.long	1159479296
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1123024896
	.long	1125515264
	.long	1123024896
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
	.long	1128792064
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "er\0"
	.space 13
 # dur_ms:
	.long	1130102784
 # freq:
	.long	1140457472
	.long	1153138688
	.long	1156415488
	.long	1163165696
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1120403456
	.long	1124859904
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122762752
 # name:
	.ascii "ih\0"
	.space 13
 # dur_ms:
	.long	1127481344
 # freq:
	.long	1137180672
	.long	1154777088
	.long	1159888896
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1120403456
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1123024896
 # name:
	.ascii "uh\0"
	.space 13
 # dur_ms:
	.long	1128792064
 # freq:
	.long	1142292480
	.long	1148846080
	.long	1159069696
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122762752
 # name:
	.ascii "m\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1133248512
	.long	1143930880
	.long	1158250496
	.long	1161527296
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1117782016
	.long	1132068864
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	0
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "n\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1133248512
	.long	1154777088
	.long	1159069696
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1117782016
	.long	1132068864
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	0
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "ng\0"
	.space 13
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1133248512
	.long	1148846080
	.long	1160298496
	.long	1163575296
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1117782016
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1063675494
 # aspiration_amp:
	.long	0
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "l\0"
	.space 14
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1135869952
	.long	1148846080
	.long	1159479296
	.long	1163165696
	.long	1166639104
	.long	1168687104
	.long	1170735104
	.long	1172783104
	.long	1174618112
	.long	1175642112
 # bw:
	.long	1117782016
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1062836634
 # aspiration_amp:
	.long	1028443341
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "r\0"
	.space 14
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1139146752
	.long	1149861888
	.long	1154367488
	.long	1163165696
	.long	1166639104
	.long	1168687104
	.long	1170735104
	.long	1172783104
	.long	1174618112
	.long	1175642112
 # bw:
	.long	1117782016
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1062836634
 # aspiration_amp:
	.long	1028443341
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "w\0"
	.space 14
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1133903872
	.long	1142292480
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1117782016
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1062836634
 # aspiration_amp:
	.long	1028443341
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "y\0"
	.space 14
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1131413504
	.long	1157840896
	.long	1161936896
	.long	1163984896
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1117782016
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1062836634
 # aspiration_amp:
	.long	1028443341
 # frication_amp:
	.long	0
 # f0_default:
	.long	1122369536
 # name:
	.ascii "v\0"
	.space 14
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1130102784
	.long	1143930880
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1120403456
	.long	1123024896
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	1056964608
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	1056964608
 # f0_default:
	.long	1121714176
 # name:
	.ascii "z\0"
	.space 14
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1130102784
	.long	1154777088
	.long	1159069696
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1120403456
	.long	1123024896
	.long	1128792064
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1056964608
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	1058642330
 # f0_default:
	.long	1121714176
 # name:
	.ascii "zh\0"
	.space 13
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1130102784
	.long	1148846080
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1120403456
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1056964608
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	1058642330
 # f0_default:
	.long	1121714176
 # name:
	.ascii "dh\0"
	.space 13
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1130102784
	.long	1149861888
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1120403456
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1056964608
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	1053609165
 # f0_default:
	.long	1121714176
 # name:
	.ascii "f\0"
	.space 14
 # dur_ms:
	.long	1123024896
 # freq:
	.long	1128792064
	.long	1147207680
	.long	1157840896
	.long	1161527296
	.long	1165623296
	.long	1167867904
	.long	1169915904
	.long	1171963904
	.long	1174011904
	.long	1175232512
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1050253722
 # frication_amp:
	.long	1061997773
 # f0_default:
	.long	0
 # name:
	.ascii "s\0"
	.space 14
 # dur_ms:
	.long	1124204544
 # freq:
	.long	1128792064
	.long	1154777088
	.long	1159069696
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1137180672
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1036831949
 # frication_amp:
	.long	1063675494
 # f0_default:
	.long	0
 # name:
	.ascii "sh\0"
	.space 13
 # dur_ms:
	.long	1124204544
 # freq:
	.long	1128792064
	.long	1148846080
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1137180672
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1045220557
 # frication_amp:
	.long	1061997773
 # f0_default:
	.long	0
 # name:
	.ascii "th\0"
	.space 13
 # dur_ms:
	.long	1124204544
 # freq:
	.long	1128792064
	.long	1147207680
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1133903872
	.long	1137180672
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
	.long	1140457472
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1045220557
 # frication_amp:
	.long	1058642330
 # f0_default:
	.long	0
 # name:
	.ascii "h\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1143930880
	.long	1150681088
	.long	1159888896
	.long	1163575296
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1045220557
 # frication_amp:
	.long	0
 # f0_default:
	.long	0
 # name:
	.ascii "b\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1128792064
	.long	1147207680
	.long	1157840896
	.long	1161936896
	.long	1166024704
	.long	1168072704
	.long	1170120704
	.long	1172168704
	.long	1174216704
	.long	1175334912
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1060320051
 # aspiration_amp:
	.long	1053609165
 # frication_amp:
	.long	1058642330
 # f0_default:
	.long	1117782016
 # name:
	.ascii "d\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1133903872
	.long	1154777088
	.long	1159479296
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1060320051
 # aspiration_amp:
	.long	1053609165
 # frication_amp:
	.long	1056964608
 # f0_default:
	.long	1117782016
 # name:
	.ascii "g\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1132593152
	.long	1153957888
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1060320051
 # aspiration_amp:
	.long	1053609165
 # frication_amp:
	.long	1056964608
 # f0_default:
	.long	1117782016
 # name:
	.ascii "p\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1128792064
	.long	1147207680
	.long	1157840896
	.long	1161936896
	.long	1166024704
	.long	1168072704
	.long	1170120704
	.long	1172168704
	.long	1174216704
	.long	1175334912
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1061997773
 # frication_amp:
	.long	1061997773
 # f0_default:
	.long	0
 # name:
	.ascii "t\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1128792064
	.long	1154777088
	.long	1159479296
	.long	1162756096
	.long	1166434304
	.long	1168482304
	.long	1170530304
	.long	1172578304
	.long	1174515712
	.long	1175539712
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1061997773
 # frication_amp:
	.long	1060320051
 # f0_default:
	.long	0
 # name:
	.ascii "k\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1128792064
	.long	1153957888
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1061997773
 # frication_amp:
	.long	1060320051
 # f0_default:
	.long	0
 # name:
	.ascii "ch\0"
	.space 13
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1128792064
	.long	1153957888
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	1058642330
 # frication_amp:
	.long	1061997773
 # f0_default:
	.long	0
 # name:
	.ascii "jh\0"
	.space 13
 # dur_ms:
	.long	1120403456
 # freq:
	.long	1128792064
	.long	1153957888
	.long	1158250496
	.long	1162346496
	.long	1166229504
	.long	1168277504
	.long	1170325504
	.long	1172373504
	.long	1174413312
	.long	1175437312
 # bw:
	.long	1128792064
	.long	1133903872
	.long	1133903872
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
	.long	1137180672
 # voicing_amp:
	.long	1056964608
 # aspiration_amp:
	.long	1056964608
 # frication_amp:
	.long	1060320051
 # f0_default:
	.long	1117782016
 # name:
	.ascii "_\0"
	.space 14
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	0
 # frication_amp:
	.long	0
 # f0_default:
	.long	0
 # name:
	.ascii "SIL\0"
	.space 12
 # dur_ms:
	.long	1117782016
 # freq:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.long	1174720512
	.long	1175744512
 # bw:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
 # voicing_amp:
	.long	0
 # aspiration_amp:
	.long	0
 # frication_amp:
	.long	0
 # f0_default:
	.long	0
	.data
	.align 4
g_noise_state:
	.long	-1412567295
	.globl	FORMANTS
	.align 4
FORMANTS:
	.long	10
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1123024896
	.align 4
.LC2:
	.long	1120403456
	.set	.LC43,.LC101+4
	.align 8
.LC46:
	.long	0
	.long	22050
	.align 4
.LC51:
	.long	1148846080
	.align 4
.LC58:
	.long	897988541
	.set	.LC60,.LC100+4
	.set	.LC61,.LC81
	.align 4
.LC64:
	.long	1082130432
	.align 4
.LC69:
	.long	953267991
	.align 8
.LC76:
	.long	1061997773
	.long	1045220557
	.align 16
.LC78:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.align 16
.LC79:
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.align 8
.LC80:
	.long	1174720512
	.long	1175744512
	.align 16
.LC81:
	.long	1121714176
	.long	1124204544
	.long	1121714176
	.long	1124204544
	.align 16
.LC82:
	.long	1124859904
	.long	1125515264
	.long	1126170624
	.long	1126825984
	.align 8
.LC83:
	.long	1127481344
	.long	1128136704
	.align 4
.LC84:
	.long	1036831949
	.align 4
.LC85:
	.long	1056964608
	.set	.LC93,.LC101+12
	.set	.LC94,.LC102+4
	.set	.LC95,.LC102
	.set	.LC96,.LC78
	.align 4
.LC97:
	.long	1043878380
	.align 4
.LC98:
	.long	1109393408
	.align 4
.LC99:
	.long	-1082130432
	.align 8
.LC100:
	.long	1060320051
	.long	1048576000
	.align 16
.LC101:
	.long	1084227584
	.long	1065353216
	.long	1073741824
	.long	1140457472
	.align 8
.LC102:
	.long	1165623296
	.long	1157234688
	.align 8
.LC103:
	.long	1
	.long	1
	.align 8
.LC104:
	.long	1143930880
	.long	1121714176
	.align 8
.LC105:
	.long	1150844928
	.long	1124204544
	.align 8
.LC106:
	.long	1159888896
	.long	1121714176
	.align 8
.LC107:
	.long	1163739136
	.long	1124204544
	.align 8
.LC108:
	.long	1166843904
	.long	1124859904
	.align 8
.LC109:
	.long	1168891904
	.long	1125515264
	.align 8
.LC110:
	.long	1170939904
	.long	1126170624
	.align 8
.LC111:
	.long	1172987904
	.long	1126825984
	.align 4
.LC127:
	.long	1106247680
	.align 4
.LC137:
	.long	1092616192
	.align 4
.LC139:
	.long	1101004800
	.align 4
.LC166:
	.long	814313567
	.align 4
.LC182:
	.long	1028443341
	.align 4
.LC185:
	.long	-1068953637
	.align 4
.LC188:
	.long	1006834287
	.align 4
.LC189:
	.long	1078530011
	.align 4
.LC190:
	.long	1068827891
	.align 4
.LC191:
	.long	-1073741824
	.align 4
.LC192:
	.long	1086918619
	.align 4
.LC193:
	.long	1159533667
	.align 4
.LC194:
	.long	1002740646
	.align 4
.LC195:
	.long	1011129254
	.align 4
.LC196:
	.long	1053609165
	.align 4
.LC197:
	.long	1057803469
	.align 4
.LC198:
	.long	1041865114
	.align 4
.LC199:
	.long	1068708659
	.align 4
.LC200:
	.long	1055286886
	.align 4
.LC203:
	.long	805306368
	.align 4
.LC204:
	.long	981668463
	.align 8
.LC205:
	.long	1065353216
	.long	1065353216
	.align 4
.LC206:
	.long	925353388
	.align 4
.LC207:
	.long	1025758986
	.set	.LC208,.LC100
	.align 4
.LC209:
	.long	1050253722
	.align 4
.LC210:
	.long	1051931443
	.align 4
.LC211:
	.long	1064849900
	.align 16
.LC212:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 4
.LC213:
	.long	869711765
	.align 4
.LC214:
	.long	1060437492
	.set	.LC222,.LC103
	.align 4
.LC226:
	.long	1191181824
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	calloc;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	atof;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	strerror;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strchr;	.scl	2;	.type	32;	.endef
	.def	sscanf;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	expf;	.scl	2;	.type	32;	.endef
	.def	tanf;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
