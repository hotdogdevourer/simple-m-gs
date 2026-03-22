	.file	"mgs.c"
	.text
	.p2align 4
	.def	nxtok;	.scl	3;	.type	32;	.endef
	.seh_proc	nxtok
nxtok:
	.seh_endprologue
	movq	(%rcx), %rdx
	movzbl	(%rdx), %eax
	cmpb	$32, %al
	jne	.L32
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L25:
	movzbl	1(%rdx), %eax
	addq	$1, %rdx
	cmpb	$32, %al
	je	.L25
.L32:
	cmpb	$9, %al
	je	.L25
	cmpb	$35, %al
	ja	.L5
	movabsq	$34359747585, %r8
	btq	%rax, %r8
	jc	.L12
.L5:
	testb	$-33, %al
	movq	%rdx, %r8
	je	.L6
.L7:
	cmpb	$10, %al
	je	.L10
	cmpb	$13, %al
	je	.L10
	cmpb	$9, %al
	je	.L10
	movzbl	1(%r8), %eax
	addq	$1, %r8
	testb	$-33, %al
	jne	.L7
	testb	%al, %al
	jne	.L10
.L6:
	movq	%rdx, %rax
	movq	%r8, (%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movb	$0, (%r8)
	movq	%rdx, %rax
	addq	$1, %r8
	movq	%r8, (%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rdx, %r8
	xorl	%edx, %edx
	movq	%rdx, %rax
	movq	%r8, (%rcx)
	ret
	.seh_endproc
	.p2align 4
	.def	phon_pitch;	.scl	3;	.type	32;	.endef
	.seh_proc	phon_pitch
phon_pitch:
	.seh_endprologue
	movl	276(%rcx), %edx
	testl	%edx, %edx
	je	.L45
	movss	16(%rcx), %xmm0
	pxor	%xmm2, %xmm2
	comiss	%xmm2, %xmm0
	jbe	.L36
	divss	%xmm0, %xmm1
.L36:
	mulss	.LC2(%rip), %xmm1
	movss	20(%rcx), %xmm0
	comiss	%xmm1, %xmm0
	jnb	.L52
	leaq	20(%rcx), %rax
	movslq	%edx, %r8
	leaq	12(%rcx,%r8,8), %r8
	comiss	(%r8), %xmm1
	jnb	.L40
	cmpl	$1, %edx
	jle	.L40
	subl	$2, %edx
	leaq	28(%rcx,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L44:
	movss	(%rax), %xmm2
	comiss	%xmm2, %xmm1
	jb	.L41
	movss	8(%rax), %xmm3
	comiss	%xmm1, %xmm3
	jnb	.L53
.L41:
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L44
.L40:
	movss	4(%r8), %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	movss	24(%rcx), %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	movss	.LC0(%rip), %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	movaps	%xmm1, %xmm0
	subss	%xmm2, %xmm3
	movss	4(%rax), %xmm4
	subss	%xmm2, %xmm0
	movss	12(%rax), %xmm1
	subss	%xmm4, %xmm1
	divss	%xmm3, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm4, %xmm0
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Klatt-Style Formant Speech Synthesizer\12\0"
	.align 8
.LC4:
	.ascii "Usage: formant_synth [OPTIONS] [OUTPUT_FILE]\12\0"
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
	.ascii "  --demo VOICE_TYPE        Demo mode (natural|breathy|impulsive)\12\0"
.LC10:
	.ascii "Global Parameters:\0"
	.align 8
.LC11:
	.ascii "  --sample-rate SR         Sample rate (16000|22050|44100|48000, default: 22050)\0"
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
	.ascii "  --amplitude LEVEL        Output amplitude 0.0-1.0 (default: 0.8)\12\0"
.LC16:
	.ascii "Voice Parameters:\0"
	.align 8
.LC17:
	.ascii "  --voice TYPE             Voice type (natural|breathy|impulsive)\0"
	.align 8
.LC18:
	.ascii "  --voicing-amp AMP        Voicing amplitude (default: 0.7)\0"
	.align 8
.LC19:
	.ascii "  --aspiration-amp AMP     Aspiration amplitude (default: 0.3)\0"
	.align 8
.LC20:
	.ascii "  --frication-amp AMP      Frication amplitude (default: 0.0)\12\0"
.LC21:
	.ascii "Pitch Control:\0"
	.align 8
.LC22:
	.ascii "  --vibrato-depth HZ       Vibrato depth (default: 0.0)\0"
	.align 8
.LC23:
	.ascii "  --vibrato-rate HZ        Vibrato rate (default: 5.0)\0"
	.align 8
.LC24:
	.ascii "  --jitter PERCENT         Pitch jitter (default: 1.0)\0"
	.align 8
.LC25:
	.ascii "  --shimmer PERCENT        Amplitude shimmer (default: 2.0)\0"
	.align 8
.LC26:
	.ascii "  --pitch-contour FILE     Load F0 contour from file (time_ms f0_hz per line)\12\0"
	.align 8
.LC27:
	.ascii "Formant Parameters (demo mode only):\0"
	.align 8
.LC28:
	.ascii "  --f1-10 HZ               Formant 1-10 frequencies\0"
	.align 8
.LC29:
	.ascii "  --bw1-10 HZ              Formant 1-10 bandwidths\0"
	.align 8
.LC30:
	.ascii "  --bw6-10 HZ              Set bandwidths 6-10 to same value\12\0"
.LC31:
	.ascii "Aspiration / Frication:\0"
	.align 8
.LC32:
	.ascii "  --aspiration-cutoff HZ   High-pass cutoff for aspiration noise (default: 500)\0"
	.align 8
.LC33:
	.ascii "  --frication-center HZ    Centre frequency of frication noise (default: 4000)\0"
	.align 8
.LC34:
	.ascii "  --frication-bandwidth HZ Bandwidth of frication noise (default: 2000)\12\0"
.LC35:
	.ascii "Output Options:\0"
	.align 8
.LC36:
	.ascii "  --output FILE            Output filename (default: output.wav)\0"
	.align 8
.LC37:
	.ascii "  --output-format FORMAT   wav16|wav32|raw16|raw32 (default: wav16)\0"
	.align 8
.LC38:
	.ascii "  --normalize              Enable loudness normalization (default: enabled)\0"
	.align 8
.LC39:
	.ascii "  --no-lip-radiation       Disable lip radiation filter\0"
	.align 8
.LC40:
	.ascii "  --verbose                Print debug information\0"
	.align 8
.LC41:
	.ascii "  --help                   Display this help message\0"
	.text
	.p2align 4
	.def	print_help;	.scl	3;	.type	32;	.endef
	.seh_proc	print_help
print_help:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.LC3(%rip), %rcx
	call	puts
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	.LC5(%rip), %rcx
	call	puts
	leaq	.LC6(%rip), %rcx
	call	puts
	leaq	.LC7(%rip), %rcx
	call	puts
	leaq	.LC8(%rip), %rcx
	call	puts
	leaq	.LC9(%rip), %rcx
	call	puts
	leaq	.LC10(%rip), %rcx
	call	puts
	leaq	.LC11(%rip), %rcx
	call	puts
	leaq	.LC12(%rip), %rcx
	call	puts
	leaq	.LC13(%rip), %rcx
	call	puts
	leaq	.LC14(%rip), %rcx
	call	puts
	leaq	.LC15(%rip), %rcx
	call	puts
	leaq	.LC16(%rip), %rcx
	call	puts
	leaq	.LC17(%rip), %rcx
	call	puts
	leaq	.LC18(%rip), %rcx
	call	puts
	leaq	.LC19(%rip), %rcx
	call	puts
	leaq	.LC20(%rip), %rcx
	call	puts
	leaq	.LC21(%rip), %rcx
	call	puts
	leaq	.LC22(%rip), %rcx
	call	puts
	leaq	.LC23(%rip), %rcx
	call	puts
	leaq	.LC24(%rip), %rcx
	call	puts
	leaq	.LC25(%rip), %rcx
	call	puts
	leaq	.LC26(%rip), %rcx
	call	puts
	leaq	.LC27(%rip), %rcx
	call	puts
	leaq	.LC28(%rip), %rcx
	call	puts
	leaq	.LC29(%rip), %rcx
	call	puts
	leaq	.LC30(%rip), %rcx
	call	puts
	leaq	.LC31(%rip), %rcx
	call	puts
	leaq	.LC32(%rip), %rcx
	call	puts
	leaq	.LC33(%rip), %rcx
	call	puts
	leaq	.LC34(%rip), %rcx
	call	puts
	leaq	.LC35(%rip), %rcx
	call	puts
	leaq	.LC36(%rip), %rcx
	call	puts
	leaq	.LC37(%rip), %rcx
	call	puts
	leaq	.LC38(%rip), %rcx
	call	puts
	leaq	.LC39(%rip), %rcx
	call	puts
	leaq	.LC40(%rip), %rcx
	call	puts
	leaq	.LC41(%rip), %rcx
	addq	$40, %rsp
	jmp	puts
	.seh_endproc
	.p2align 4
	.def	match_fi_arg;	.scl	3;	.type	32;	.endef
	.seh_proc	match_fi_arg
match_fi_arg:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movq	%rdx, 40(%rsp)
	call	strlen
	movq	40(%rsp), %rdx
	movq	%rbx, %rcx
	movq	%rax, %r8
	movq	%rax, %rsi
	call	strncmp
	testl	%eax, %eax
	jne	.L58
	leaq	(%rbx,%rsi), %rcx
	movzbl	(%rcx), %eax
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L59
.L58:
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	call	atoi
	leal	-1(%rax), %edx
	cmpl	$9, %edx
	ja	.L58
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC43:
	.ascii "r\0"
	.align 8
.LC44:
	.ascii "Error: cannot open spec '%s': %s\12\0"
.LC46:
	.ascii "SAMPLE_RATE\0"
.LC47:
	.ascii "SYNTHESIS_MODE\0"
.LC48:
	.ascii "parallel\0"
.LC49:
	.ascii "DURATION\0"
.LC51:
	.ascii "NORMALIZE\0"
.LC52:
	.ascii "LIP_RADIATION\0"
	.align 8
.LC53:
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
	pushq	%r15
	.seh_pushreg	%r15
	movl	$8264, %eax
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	8264
	.seh_endprologue
	movq	%rdx, %r13
	movq	%rcx, 8336(%rsp)
	leaq	.LC43(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L123
	movl	$148, %edx
	movl	$8192, %ecx
	call	calloc
	testq	%rax, %rax
	movq	%rax, 0(%r13)
	je	.L124
	movq	.LC45(%rip), %rax
	movq	$0, 16(%r13)
	xorl	%ebx, %ebx
	movq	__imp__strnicmp(%rip), %rbp
	movq	%rax, 8(%r13)
	.p2align 4,,10
	.p2align 3
.L64:
	leaq	64(%rsp), %rcx
	movq	%r12, %r8
	movl	$8192, %edx
	call	fgets
	testq	%rax, %rax
	je	.L79
	movzbl	64(%rsp), %eax
	leaq	64(%rsp), %r14
	addl	$1, %ebx
	cmpb	$9, %al
	je	.L113
	cmpb	$32, %al
	jne	.L65
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L113:
	movzbl	1(%r14), %eax
	addq	$1, %r14
	cmpb	$32, %al
	je	.L113
	cmpb	$9, %al
	je	.L113
.L65:
	cmpb	$35, %al
	ja	.L68
	movabsq	$34359747585, %rdx
	btq	%rax, %rdx
	jc	.L64
.L68:
	leaq	.LC46(%rip), %rdx
	movl	$11, %r8d
	movq	%r14, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L125
	leaq	.LC47(%rip), %rdx
	movl	$14, %r8d
	movq	%r14, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L126
	leaq	.LC49(%rip), %rdx
	movl	$8, %r8d
	movq	%r14, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L127
	leaq	.LC51(%rip), %rdx
	movl	$9, %r8d
	movq	%r14, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L64
	leaq	.LC52(%rip), %rdx
	movl	$13, %r8d
	movq	%r14, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L64
	movl	8(%r13), %eax
	cmpl	$8191, %eax
	jg	.L128
	movslq	%eax, %r15
	movl	$37, %ecx
	xorl	%eax, %eax
	movss	.LC42(%rip), %xmm0
	imulq	$148, %r15, %r15
	movq	%r14, 56(%rsp)
	addq	0(%r13), %r15
	shufps	$0, %xmm0, %xmm0
	movq	%r15, %rdi
	rep stosl
	movq	.LC54(%rip), %rax
	leaq	56(%rsp), %rdi
	movl	$0x3f800000, 140(%r15)
	movups	%xmm0, 100(%r15)
	movq	%rdi, %rcx
	movups	%xmm0, 116(%r15)
	movq	%rax, 132(%r15)
	call	nxtok
	testq	%rax, %rax
	je	.L129
	leaq	4(%r15), %r14
	movq	%rax, %rcx
	call	atof
	leaq	44(%r15), %rax
	cvtsd2ss	%xmm0, %xmm0
	movq	%rax, 40(%rsp)
	movss	%xmm0, (%r15)
	.p2align 4,,10
	.p2align 3
.L82:
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L81
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%r14)
	call	nxtok
	testq	%rax, %rax
	je	.L81
	movq	%rax, %rcx
	addq	$4, %r14
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 36(%r14)
	cmpq	%r14, 40(%rsp)
	jne	.L82
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L122
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 84(%r15)
	call	nxtok
	testq	%rax, %rax
	je	.L122
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 88(%r15)
	call	nxtok
	testq	%rax, %rax
	je	.L122
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 92(%r15)
	call	nxtok
	testq	%rax, %rax
	je	.L122
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 96(%r15)
	call	nxtok
	testq	%rax, %rax
	je	.L122
	movq	%rax, %rcx
	call	atof
	movss	.LC58(%rip), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	ja	.L130
.L90:
	movss	%xmm0, 100(%r15)
	xorl	%r14d, %r14d
.L93:
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L92
	movq	%rax, %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 104(%r15,%r14,4)
	addq	$1, %r14
	cmpq	$10, %r14
	jne	.L93
.L94:
	movl	$1, 144(%r15)
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L125:
	leaq	12(%r14), %rcx
	call	atoi
	movl	%eax, 12(%r13)
	jmp	.L64
.L126:
	movzbl	15(%r14), %eax
	leaq	15(%r14), %rcx
	cmpb	$32, %al
	jne	.L120
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L114:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L114
.L120:
	cmpb	$9, %al
	je	.L114
	leaq	.LC48(%rip), %rdx
	movl	$8, %r8d
	call	*%rbp
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 16(%r13)
	jmp	.L64
.L127:
	leaq	9(%r14), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC50(%rip), %xmm0
	movss	%xmm0, 20(%r13)
	jmp	.L64
.L128:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$8192, %r8d
	leaq	.LC53(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L79:
	movq	%r12, %rcx
	call	fclose
	movslq	8(%r13), %rax
	testl	%eax, %eax
	je	.L131
	pxor	%xmm0, %xmm0
	comiss	20(%r13), %xmm0
	jnb	.L97
.L99:
	xorl	%eax, %eax
.L60:
	addq	$8264, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L97:
	subq	$1, %rax
	movss	.LC2(%rip), %xmm0
	imulq	$148, %rax, %rax
	addq	0(%r13), %rax
	addss	(%rax), %xmm0
	movss	%xmm0, 20(%r13)
	jmp	.L99
.L122:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC56(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
.L85:
	addl	$1, 8(%r13)
	jmp	.L64
.L129:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC56(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L64
.L81:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC57(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L64
.L130:
	movss	.LC42(%rip), %xmm0
	jmp	.L90
.L92:
	testl	%r14d, %r14d
	je	.L85
	jmp	.L94
.L123:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movl	$2, %ecx
	movq	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	8336(%rsp), %r8
	movq	%rbx, %r9
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L62:
	movl	$-1, %eax
	jmp	.L60
.L131:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	8336(%rsp), %r8
	leaq	.LC59(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L62
.L124:
	movq	%r12, %rcx
	call	fclose
	jmp	.L62
	.seh_endproc
	.p2align 4
	.def	w32;	.scl	3;	.type	32;	.endef
	.seh_proc	w32
w32:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	$4, %r8d
	movq	%rcx, %r9
	movl	%edx, 44(%rsp)
	movl	$1, %edx
	leaq	44(%rsp), %rcx
	call	fwrite
	nop
	addq	$56, %rsp
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
	.ascii "t\0"
.LC71:
	.ascii "k\0"
.LC72:
	.ascii "b\0"
.LC73:
	.ascii "d\0"
.LC74:
	.ascii "g\0"
	.align 8
.LC75:
	.ascii "Error: no phonemes parsed from '%s'\12\0"
.LC76:
	.ascii "p\0"
	.text
	.p2align 4
	.def	phoneme_parse;	.scl	3;	.type	32;	.endef
	.seh_proc	phoneme_parse
phoneme_parse:
	pushq	%r15
	.seh_pushreg	%r15
	movl	$4280, %eax
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	4280
	movaps	%xmm6, 4256(%rsp)
	.seh_savexmm	%xmm6, 4256
	.seh_endprologue
	movq	%rdx, %rbp
	movq	%rcx, %r13
	leaq	.LC43(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L241
	movl	$8100, %edx
	movl	$1024, %ecx
	call	calloc
	testq	%rax, %rax
	movq	%rax, 0(%rbp)
	je	.L242
	movq	.LC45(%rip), %rax
	leaq	160(%rsp), %rbx
	movl	$6385769, 24(%rbp)
	movq	__imp__strnicmp(%rip), %rdi
	movq	%rbx, 32(%rsp)
	movss	.LC60(%rip), %xmm6
	movq	%rax, 8(%rbp)
	movabsq	$4575657221408423936, %rax
	movq	%rax, 16(%rbp)
	leaq	24(%rbp), %rax
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L138:
	movq	32(%rsp), %rcx
	movq	%r14, %r8
	movl	$4096, %edx
	call	fgets
	testq	%rax, %rax
	je	.L155
	movzbl	160(%rsp), %eax
	movq	32(%rsp), %r12
	cmpb	$32, %al
	jne	.L240
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L215:
	movzbl	1(%r12), %eax
	addq	$1, %r12
	cmpb	$32, %al
	je	.L215
.L240:
	cmpb	$9, %al
	je	.L215
	cmpb	$35, %al
	ja	.L140
	movabsq	$34359747585, %rdx
	btq	%rax, %rdx
	jc	.L138
.L140:
	leaq	.LC46(%rip), %rdx
	movl	$11, %r8d
	movq	%r12, %rcx
	call	*%rdi
	testl	%eax, %eax
	je	.L243
	leaq	.LC47(%rip), %rdx
	movl	$14, %r8d
	movq	%r12, %rcx
	call	*%rdi
	testl	%eax, %eax
	je	.L244
	leaq	.LC63(%rip), %rdx
	movl	$5, %r8d
	movq	%r12, %rcx
	call	*%rdi
	testl	%eax, %eax
	je	.L245
	leaq	.LC65(%rip), %rdx
	movl	$11, %r8d
	movq	%r12, %rcx
	call	*%rdi
	testl	%eax, %eax
	je	.L246
	leaq	.LC67(%rip), %rdx
	movl	$10, %r8d
	movq	%r12, %rcx
	call	*%rdi
	testl	%eax, %eax
	je	.L138
	movl	8(%rbp), %eax
	cmpl	$1023, %eax
	jg	.L247
	movslq	%eax, %rsi
	xorl	%edx, %edx
	movl	$8100, %r8d
	imulq	$8100, %rsi, %rsi
	addq	0(%rbp), %rsi
	leaq	88(%rsp), %rbx
	movq	%rsi, %rcx
	call	memset
	movq	%rbx, %rcx
	movq	%r12, 88(%rsp)
	movq	%rbx, 40(%rsp)
	call	nxtok
	testq	%rax, %rax
	je	.L138
	movl	$15, %r8d
	movq	%rax, %rdx
	movq	%rsi, %rcx
	call	strncpy
	movq	%rbx, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L138
	movq	%rax, %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 16(%rsi)
	movss	20(%rbp), %xmm1
	comiss	.LC69(%rip), %xmm1
	ja	.L248
.L157:
	leaq	g_phoneme_db(%rip), %r15
	leaq	4292(%r15), %rbx
	jmp	.L160
	.p2align 4,,10
	.p2align 3
.L250:
	leaq	116(%r15), %r15
	cmpq	%rbx, %r15
	je	.L249
.L160:
	movq	%rsi, %rdx
	movq	%r15, %rcx
	movq	%r15, %r12
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	jne	.L250
	movss	20(%r15), %xmm0
	leaq	.LC76(%rip), %rdx
	movq	%rsi, %rcx
	movss	%xmm0, 280(%rsi)
	movss	60(%r15), %xmm0
	movss	%xmm0, 320(%rsi)
	movss	24(%r15), %xmm0
	movss	%xmm0, 284(%rsi)
	movss	64(%r15), %xmm0
	movss	%xmm0, 324(%rsi)
	movss	28(%r15), %xmm0
	movss	%xmm0, 288(%rsi)
	movss	68(%r15), %xmm0
	movss	%xmm0, 328(%rsi)
	movss	32(%r15), %xmm0
	movss	%xmm0, 292(%rsi)
	movss	72(%r15), %xmm0
	movss	%xmm0, 332(%rsi)
	movss	36(%r15), %xmm0
	movss	%xmm0, 296(%rsi)
	movss	76(%r15), %xmm0
	movss	%xmm0, 336(%rsi)
	movss	40(%r15), %xmm0
	movss	%xmm0, 300(%rsi)
	movss	80(%r15), %xmm0
	movss	%xmm0, 340(%rsi)
	movss	44(%r15), %xmm0
	movss	%xmm0, 304(%rsi)
	movss	84(%r15), %xmm0
	movss	%xmm0, 344(%rsi)
	movss	48(%r15), %xmm0
	movss	%xmm0, 308(%rsi)
	movss	88(%r15), %xmm0
	movss	%xmm0, 348(%rsi)
	movss	52(%r15), %xmm0
	movss	%xmm0, 312(%rsi)
	movss	92(%r15), %xmm0
	movss	%xmm0, 352(%rsi)
	movss	56(%r15), %xmm0
	movss	%xmm0, 316(%rsi)
	movss	96(%r15), %xmm0
	movss	%xmm0, 356(%rsi)
	movss	100(%r15), %xmm0
	movss	%xmm0, 8084(%rsi)
	movss	104(%r15), %xmm0
	movss	%xmm0, 8088(%rsi)
	movss	108(%r15), %xmm0
	movss	%xmm0, 8092(%rsi)
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	jne	.L251
.L163:
	movl	$1, 8096(%rsi)
.L182:
	leaq	96(%rsp), %rax
	xorl	%ecx, %ecx
	movl	%ecx, 52(%rsp)
	movq	%rax, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L167:
	movq	40(%rsp), %rcx
	call	nxtok
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L252
	movl	$58, %edx
	movq	%rbx, %rcx
	call	strchr
	movl	$47, %edx
	movq	%rbx, %rcx
	movq	%rax, %r15
	call	strchr
	testq	%r15, %r15
	je	.L168
	testq	%rax, %rax
	je	.L253
.L231:
	cmpl	$9, 52(%rsp)
	jg	.L167
	movq	%rbx, %rdx
	movq	64(%rsp), %rbx
	movl	$63, %r8d
	movq	%rbx, %rcx
	call	strncpy
	movq	%rbx, %rcx
	movl	$47, %edx
	movb	$0, 159(%rsp)
	call	strchr
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L254
	movq	64(%rsp), %rcx
	movb	$0, (%rax)
	call	atof
	movslq	52(%rsp), %r15
	leaq	1(%rbx), %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 280(%rsi,%r15,4)
	call	atof
	cvtsd2ss	%xmm0, %xmm0
.L175:
	addl	$1, 52(%rsp)
	movss	%xmm0, 320(%rsi,%r15,4)
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L243:
	leaq	12(%r12), %rcx
	call	atoi
	movl	%eax, 12(%rbp)
	jmp	.L138
.L244:
	movzbl	15(%r12), %eax
	leaq	15(%r12), %rcx
	cmpb	$32, %al
	jne	.L238
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L216:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L216
.L238:
	cmpb	$9, %al
	je	.L216
	leaq	.LC48(%rip), %rdx
	movl	$8, %r8d
	call	*%rdi
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 16(%rbp)
	jmp	.L138
.L245:
	leaq	6(%r12), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	movaps	%xmm6, %xmm2
	cvtsd2ss	%xmm0, %xmm1
	comiss	%xmm1, %xmm6
	ja	.L148
	movss	.LC64(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm0, %xmm2
.L148:
	movss	%xmm2, 20(%rbp)
	jmp	.L138
.L247:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1024, %r8d
	leaq	.LC68(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L155:
	movq	%r14, %rcx
	call	fclose
	movl	8(%rbp), %eax
	testl	%eax, %eax
	je	.L255
	xorl	%eax, %eax
.L133:
	movaps	4256(%rsp), %xmm6
	addq	$4280, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L246:
	movzbl	12(%r12), %eax
	leaq	12(%r12), %rcx
	cmpb	$32, %al
	jne	.L239
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L217:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L217
.L239:
	cmpb	$9, %al
	je	.L217
	movq	56(%rsp), %r8
	leaq	.LC66(%rip), %rdx
	call	sscanf
	jmp	.L138
.L168:
	testq	%rax, %rax
	je	.L167
	jmp	.L231
.L253:
	movl	276(%rsi), %r15d
	cmpl	$31, %r15d
	jg	.L167
	leal	1(%r15), %eax
	movl	$63, %r8d
	movq	%rbx, %rdx
	leaq	96(%rsp), %rcx
	movl	%eax, 276(%rsi)
	call	strncpy
	leaq	96(%rsp), %rcx
	movl	$58, %edx
	movb	$0, 159(%rsp)
	call	strchr
	testq	%rax, %rax
	je	.L167
	movb	$0, (%rax)
	leaq	96(%rsp), %rcx
	movq	%rax, 72(%rsp)
	call	atof
	movq	72(%rsp), %rax
	movslq	%r15d, %r9
	leaq	2(%r9), %rbx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 4(%rsi,%rbx,8)
	leaq	1(%rax), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rsi,%rbx,8)
	jmp	.L167
.L252:
	cmpl	$0, 276(%rsi)
	jne	.L177
	testq	%r12, %r12
	je	.L184
	movss	112(%r12), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L184
.L178:
	movl	$0x00000000, 20(%rsi)
	movss	%xmm0, 24(%rsi)
	movl	$0x42c80000, 28(%rsi)
	movss	%xmm0, 32(%rsi)
	movl	$2, 276(%rsi)
.L177:
	addl	$1, 8(%rbp)
	jmp	.L138
.L248:
	divss	%xmm1, %xmm0
	movss	%xmm0, 16(%rsi)
	jmp	.L157
.L251:
	leaq	.LC70(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	je	.L163
	leaq	.LC71(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	je	.L163
	leaq	.LC72(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	jne	.L164
.L165:
	movl	$2, 8096(%rsi)
	jmp	.L182
.L249:
	movaps	.LC77(%rip), %xmm0
	xorl	%r12d, %r12d
	movq	.LC82(%rip), %rax
	movups	%xmm0, 280(%rsi)
	movaps	.LC78(%rip), %xmm0
	movups	%xmm0, 296(%rsi)
	movaps	.LC79(%rip), %xmm0
	movq	%rax, 8084(%rsi)
	movups	%xmm0, 312(%rsi)
	movaps	.LC80(%rip), %xmm0
	movups	%xmm0, 328(%rsi)
	movaps	.LC81(%rip), %xmm0
	movups	%xmm0, 344(%rsi)
	jmp	.L182
.L184:
	movss	.LC0(%rip), %xmm0
	jmp	.L178
.L254:
	movq	64(%rsp), %rcx
	call	atof
	movslq	52(%rsp), %r15
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 280(%rsi,%r15,4)
	movss	.LC61(%rip), %xmm0
	jmp	.L175
.L241:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movl	$2, %ecx
	movq	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r9
	movq	%r13, %r8
	leaq	.LC62(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L135:
	movl	$-1, %eax
	jmp	.L133
.L164:
	leaq	.LC73(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	je	.L165
	leaq	.LC74(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	je	.L165
	xorl	%edx, %edx
	movl	%edx, 8096(%rsi)
	jmp	.L182
.L255:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC75(%rip), %rdx
	movq	%r13, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L135
.L242:
	movq	%r14, %rcx
	call	fclose
	jmp	.L135
	.seh_endproc
	.p2align 4
	.def	contour_f0.part.0;	.scl	3;	.type	32;	.endef
	.seh_proc	contour_f0.part.0
contour_f0.part.0:
	.seh_endprologue
	movslq	%edx, %rax
	leaq	-8(%rcx,%rax,8), %r8
	comiss	(%r8), %xmm2
	jnb	.L257
	cmpl	$1, %edx
	je	.L257
	leal	-2(%rdx), %eax
	leaq	8(%rcx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L263:
	movss	(%rcx), %xmm0
	comiss	%xmm0, %xmm2
	jb	.L258
	movss	8(%rcx), %xmm1
	comiss	%xmm2, %xmm1
	jnb	.L271
.L258:
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	.L263
.L257:
	movss	4(%r8), %xmm3
.L256:
	movaps	%xmm3, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L271:
	comiss	%xmm1, %xmm0
	movss	4(%rcx), %xmm3
	jnb	.L256
	subss	%xmm0, %xmm1
	movss	12(%rcx), %xmm4
	subss	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	comiss	%xmm2, %xmm1
	ja	.L262
	movss	.LC42(%rip), %xmm0
	movaps	%xmm0, %xmm1
	cmpltss	%xmm2, %xmm1
	andps	%xmm1, %xmm0
	andnps	%xmm2, %xmm1
	orps	%xmm0, %xmm1
.L262:
	subss	%xmm3, %xmm4
	movaps	%xmm4, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm3
	movaps	%xmm3, %xmm0
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC85:
	.ascii "demo\0"
.LC86:
	.ascii "spec\0"
.LC87:
	.ascii "phoneme\0"
.LC88:
	.ascii "cascade\0"
.LC89:
	.ascii "natural\0"
.LC90:
	.ascii "breathy\0"
.LC91:
	.ascii "impulsive\0"
.LC113:
	.ascii "--help\0"
.LC114:
	.ascii "--version\0"
.LC115:
	.ascii "1.0.0\0"
.LC116:
	.ascii "formant_synth version %s\12\0"
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
	.ascii "--aspiration-cutoff\0"
.LC150:
	.ascii "--frication-center\0"
.LC151:
	.ascii "--frication-bandwidth\0"
.LC152:
	.ascii "--output\0"
.LC153:
	.ascii "--output-format\0"
.LC154:
	.ascii "wav16\0"
.LC155:
	.ascii "wav32\0"
.LC156:
	.ascii "raw16\0"
.LC157:
	.ascii "raw32\0"
	.align 8
.LC158:
	.ascii "Error: unknown output format '%s'\12\0"
.LC159:
	.ascii "--normalize\0"
.LC160:
	.ascii "--no-normalize\0"
.LC161:
	.ascii "--no-lip-radiation\0"
.LC162:
	.ascii "--verbose\0"
	.align 8
.LC163:
	.ascii "Warning: unknown argument '%s' (ignored)\12\0"
	.align 8
.LC165:
	.ascii "=== Formant Synthesizer v%s ===\12\0"
.LC166:
	.ascii "Mode      : %s\12\0"
.LC167:
	.ascii "Filters   : %s\12\0"
.LC168:
	.ascii "Voice     : %s\12\0"
.LC169:
	.ascii "Sample-rt : %d Hz\12\0"
.LC170:
	.ascii "Duration  : %.2f s\12\0"
.LC171:
	.ascii "F0        : %.1f Hz\12\0"
	.align 8
.LC172:
	.ascii "Voicing   : %.2f   Asp: %.2f   Fric: %.2f\12\0"
	.align 8
.LC173:
	.ascii "Vibrato   : %.1f Hz depth @ %.1f Hz rate\12\0"
	.align 8
.LC174:
	.ascii "Jitter    : %.1f%%  Shimmer: %.1f%%\12\0"
.LC175:
	.ascii "Formants  :\0"
	.align 8
.LC176:
	.ascii "  F%2d : %6.0f Hz  BW %4.0f Hz  Gain %.2f\12\0"
.LC177:
	.ascii "Output    : %s\12\0"
	.align 8
.LC178:
	.ascii "===================================\0"
.LC179:
	.ascii "Synthesising...\0"
	.align 8
.LC181:
	.ascii "Error: out of memory (%d samples)\12\0"
.LC182:
	.ascii "Error: synthesis failed\12\0"
.LC184:
	.ascii "sil\0"
.LC185:
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
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$2488, %rsp
	.seh_stackalloc	2488
	movaps	%xmm6, 2320(%rsp)
	.seh_savexmm	%xmm6, 2320
	movaps	%xmm7, 2336(%rsp)
	.seh_savexmm	%xmm7, 2336
	movaps	%xmm8, 2352(%rsp)
	.seh_savexmm	%xmm8, 2352
	movaps	%xmm9, 2368(%rsp)
	.seh_savexmm	%xmm9, 2368
	movaps	%xmm10, 2384(%rsp)
	.seh_savexmm	%xmm10, 2384
	movaps	%xmm11, 2400(%rsp)
	.seh_savexmm	%xmm11, 2400
	movaps	%xmm12, 2416(%rsp)
	.seh_savexmm	%xmm12, 2416
	movaps	%xmm13, 2432(%rsp)
	.seh_savexmm	%xmm13, 2432
	movaps	%xmm14, 2448(%rsp)
	.seh_savexmm	%xmm14, 2448
	movaps	%xmm15, 2464(%rsp)
	.seh_savexmm	%xmm15, 2464
	.seh_endprologue
	movl	%ecx, %esi
	movq	%rdx, %rdi
	call	__main
	leaq	720(%rsp), %rax
	xorl	%edx, %edx
	movl	$1600, %r8d
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)
	call	memset
	movq	.LC99(%rip), %rax
	cmpl	$1, %esi
	movl	$22050, 732(%rsp)
	movss	.LC42(%rip), %xmm6
	movaps	.LC100(%rip), %xmm0
	movss	%xmm6, 788(%rsp)
	movaps	%xmm6, %xmm7
	movq	%rax, 1108(%rsp)
	movq	.LC101(%rip), %rax
	shufps	$0, %xmm7, %xmm7
	movlps	%xmm7, 1068(%rsp)
	movaps	%xmm6, %xmm7
	shufps	$0, %xmm7, %xmm7
	movlps	%xmm0, 1124(%rsp)
	movhps	%xmm0, 1132(%rsp)
	movq	%rax, 1140(%rsp)
	movq	.LC102(%rip), %rax
	movss	%xmm6, 820(%rsp)
	movss	%xmm6, 852(%rsp)
	movhps	%xmm7, 1076(%rsp)
	movq	%rax, 2292(%rsp)
	movabsq	$8587929587188790639, %rax
	movq	%rax, 1232(%rsp)
	movq	.LC103(%rip), %rax
	movl	$7758199, 1239(%rsp)
	movss	%xmm6, 884(%rsp)
	movq	%rax, 736(%rsp)
	movabsq	$4913145719546498253, %rax
	movq	%rax, 744(%rsp)
	movabsq	$4575657222530138112, %rax
	movq	%rax, 752(%rsp)
	movq	.LC104(%rip), %rax
	movq	%rax, 780(%rsp)
	movq	.LC105(%rip), %rax
	movq	%rax, 812(%rsp)
	movq	.LC106(%rip), %rax
	movq	%rax, 844(%rsp)
	movq	.LC107(%rip), %rax
	movq	%rax, 876(%rsp)
	movq	.LC108(%rip), %rax
	movq	%rax, 908(%rsp)
	movq	.LC109(%rip), %rax
	movss	%xmm6, 916(%rsp)
	movss	%xmm6, 948(%rsp)
	movss	%xmm6, 980(%rsp)
	movq	%rax, 940(%rsp)
	movq	.LC110(%rip), %rax
	movlps	%xmm7, 1084(%rsp)
	movlps	%xmm7, 1092(%rsp)
	movss	%xmm6, 1012(%rsp)
	movq	%rax, 972(%rsp)
	movq	.LC111(%rip), %rax
	movss	%xmm6, 1044(%rsp)
	movlps	%xmm7, 1100(%rsp)
	movq	%rax, 1004(%rsp)
	movq	.LC112(%rip), %rax
	movq	%rax, 1036(%rsp)
	jle	.L1272
	movq	$0, 368(%rsp)
	xorl	%ebp, %ebp
	movl	$1, %r13d
	movq	$0, 376(%rsp)
	movq	$0, 384(%rsp)
	movq	$0, 392(%rsp)
	movq	$0, 400(%rsp)
	movq	$0, 416(%rsp)
	movq	$0, 424(%rsp)
	movq	$0, 432(%rsp)
	movq	$0, 440(%rsp)
	movq	$0, 448(%rsp)
	jmp	.L378
	.p2align 4,,10
	.p2align 3
.L1275:
	leaq	.LC118(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L279
	leaq	.LC121(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L285
	cmpl	%ebx, %esi
	jle	.L1245
	testl	%ebp, %ebp
	je	.L287
	cmpl	$2, 720(%rsp)
	jne	.L288
.L287:
	movl	$2, 720(%rsp)
	.p2align 4,,10
	.p2align 3
.L1244:
	movslq	%ebx, %rax
	movl	$511, %r8d
	movq	(%rdi,%rax,8), %rdx
	leaq	1744(%rsp), %rcx
	call	strncpy
.L289:
	movl	$1, %ebp
.L284:
	leal	1(%rbx), %r13d
	cmpl	%r13d, %esi
	jle	.L1273
.L378:
	leaq	.LC113(%rip), %rdx
	movslq	%r13d, %r14
	movq	(%rdi,%r14,8), %r12
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L275
	cmpb	$45, (%r12)
	jne	.L277
	cmpb	$104, 1(%r12)
	jne	.L277
	cmpb	$0, 2(%r12)
	je	.L275
.L277:
	leaq	.LC114(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1274
	leaq	.LC117(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	leal	1(%r13), %ebx
	testl	%eax, %eax
	jne	.L1275
.L279:
	cmpl	%ebx, %esi
	jle	.L1245
	testl	%ebp, %ebp
	je	.L283
	cmpl	$1, 720(%rsp)
	jne	.L288
.L283:
	movl	$1, 720(%rsp)
	jmp	.L1244
	.p2align 4,,10
	.p2align 3
.L285:
	leaq	.LC122(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L290
	cmpl	%ebx, %esi
	jle	.L1245
	testl	%ebp, %ebp
	je	.L292
	cmpl	$0, 720(%rsp)
	jne	.L288
.L292:
	movq	8(%rdi,%r14,8), %rbp
	xorl	%eax, %eax
	movl	$31, %r8d
	leaq	2256(%rsp), %rcx
	movl	%eax, 720(%rsp)
	movq	%rbp, %rdx
	call	strncpy
	movq	__imp__stricmp(%rip), %r12
	leaq	.LC89(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L1276
	leaq	.LC90(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	jne	.L294
	movl	$1, 728(%rsp)
	jmp	.L289
.L290:
	leaq	.LC124(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1277
	leaq	.LC126(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L300
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	movss	.LC83(%rip), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	ja	.L302
	movss	.LC127(%rip), %xmm2
	movaps	%xmm2, %xmm1
	cmpltss	%xmm0, %xmm1
	andps	%xmm1, %xmm2
	andnps	%xmm0, %xmm1
	orps	%xmm2, %xmm1
.L302:
	movss	%xmm1, 736(%rsp)
	jmp	.L284
.L1272:
	call	print_help
.L274:
	xorl	%eax, %eax
.L272:
	movaps	2320(%rsp), %xmm6
	movaps	2336(%rsp), %xmm7
	movaps	2352(%rsp), %xmm8
	movaps	2368(%rsp), %xmm9
	movaps	2384(%rsp), %xmm10
	movaps	2400(%rsp), %xmm11
	movaps	2416(%rsp), %xmm12
	movaps	2432(%rsp), %xmm13
	movaps	2448(%rsp), %xmm14
	movaps	2464(%rsp), %xmm15
	addq	$2488, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L275:
	call	print_help
	xorl	%ecx, %ecx
	call	exit
.L1276:
	xorl	%eax, %eax
	movl	%eax, 728(%rsp)
	jmp	.L289
.L300:
	leaq	.LC128(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L304
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 740(%rsp)
	jmp	.L284
.L1274:
	leaq	.LC116(%rip), %rcx
	leaq	.LC115(%rip), %rdx
	call	printf
	xorl	%ecx, %ecx
	call	exit
.L1245:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC119(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
.L282:
	movl	$1, %eax
	jmp	.L272
.L1277:
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atoi
	movl	%eax, %r12d
	cmpl	$8000, %eax
	movl	%eax, 732(%rsp)
	sete	%al
	cmpl	$16000, %r12d
	sete	%dl
	orl	%edx, %eax
	cmpl	$22050, %r12d
	sete	%dl
	orl	%edx, %eax
	cmpl	$44100, %r12d
	sete	%dl
	orb	%dl, %al
	jne	.L284
	cmpl	$48000, %r12d
	je	.L284
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC125(%rip), %rdx
	movl	%r12d, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
.L294:
	leaq	.LC91(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	jne	.L295
	movl	$2, 728(%rsp)
	jmp	.L289
.L288:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L282
.L304:
	leaq	.LC129(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1278
	leaq	.LC131(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L311
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L313
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L313:
	movss	%xmm0, 744(%rsp)
	jmp	.L284
.L1273:
	movl	728(%rsp), %edx
	orl	%edx, %ebp
	jne	.L379
.L422:
	movss	1068(%rsp), %xmm0
	movss	.LC164(%rip), %xmm7
	comiss	%xmm0, %xmm7
	jbe	.L380
	movss	%xmm6, 1068(%rsp)
	movaps	%xmm6, %xmm0
.L380:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 756(%rsp)
	movss	1072(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L382
	movss	%xmm6, 1072(%rsp)
	movaps	%xmm6, %xmm0
.L382:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 788(%rsp)
	movss	1076(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L384
	movss	%xmm6, 1076(%rsp)
	movaps	%xmm6, %xmm0
.L384:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 820(%rsp)
	movss	1080(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L386
	movss	%xmm6, 1080(%rsp)
	movaps	%xmm6, %xmm0
.L386:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 852(%rsp)
	movss	1084(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L388
	movss	%xmm6, 1084(%rsp)
	movaps	%xmm6, %xmm0
.L388:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 884(%rsp)
	movss	1088(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L390
	movss	%xmm6, 1088(%rsp)
	movaps	%xmm6, %xmm0
.L390:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 916(%rsp)
	movss	1092(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L392
	movss	%xmm6, 1092(%rsp)
	movaps	%xmm6, %xmm0
.L392:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 948(%rsp)
	movss	1096(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L394
	movss	%xmm6, 1096(%rsp)
	movaps	%xmm6, %xmm0
.L394:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 980(%rsp)
	movss	1100(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L396
	movss	%xmm6, 1100(%rsp)
	movaps	%xmm6, %xmm0
.L396:
	movss	.LC164(%rip), %xmm7
	movss	%xmm0, 1012(%rsp)
	movss	1104(%rsp), %xmm0
	comiss	%xmm0, %xmm7
	jbe	.L399
	movss	%xmm6, 1104(%rsp)
	movaps	%xmm6, %xmm0
.L399:
	movss	%xmm0, 1044(%rsp)
	movl	720(%rsp), %eax
	cmpl	$1, %eax
	je	.L1279
	cmpl	$2, %eax
	je	.L1280
.L429:
	cmpl	$0, 2300(%rsp)
	jne	.L1281
.L434:
	xorl	%ecx, %ecx
	call	_time64
	movl	720(%rsp), %esi
	xorl	$-559038242, %eax
	movl	732(%rsp), %ecx
	movss	736(%rsp), %xmm0
	movl	%eax, g_noise_state(%rip)
	cmpl	$2, %esi
	je	.L1282
	cmpl	$1, %esi
	jne	.L441
	movss	.LC50(%rip), %xmm7
	movss	1188(%rsp), %xmm1
	divss	%xmm7, %xmm1
	addss	.LC83(%rip), %xmm1
	movaps	%xmm1, %xmm2
	maxss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
.L441:
	pxor	%xmm8, %xmm8
	cvtsi2ssl	%ecx, %xmm8
	mulss	%xmm8, %xmm0
	cvttss2sil	%xmm0, %r13d
	testl	%r13d, %r13d
	jg	.L447
	leal	(%rcx,%rcx), %r13d
.L447:
	movl	$5760000, %eax
	movl	$4, %edx
	cmpl	%eax, %r13d
	cmovle	%r13d, %eax
	movl	%eax, %r15d
	cltq
	movq	%rax, %rcx
	movq	%rax, 336(%rsp)
	call	calloc
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1283
	movss	1136(%rsp), %xmm11
	comiss	.LC137(%rip), %xmm11
	ja	.L449
	movss	.LC92(%rip), %xmm11
.L449:
	movss	1144(%rsp), %xmm0
	comiss	.LC137(%rip), %xmm0
	ja	.L450
	movss	.LC93(%rip), %xmm0
.L450:
	movss	1140(%rsp), %xmm7
	comiss	.LC137(%rip), %xmm7
	ja	.L451
	movss	.LC94(%rip), %xmm7
.L451:
	mulss	.LC183(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	xorl	%r11d, %r11d
	cmpl	$2, %esi
	movl	$0x00000000, 2312(%rsp)
	movaps	%xmm0, %xmm12
	movq	%r11, 772(%rsp)
	movq	%r11, 804(%rsp)
	movq	%r11, 836(%rsp)
	movq	%r11, 868(%rsp)
	movq	%r11, 900(%rsp)
	movq	%r11, 932(%rsp)
	movq	%r11, 964(%rsp)
	movq	%r11, 996(%rsp)
	movq	%r11, 1028(%rsp)
	movq	%r11, 1060(%rsp)
	movq	%r11, 2304(%rsp)
	je	.L1284
.L895:
	xorl	%r10d, %r10d
	xorl	%r12d, %r12d
	movq	%r10, 320(%rsp)
	movq	%r10, 312(%rsp)
.L452:
	movss	.LC186(%rip), %xmm0
	movss	.LC98(%rip), %xmm1
	mulss	%xmm8, %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	call	expf
	movl	720(%rsp), %eax
	movaps	%xmm0, %xmm15
	cmpl	$2, %eax
	movl	%eax, 56(%rsp)
	je	.L1285
.L462:
	movss	1108(%rsp), %xmm14
	movss	1112(%rsp), %xmm10
	movss	1116(%rsp), %xmm9
.L463:
	testl	%r13d, %r13d
	jle	.L841
	mulss	.LC187(%rip), %xmm11
	movl	2292(%rsp), %eax
	movaps	%xmm11, %xmm0
	divss	%xmm8, %xmm0
	movl	%eax, 344(%rsp)
	call	tanf
	movaps	%xmm6, %xmm5
	movss	.LC188(%rip), %xmm11
	movaps	%xmm0, %xmm2
	movss	.LC189(%rip), %xmm3
	mulss	%xmm11, %xmm2
	mulss	%xmm0, %xmm0
	mulss	.LC190(%rip), %xmm7
	movaps	%xmm2, %xmm1
	addss	%xmm6, %xmm1
	divss	%xmm8, %xmm7
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm5
	movaps	%xmm0, %xmm1
	subss	%xmm6, %xmm1
	addss	%xmm1, %xmm1
	movss	%xmm5, 240(%rsp)
	mulss	%xmm5, %xmm1
	mulss	%xmm5, %xmm3
	movss	%xmm1, 248(%rsp)
	movaps	%xmm6, %xmm1
	movss	%xmm3, 244(%rsp)
	subss	%xmm2, %xmm1
	movaps	%xmm6, %xmm3
	subss	%xmm12, %xmm3
	addss	%xmm0, %xmm1
	movaps	%xmm7, %xmm0
	movaps	%xmm6, %xmm7
	movss	%xmm3, 300(%rsp)
	mulss	%xmm5, %xmm1
	movss	%xmm1, 252(%rsp)
	call	cosf
	movss	.LC189(%rip), %xmm1
	mulss	%xmm12, %xmm1
	mulss	%xmm12, %xmm12
	mulss	%xmm0, %xmm1
	movss	.LC191(%rip), %xmm0
	movss	%xmm12, 308(%rsp)
	divss	%xmm8, %xmm0
	movss	%xmm1, 304(%rsp)
	call	tanf
	movss	.LC189(%rip), %xmm3
	mulss	%xmm0, %xmm11
	cmpl	$2, 56(%rsp)
	movq	1152(%rsp), %r14
	mulss	%xmm0, %xmm0
	movaps	%xmm11, %xmm1
	sete	%dl
	testq	%r12, %r12
	addss	%xmm6, %xmm1
	setne	%al
	andl	%eax, %edx
	movb	%dl, 214(%rsp)
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm7
	movaps	%xmm0, %xmm1
	subss	%xmm6, %xmm1
	addss	%xmm1, %xmm1
	movss	%xmm7, 284(%rsp)
	mulss	%xmm7, %xmm1
	mulss	%xmm7, %xmm3
	movss	%xmm1, 292(%rsp)
	movaps	%xmm6, %xmm1
	movss	%xmm3, 288(%rsp)
	subss	%xmm11, %xmm1
	addss	%xmm0, %xmm1
	movss	.LC192(%rip), %xmm0
	mulss	%xmm8, %xmm0
	mulss	%xmm7, %xmm1
	movss	1108(%rsp), %xmm7
	movss	%xmm7, 200(%rsp)
	movss	1116(%rsp), %xmm7
	cvttss2sil	%xmm0, %r8d
	movss	.LC193(%rip), %xmm0
	movss	%xmm7, 204(%rsp)
	movss	740(%rsp), %xmm7
	movss	%xmm1, 296(%rsp)
	mulss	%xmm8, %xmm0
	movss	%xmm7, 216(%rsp)
	movss	1120(%rsp), %xmm7
	movss	%xmm7, 48(%rsp)
	movss	1128(%rsp), %xmm7
	cvttss2sil	%xmm0, %esi
	movss	%xmm7, 76(%rsp)
	testl	%esi, %esi
	movl	%esi, 280(%rsp)
	movl	%esi, %eax
	setg	215(%rsp)
	movss	1132(%rsp), %xmm7
	movl	2296(%rsp), %esi
	movss	844(%rsp), %xmm0
	movss	%xmm7, 80(%rsp)
	movss	812(%rsp), %xmm2
	movss	1112(%rsp), %xmm7
	unpcklps	%xmm0, %xmm2
	movl	%esi, 84(%rsp)
	movl	%r15d, %esi
	movss	780(%rsp), %xmm1
	movss	748(%rsp), %xmm0
	subl	%eax, %esi
	testl	%r8d, %r8d
	movss	%xmm7, 208(%rsp)
	movss	744(%rsp), %xmm7
	movl	%esi, 92(%rsp)
	unpcklps	%xmm1, %xmm0
	movq	1100(%rsp), %rax
	movlhps	%xmm2, %xmm0
	movss	972(%rsp), %xmm1
	movss	%xmm7, 88(%rsp)
	movss	940(%rsp), %xmm3
	movups	1068(%rsp), %xmm7
	unpcklps	%xmm1, %xmm3
	movss	908(%rsp), %xmm2
	movq	%rax, 128(%rsp)
	movss	876(%rsp), %xmm1
	movaps	%xmm7, 96(%rsp)
	movups	1084(%rsp), %xmm7
	unpcklps	%xmm2, %xmm1
	movlhps	%xmm3, %xmm1
	movl	724(%rsp), %r13d
	movss	1004(%rsp), %xmm4
	movaps	%xmm7, 112(%rsp)
	movss	1036(%rsp), %xmm5
	jle	.L896
	movss	.LC50(%rip), %xmm7
	cmpl	%r8d, %r15d
	movl	%r8d, %r11d
	movss	%xmm14, 144(%rsp)
	cmovle	%r15d, %r11d
	xorl	%r9d, %r9d
	xorl	%ebp, %ebp
	movl	$0x00000000, 256(%rsp)
	movss	%xmm7, 140(%rsp)
	movss	.LC204(%rip), %xmm7
	movl	$0x00000000, 260(%rsp)
	movss	%xmm7, 136(%rsp)
	pxor	%xmm7, %xmm7
	cvtsi2ssl	%r8d, %xmm7
	movl	$0x00000000, 264(%rsp)
	movl	$0x00000000, 268(%rsp)
	movl	$0x00000000, 164(%rsp)
	movl	$0x00000000, 160(%rsp)
	movl	%r9d, 220(%rsp)
	movl	%r15d, 332(%rsp)
	movl	%r8d, 348(%rsp)
	movl	%r11d, 232(%rsp)
	movl	%r13d, 192(%rsp)
	movq	%rbx, 224(%rsp)
	movss	%xmm15, 236(%rsp)
	movss	%xmm7, 272(%rsp)
	pxor	%xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L650:
	pxor	%xmm3, %xmm3
	cvtsi2ssl	%ebp, %xmm3
	testq	%r14, %r14
	movss	848(%rsp), %xmm2
	movaps	%xmm0, 368(%rsp)
	movq	128(%rsp), %rax
	movss	816(%rsp), %xmm13
	movaps	%xmm1, 384(%rsp)
	movss	784(%rsp), %xmm11
	movss	%xmm4, 400(%rsp)
	movaps	%xmm3, %xmm12
	unpcklps	%xmm2, %xmm13
	movss	752(%rsp), %xmm2
	movss	%xmm3, 172(%rsp)
	divss	%xmm8, %xmm12
	movaps	96(%rsp), %xmm3
	movss	%xmm5, 404(%rsp)
	movss	976(%rsp), %xmm0
	unpcklps	%xmm11, %xmm2
	movq	%rax, 496(%rsp)
	movlhps	%xmm13, %xmm2
	movss	944(%rsp), %xmm11
	movaps	%xmm3, 464(%rsp)
	movaps	112(%rsp), %xmm3
	movaps	%xmm2, 416(%rsp)
	movss	912(%rsp), %xmm1
	unpcklps	%xmm0, %xmm11
	movss	880(%rsp), %xmm0
	movaps	%xmm3, 480(%rsp)
	unpcklps	%xmm1, %xmm0
	movlhps	%xmm11, %xmm0
	movaps	%xmm0, 432(%rsp)
	movss	1008(%rsp), %xmm1
	movss	1040(%rsp), %xmm0
	unpcklps	%xmm0, %xmm1
	movlps	%xmm1, 448(%rsp)
	mulss	140(%rsp), %xmm12
	je	.L465
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jle	.L465
	movss	(%r14), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1286
	cmpl	$1, 56(%rsp)
	je	.L472
	movaps	%xmm12, %xmm2
	movq	%r14, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm11
.L473:
	cmpb	$0, 214(%rsp)
	jne	.L1287
	movss	200(%rsp), %xmm5
	movss	%xmm6, 176(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm5, 168(%rsp)
.L475:
	movss	48(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L519
	movss	.LC190(%rip), %xmm0
	mulss	1124(%rsp), %xmm0
	divss	%xmm8, %xmm0
	addss	2308(%rsp), %xmm0
	comiss	.LC190(%rip), %xmm0
	jb	.L521
	subss	.LC190(%rip), %xmm0
.L521:
	movss	%xmm0, 2308(%rsp)
	call	sinf
	mulss	48(%rsp), %xmm0
	addss	%xmm0, %xmm11
.L519:
	movss	76(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L523
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	divss	.LC2(%rip), %xmm5
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	.LC203(%rip), %xmm0
	movl	%eax, g_noise_state(%rip)
	mulss	%xmm5, %xmm0
	addss	%xmm6, %xmm0
	mulss	%xmm0, %xmm11
.L523:
	movss	80(%rsp), %xmm4
	movaps	%xmm6, %xmm12
	comiss	%xmm7, %xmm4
	jbe	.L525
	movl	g_noise_state(%rip), %edx
	pxor	%xmm12, %xmm12
	divss	.LC2(%rip), %xmm4
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm12
	movl	%eax, g_noise_state(%rip)
	mulss	.LC203(%rip), %xmm12
	mulss	%xmm4, %xmm12
	addss	%xmm6, %xmm12
.L525:
	comiss	%xmm7, %xmm11
	jbe	.L527
	movss	.LC97(%rip), %xmm0
	comiss	%xmm11, %xmm0
	ja	.L913
	movss	.LC92(%rip), %xmm0
	movaps	%xmm0, %xmm1
	cmpltss	%xmm11, %xmm1
	andps	%xmm1, %xmm0
	andnps	%xmm11, %xmm1
	orps	%xmm0, %xmm1
	movaps	%xmm1, %xmm11
.L527:
	comiss	%xmm8, %xmm7
	jnb	.L529
	cmpl	$0, 192(%rsp)
	je	.L530
	movq	64(%rsp), %r13
	leaq	464(%rsp), %r15
	movss	%xmm9, 276(%rsp)
	leaq	416(%rsp), %rdi
	movss	%xmm10, 328(%rsp)
	leaq	368(%rsp), %rsi
	leaq	504(%rsp), %rbx
	jmp	.L534
	.p2align 4,,10
	.p2align 3
.L1288:
	comiss	%xmm0, %xmm7
	jnb	.L532
	mulss	.LC183(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC190(%rip), %xmm2
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm2
	divss	%xmm8, %xmm2
	movaps	%xmm2, %xmm0
	call	cosf
	movss	.LC189(%rip), %xmm1
	movaps	%xmm0, %xmm2
	movaps	%xmm9, %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm9, %xmm1
	movss	%xmm0, 48(%r13)
	movaps	%xmm6, %xmm0
	mulss	%xmm2, %xmm1
	subss	%xmm9, %xmm0
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 40(%r13)
.L533:
	addq	$4, %r15
	addq	$32, %r13
	addq	$4, %rdi
	addq	$4, %rsi
	cmpq	%rbx, %r15
	je	.L1250
.L534:
	movss	(%r15), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rsi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm3
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%rdi), %xmm0
	movss	%xmm1, 36(%r13)
	unpcklps	%xmm0, %xmm3
	movlps	%xmm3, 28(%r13)
	jb	.L1288
.L532:
	movq	$0, 40(%r13)
	movl	$0x00000000, 48(%r13)
	jmp	.L533
.L379:
	cmpl	$1, %edx
	je	.L887
	leaq	g_preset_impulsive(%rip), %rax
	cmpl	$2, %edx
	jne	.L1289
.L400:
	leaq	748(%rsp), %rdx
	xorl	%ecx, %ecx
.L401:
	movaps	(%rax,%rcx), %xmm0
	subq	$-128, %rdx
	movups	40(%rax,%rcx), %xmm2
	addq	$16, %rcx
	movaps	%xmm0, %xmm1
	unpcklps	%xmm2, %xmm1
	unpckhps	%xmm2, %xmm0
	movq	%xmm1, -128(%rdx)
	movhps	%xmm1, -96(%rdx)
	movq	%xmm0, -64(%rdx)
	movhps	%xmm0, -32(%rdx)
	cmpq	$32, %rcx
	jne	.L401
	movq	32(%rax), %xmm0
	movq	72(%rax), %xmm1
	movaps	%xmm0, %xmm2
	movq	100(%rax), %rdx
	unpcklps	%xmm1, %xmm2
	unpcklps	%xmm1, %xmm0
	movaps	96(%rax), %xmm1
	shufps	$78, %xmm0, %xmm0
	cmpl	$0, 368(%rsp)
	movlps	%xmm0, 1036(%rsp)
	movaps	80(%rax), %xmm0
	movlps	%xmm2, 1004(%rsp)
	movq	%rdx, 1124(%rsp)
	shufps	$160, %xmm0, %xmm1
	shufps	$36, %xmm1, %xmm0
	movss	92(%rax), %xmm1
	movups	%xmm0, 1108(%rsp)
	movss	108(%rax), %xmm0
	movss	%xmm1, 740(%rsp)
	movss	%xmm0, 1132(%rsp)
	jne	.L402
	movss	(%rax), %xmm0
	movss	%xmm0, 748(%rsp)
.L402:
	cmpl	$0, 416(%rsp)
	jne	.L403
	movss	40(%rax), %xmm0
	movss	%xmm0, 752(%rsp)
.L403:
	cmpl	$0, 372(%rsp)
	jne	.L404
	movss	4(%rax), %xmm0
	movss	%xmm0, 780(%rsp)
.L404:
	cmpl	$0, 420(%rsp)
	jne	.L405
	movss	44(%rax), %xmm0
	movss	%xmm0, 784(%rsp)
.L405:
	cmpl	$0, 376(%rsp)
	jne	.L406
	movss	8(%rax), %xmm0
	movss	%xmm0, 812(%rsp)
.L406:
	cmpl	$0, 424(%rsp)
	jne	.L407
	movss	48(%rax), %xmm0
	movss	%xmm0, 816(%rsp)
.L407:
	cmpl	$0, 380(%rsp)
	jne	.L408
	movss	12(%rax), %xmm0
	movss	%xmm0, 844(%rsp)
.L408:
	cmpl	$0, 428(%rsp)
	jne	.L409
	movss	52(%rax), %xmm0
	movss	%xmm0, 848(%rsp)
.L409:
	cmpl	$0, 384(%rsp)
	jne	.L410
	movss	16(%rax), %xmm0
	movss	%xmm0, 876(%rsp)
.L410:
	cmpl	$0, 432(%rsp)
	jne	.L411
	movss	56(%rax), %xmm0
	movss	%xmm0, 880(%rsp)
.L411:
	cmpl	$0, 388(%rsp)
	jne	.L412
	movss	20(%rax), %xmm0
	movss	%xmm0, 908(%rsp)
.L412:
	cmpl	$0, 436(%rsp)
	jne	.L413
	movss	60(%rax), %xmm0
	movss	%xmm0, 912(%rsp)
.L413:
	cmpl	$0, 392(%rsp)
	jne	.L414
	movss	24(%rax), %xmm0
	movss	%xmm0, 940(%rsp)
.L414:
	cmpl	$0, 440(%rsp)
	jne	.L415
	movss	64(%rax), %xmm0
	movss	%xmm0, 944(%rsp)
.L415:
	cmpl	$0, 396(%rsp)
	jne	.L416
	movss	28(%rax), %xmm0
	movss	%xmm0, 972(%rsp)
.L416:
	cmpl	$0, 444(%rsp)
	jne	.L417
	movss	68(%rax), %xmm0
	movss	%xmm0, 976(%rsp)
.L417:
	cmpl	$0, 400(%rsp)
	jne	.L418
	movss	32(%rax), %xmm0
	movss	%xmm0, 1004(%rsp)
.L418:
	cmpl	$0, 448(%rsp)
	jne	.L419
	movss	72(%rax), %xmm0
	movss	%xmm0, 1008(%rsp)
.L419:
	cmpl	$0, 404(%rsp)
	jne	.L420
	movss	36(%rax), %xmm0
	movss	%xmm0, 1036(%rsp)
.L420:
	cmpl	$0, 452(%rsp)
	jne	.L422
	movss	76(%rax), %xmm0
	movss	%xmm0, 1040(%rsp)
	jmp	.L422
.L465:
	cmpl	$1, 56(%rsp)
	movss	216(%rsp), %xmm11
	jne	.L473
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	je	.L902
.L1247:
	movq	1168(%rsp), %rcx
	movss	(%rcx), %xmm0
	comiss	%xmm12, %xmm0
	jb	.L1290
	movl	144(%rcx), %edx
	movq	%rcx, %rax
.L482:
	leaq	4(%rax), %rsi
	movl	$10, %ecx
	leaq	368(%rsp), %rdi
	rep movsl
	leaq	44(%rax), %rsi
	movl	$10, %ecx
	leaq	416(%rsp), %rdi
	rep movsl
.L498:
	testl	%edx, %edx
	movaps	%xmm6, %xmm0
	je	.L497
	movss	104(%rax,%rcx), %xmm0
.L497:
	movss	%xmm0, 464(%rsp,%rcx)
	addq	$4, %rcx
	cmpq	$40, %rcx
	jne	.L498
	movss	84(%rax), %xmm3
	movss	96(%rax), %xmm11
	movss	%xmm3, 168(%rsp)
	movss	100(%rax), %xmm3
	movss	92(%rax), %xmm15
	movss	%xmm3, 176(%rsp)
	movss	88(%rax), %xmm13
.L874:
	testq	%r14, %r14
	je	.L475
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jle	.L475
.L1265:
	movss	(%r14), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1249
.L1213:
	movaps	%xmm12, %xmm2
	movq	%r14, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm11
	jmp	.L475
.L1250:
	movss	276(%rsp), %xmm9
	movss	328(%rsp), %xmm10
.L535:
	movss	236(%rsp), %xmm5
	movaps	%xmm6, %xmm1
	movss	168(%rsp), %xmm0
	subss	%xmm5, %xmm1
	mulss	%xmm5, %xmm14
	movss	136(%rsp), %xmm4
	mulss	%xmm5, %xmm10
	comiss	144(%rsp), %xmm4
	mulss	%xmm5, %xmm9
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm13
	mulss	%xmm15, %xmm1
	addss	%xmm0, %xmm14
	addss	%xmm13, %xmm10
	addss	%xmm1, %xmm9
	jbe	.L543
	comiss	.LC204(%rip), %xmm14
	jb	.L543
	movss	%xmm7, 2304(%rsp)
	comiss	%xmm7, %xmm11
	jbe	.L550
.L546:
	movaps	%xmm8, %xmm1
	movaps	%xmm6, %xmm0
	divss	%xmm11, %xmm1
	divss	%xmm1, %xmm0
	addss	2304(%rsp), %xmm0
	comiss	%xmm6, %xmm0
	jb	.L549
	subss	%xmm6, %xmm0
.L549:
	movss	%xmm0, 2304(%rsp)
	movl	728(%rsp), %eax
	cmpl	$2, %eax
	je	.L1291
	movss	.LC207(%rip), %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L1217
	movaps	%xmm0, %xmm2
	divss	%xmm1, %xmm2
.L557:
	addss	%xmm2, %xmm2
	subl	$1, %eax
	subss	%xmm6, %xmm2
	jne	.L553
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	mulss	.LC209(%rip), %xmm2
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	.LC203(%rip), %xmm0
	movl	%eax, g_noise_state(%rip)
	mulss	.LC210(%rip), %xmm0
	addss	%xmm0, %xmm2
.L553:
	mulss	%xmm14, %xmm2
	mulss	%xmm12, %xmm2
.L547:
	comiss	.LC205(%rip), %xmm10
	pxor	%xmm1, %xmm1
	jbe	.L558
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	movss	240(%rsp), %xmm4
	movss	160(%rsp), %xmm1
	movss	248(%rsp), %xmm5
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	.LC203(%rip), %xmm0
	movl	%eax, g_noise_state(%rip)
	mulss	%xmm0, %xmm4
	mulss	244(%rsp), %xmm0
	addss	%xmm4, %xmm1
	mulss	%xmm1, %xmm5
	subss	%xmm5, %xmm0
	addss	164(%rsp), %xmm0
	movss	%xmm0, 160(%rsp)
	movss	252(%rsp), %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm10, %xmm1
	subss	%xmm0, %xmm4
	movss	%xmm4, 164(%rsp)
.L558:
	comiss	.LC205(%rip), %xmm9
	pxor	%xmm11, %xmm11
	jbe	.L560
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cmpl	$0, 220(%rsp)
	cvtsi2ssl	%eax, %xmm0
	mulss	.LC203(%rip), %xmm0
	je	.L562
	movss	284(%rsp), %xmm4
	movss	260(%rsp), %xmm11
	movss	292(%rsp), %xmm5
	mulss	%xmm0, %xmm4
	mulss	288(%rsp), %xmm0
	addss	%xmm4, %xmm11
	mulss	%xmm11, %xmm5
	subss	%xmm5, %xmm0
	addss	256(%rsp), %xmm0
	movss	%xmm0, 260(%rsp)
	movss	296(%rsp), %xmm0
	mulss	%xmm11, %xmm0
	subss	%xmm0, %xmm4
	movss	%xmm4, 256(%rsp)
.L563:
	mulss	%xmm9, %xmm11
	movl	%eax, g_noise_state(%rip)
.L560:
	movl	192(%rsp), %r9d
	addss	%xmm1, %xmm2
	movss	748(%rsp), %xmm0
	testl	%r9d, %r9d
	je	.L564
	comiss	%xmm7, %xmm0
	pxor	%xmm12, %xmm12
	jbe	.L565
	movss	760(%rsp), %xmm12
	ucomiss	%xmm7, %xmm12
	jp	.L567
	je	.L1292
.L567:
	movss	772(%rsp), %xmm4
	mulss	%xmm2, %xmm12
	movss	764(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm12
	movss	768(%rsp), %xmm1
	mulss	776(%rsp), %xmm1
	subss	%xmm1, %xmm12
	movaps	%xmm12, %xmm1
	mulss	756(%rsp), %xmm12
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 772(%rsp)
.L569:
	addss	%xmm7, %xmm12
.L565:
	movl	780(%rsp), %r8d
	movd	%r8d, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L570
	movss	792(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L572
	je	.L1293
.L572:
	movss	804(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	796(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	800(%rsp), %xmm1
	mulss	808(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	788(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 804(%rsp)
	movaps	%xmm5, %xmm1
.L574:
	addss	%xmm1, %xmm12
.L570:
	movl	812(%rsp), %eax
	movd	%eax, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L575
	movss	824(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L577
	je	.L1294
.L577:
	movss	836(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	828(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	832(%rsp), %xmm1
	mulss	840(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	820(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 836(%rsp)
	movaps	%xmm5, %xmm1
.L579:
	addss	%xmm1, %xmm12
.L575:
	movl	844(%rsp), %r9d
	movd	%r9d, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L580
	movss	856(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L582
	je	.L1295
.L582:
	movss	868(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	860(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	864(%rsp), %xmm1
	mulss	872(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	852(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 868(%rsp)
	movaps	%xmm5, %xmm1
.L584:
	addss	%xmm1, %xmm12
.L580:
	movss	876(%rsp), %xmm1
	comiss	%xmm7, %xmm1
	jbe	.L585
	movss	888(%rsp), %xmm13
	ucomiss	%xmm7, %xmm13
	jp	.L587
	je	.L1296
.L587:
	movss	900(%rsp), %xmm5
	mulss	%xmm2, %xmm13
	movss	892(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm13
	movss	896(%rsp), %xmm4
	mulss	904(%rsp), %xmm4
	subss	%xmm4, %xmm13
	movaps	%xmm13, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 900(%rsp)
	movss	884(%rsp), %xmm4
	mulss	%xmm13, %xmm4
.L589:
	addss	%xmm4, %xmm12
.L585:
	movss	908(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L590
	movss	920(%rsp), %xmm13
	ucomiss	%xmm7, %xmm13
	jp	.L592
	je	.L1297
.L592:
	movss	932(%rsp), %xmm5
	mulss	%xmm2, %xmm13
	movss	924(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm13
	movss	928(%rsp), %xmm4
	mulss	936(%rsp), %xmm4
	subss	%xmm4, %xmm13
	movaps	%xmm13, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 932(%rsp)
	movss	916(%rsp), %xmm4
	mulss	%xmm13, %xmm4
.L594:
	addss	%xmm4, %xmm12
.L590:
	movss	940(%rsp), %xmm13
	comiss	%xmm7, %xmm13
	jbe	.L595
	movss	952(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L597
	je	.L1298
.L597:
	movss	964(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	movss	956(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm15
	movss	960(%rsp), %xmm4
	mulss	968(%rsp), %xmm4
	subss	%xmm4, %xmm15
	movaps	%xmm15, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 964(%rsp)
	movss	948(%rsp), %xmm4
	mulss	%xmm15, %xmm4
.L599:
	addss	%xmm4, %xmm12
.L595:
	movl	972(%rsp), %ecx
	movd	%ecx, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L600
	movss	984(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L602
	je	.L1299
.L602:
	movss	996(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	movss	988(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm15
	movss	992(%rsp), %xmm4
	mulss	1000(%rsp), %xmm4
	subss	%xmm4, %xmm15
	movaps	%xmm15, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 996(%rsp)
	movss	980(%rsp), %xmm4
	mulss	%xmm15, %xmm4
.L604:
	addss	%xmm4, %xmm12
.L600:
	movss	1004(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L605
	movss	1016(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L607
	je	.L1300
.L607:
	movss	1028(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	mulss	1020(%rsp), %xmm5
	subss	%xmm5, %xmm15
	movss	1024(%rsp), %xmm5
	mulss	1032(%rsp), %xmm5
	subss	%xmm5, %xmm15
	movd	%xmm15, %ebx
	movaps	%xmm15, %xmm5
	movss	1028(%rsp), %xmm15
	unpcklps	%xmm15, %xmm5
	movlps	%xmm5, 1028(%rsp)
	movd	%ebx, %xmm5
	mulss	1012(%rsp), %xmm5
.L609:
	addss	%xmm5, %xmm12
.L605:
	movss	1036(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L610
	movss	1048(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L612
	je	.L1301
.L612:
	mulss	%xmm2, %xmm15
	movss	1060(%rsp), %xmm2
	mulss	1052(%rsp), %xmm2
	subss	%xmm2, %xmm15
	movss	1056(%rsp), %xmm2
	mulss	1064(%rsp), %xmm2
	subss	%xmm2, %xmm15
	movd	%xmm15, %ebx
	movaps	%xmm15, %xmm2
	movss	1060(%rsp), %xmm15
	unpcklps	%xmm15, %xmm2
	movd	%ebx, %xmm15
	movlps	%xmm2, 1060(%rsp)
	mulss	1044(%rsp), %xmm15
.L614:
	addss	%xmm15, %xmm12
.L610:
	mulss	.LC210(%rip), %xmm11
	addss	%xmm12, %xmm11
.L615:
	movd	%r9d, %xmm15
	movd	%eax, %xmm2
	unpcklps	%xmm3, %xmm1
	unpcklps	%xmm15, %xmm2
	movd	%r8d, %xmm15
	movl	84(%rsp), %r8d
	unpcklps	%xmm15, %xmm0
	movlhps	%xmm2, %xmm0
	movd	%ecx, %xmm2
	unpcklps	%xmm2, %xmm13
	movlhps	%xmm13, %xmm1
	testl	%r8d, %r8d
	je	.L646
	movss	.LC211(%rip), %xmm2
	mulss	2312(%rsp), %xmm2
	movss	%xmm11, 2312(%rsp)
	subss	%xmm2, %xmm11
.L646:
	movss	176(%rsp), %xmm2
	mulss	88(%rsp), %xmm2
	cmpl	%ebp, 92(%rsp)
	mulss	%xmm11, %xmm2
	movss	172(%rsp), %xmm11
	divss	272(%rsp), %xmm11
	mulss	%xmm11, %xmm2
	jg	.L647
	cmpb	$0, 215(%rsp)
	jne	.L1302
.L647:
	movq	224(%rsp), %rax
	movss	%xmm2, (%rax,%rbp,4)
	addq	$1, %rbp
	cmpl	%ebp, 232(%rsp)
	jle	.L1242
.L648:
	movss	%xmm14, 144(%rsp)
	jmp	.L650
	.p2align 4,,10
	.p2align 3
.L543:
	comiss	%xmm7, %xmm11
	jbe	.L550
	comiss	.LC205(%rip), %xmm14
	ja	.L546
.L550:
	pxor	%xmm2, %xmm2
	jmp	.L547
.L564:
	comiss	%xmm7, %xmm0
	jbe	.L616
	movss	760(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1017
	je	.L918
.L1017:
	movss	772(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	764(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	776(%rsp), %xmm2
	mulss	768(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 772(%rsp)
	movss	756(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L616:
	movl	780(%rsp), %r8d
	movd	%r8d, %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L619
	movss	792(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1019
	je	.L919
.L1019:
	movss	804(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	796(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	808(%rsp), %xmm2
	mulss	800(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 804(%rsp)
	movss	788(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L619:
	movl	812(%rsp), %eax
	movd	%eax, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L622
	movss	824(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1021
	je	.L920
.L1021:
	movss	836(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	828(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	840(%rsp), %xmm2
	mulss	832(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 836(%rsp)
	movss	820(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L622:
	movl	844(%rsp), %r9d
	movd	%r9d, %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L625
	movss	856(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1023
	je	.L921
.L1023:
	movss	868(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	860(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	872(%rsp), %xmm2
	mulss	864(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 868(%rsp)
	movss	852(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L625:
	movss	876(%rsp), %xmm1
	comiss	%xmm7, %xmm1
	jbe	.L628
	movss	888(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1025
	je	.L922
.L1025:
	movss	900(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	892(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	904(%rsp), %xmm2
	mulss	896(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	884(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 900(%rsp)
	movaps	%xmm4, %xmm2
.L628:
	movss	908(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L631
	movss	920(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1027
	je	.L923
.L1027:
	movss	932(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	924(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	936(%rsp), %xmm2
	mulss	928(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	916(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 932(%rsp)
	movaps	%xmm4, %xmm2
.L631:
	movss	940(%rsp), %xmm13
	comiss	%xmm7, %xmm13
	jbe	.L634
	movss	952(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1029
	je	.L924
.L1029:
	movss	964(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	956(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	968(%rsp), %xmm2
	mulss	960(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	948(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 964(%rsp)
	movaps	%xmm4, %xmm2
.L634:
	movl	972(%rsp), %ecx
	movd	%ecx, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L637
	movss	984(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1031
	je	.L925
.L1031:
	movss	996(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	988(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	1000(%rsp), %xmm2
	mulss	992(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	980(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 996(%rsp)
	movaps	%xmm4, %xmm2
.L637:
	movss	1004(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L640
	movss	1016(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L1033
	je	.L926
.L1033:
	movss	1028(%rsp), %xmm12
	mulss	%xmm2, %xmm5
	movss	1020(%rsp), %xmm2
	mulss	%xmm12, %xmm2
	subss	%xmm2, %xmm5
	movss	1024(%rsp), %xmm2
	mulss	1032(%rsp), %xmm2
	subss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	mulss	1012(%rsp), %xmm5
	unpcklps	%xmm12, %xmm2
	movlps	%xmm2, 1028(%rsp)
	movaps	%xmm5, %xmm2
.L640:
	movss	1036(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L643
	movss	1048(%rsp), %xmm12
	ucomiss	%xmm7, %xmm12
	jp	.L1035
	je	.L927
.L1035:
	movss	1060(%rsp), %xmm15
	mulss	%xmm2, %xmm12
	movss	1052(%rsp), %xmm2
	mulss	%xmm15, %xmm2
	subss	%xmm2, %xmm12
	movss	1056(%rsp), %xmm2
	mulss	1064(%rsp), %xmm2
	subss	%xmm2, %xmm12
	movaps	%xmm12, %xmm2
	unpcklps	%xmm15, %xmm2
	movlps	%xmm2, 1060(%rsp)
	movss	1044(%rsp), %xmm2
	mulss	%xmm12, %xmm2
.L643:
	mulss	.LC60(%rip), %xmm11
	addss	%xmm2, %xmm11
	jmp	.L615
.L529:
	movq	464(%rsp), %xmm2
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%edi, %edi
	pxor	%xmm0, %xmm0
	movaps	%xmm0, %xmm1
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	movq	%xmm2, %xmm4
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	movq	.LC54(%rip), %xmm3
	cmpltps	%xmm4, %xmm1
	movq	%r10, 764(%rsp)
	movq	368(%rsp), %xmm4
	xorl	%r15d, %r15d
	movq	416(%rsp), %xmm5
	movq	%r11, 796(%rsp)
	movq	%rbx, 828(%rsp)
	andps	%xmm1, %xmm2
	andnps	%xmm3, %xmm1
	orps	%xmm1, %xmm2
	movaps	%xmm4, %xmm1
	movss	%xmm2, 276(%rsp)
	psrlq	$32, %xmm2
	unpcklps	%xmm5, %xmm1
	unpcklps	%xmm5, %xmm4
	movlps	%xmm1, 748(%rsp)
	shufps	$78, %xmm4, %xmm4
	movss	276(%rsp), %xmm1
	movlps	%xmm2, 788(%rsp)
	movq	472(%rsp), %xmm2
	movlps	%xmm1, 756(%rsp)
	movaps	%xmm0, %xmm1
	movq	424(%rsp), %xmm5
	movlps	%xmm4, 780(%rsp)
	movq	%xmm2, %xmm4
	cmpltps	%xmm4, %xmm1
	movq	%rsi, 860(%rsp)
	movq	376(%rsp), %xmm4
	movq	%rdi, 892(%rsp)
	andps	%xmm1, %xmm2
	andnps	%xmm3, %xmm1
	orps	%xmm1, %xmm2
	movaps	%xmm4, %xmm1
	movss	%xmm2, 276(%rsp)
	unpcklps	%xmm5, %xmm1
	unpcklps	%xmm5, %xmm4
	psrlq	$32, %xmm2
	movlps	%xmm1, 812(%rsp)
	shufps	$78, %xmm4, %xmm4
	movss	276(%rsp), %xmm1
	movlps	%xmm2, 852(%rsp)
	movq	480(%rsp), %xmm2
	movlps	%xmm1, 820(%rsp)
	movaps	%xmm0, %xmm1
	movq	432(%rsp), %xmm5
	movlps	%xmm4, 844(%rsp)
	movq	%xmm2, %xmm4
	cmpltps	%xmm4, %xmm1
	movq	384(%rsp), %xmm4
	andps	%xmm1, %xmm2
	andnps	%xmm3, %xmm1
	orps	%xmm1, %xmm2
	movaps	%xmm4, %xmm1
	movss	%xmm2, 276(%rsp)
	unpcklps	%xmm5, %xmm1
	unpcklps	%xmm5, %xmm4
	psrlq	$32, %xmm2
	movlps	%xmm1, 876(%rsp)
	shufps	$78, %xmm4, %xmm4
	movss	276(%rsp), %xmm1
	movlps	%xmm4, 908(%rsp)
	movlps	%xmm1, 884(%rsp)
	movaps	%xmm0, %xmm1
	movlps	%xmm2, 916(%rsp)
	movq	488(%rsp), %xmm2
	movq	440(%rsp), %xmm5
	movq	%rax, 988(%rsp)
	xorl	%eax, %eax
	movq	%xmm2, %xmm4
	movq	%rax, 1020(%rsp)
	xorl	%eax, %eax
	cmpltps	%xmm4, %xmm1
	movq	%r13, 924(%rsp)
	movq	392(%rsp), %xmm4
	movq	%r15, 956(%rsp)
	movq	%rax, 1052(%rsp)
	andps	%xmm1, %xmm2
	andnps	%xmm3, %xmm1
	orps	%xmm1, %xmm2
	movaps	%xmm4, %xmm1
	movss	%xmm2, 276(%rsp)
	unpcklps	%xmm5, %xmm1
	unpcklps	%xmm5, %xmm4
	psrlq	$32, %xmm2
	movlps	%xmm1, 940(%rsp)
	shufps	$78, %xmm4, %xmm4
	movss	276(%rsp), %xmm1
	movlps	%xmm2, 980(%rsp)
	movlps	%xmm1, 948(%rsp)
	movq	496(%rsp), %xmm1
	movlps	%xmm4, 972(%rsp)
	movq	448(%rsp), %xmm4
	movq	%xmm1, %xmm2
	cmpltps	%xmm2, %xmm0
	movq	400(%rsp), %xmm2
	andps	%xmm0, %xmm1
	andnps	%xmm3, %xmm0
	orps	%xmm1, %xmm0
	movaps	%xmm2, %xmm1
	movss	%xmm0, 276(%rsp)
	unpcklps	%xmm4, %xmm1
	unpcklps	%xmm4, %xmm2
	psrlq	$32, %xmm0
	movlps	%xmm1, 1004(%rsp)
	shufps	$78, %xmm2, %xmm2
	movss	276(%rsp), %xmm1
	movlps	%xmm2, 1036(%rsp)
	movlps	%xmm1, 1012(%rsp)
	movlps	%xmm0, 1044(%rsp)
	jmp	.L535
.L913:
	movaps	%xmm0, %xmm11
	jmp	.L527
.L1302:
	movl	332(%rsp), %eax
	pxor	%xmm11, %xmm11
	pxor	%xmm12, %xmm12
	cvtsi2ssl	280(%rsp), %xmm12
	subl	%ebp, %eax
	cvtsi2ssl	%eax, %xmm11
	movq	224(%rsp), %rax
	divss	%xmm12, %xmm11
	mulss	%xmm2, %xmm11
	movss	%xmm11, (%rax,%rbp,4)
	addq	$1, %rbp
	cmpl	%ebp, 232(%rsp)
	jg	.L648
	movl	332(%rsp), %r15d
	movq	%rax, %rbx
	movl	348(%rsp), %r8d
	movl	232(%rsp), %r11d
	movl	192(%rsp), %r13d
	movss	236(%rsp), %xmm15
	jmp	.L649
.L530:
	movq	64(%rsp), %r15
	leaq	464(%rsp), %r13
	movss	%xmm9, 276(%rsp)
	leaq	416(%rsp), %rbx
	movss	%xmm10, 328(%rsp)
	leaq	368(%rsp), %rdi
	leaq	504(%rsp), %rsi
	jmp	.L542
	.p2align 4,,10
	.p2align 3
.L1215:
	comiss	%xmm0, %xmm7
	jnb	.L540
	mulss	.LC183(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC190(%rip), %xmm2
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm2
	divss	%xmm8, %xmm2
	movaps	%xmm2, %xmm0
	call	cosf
	movaps	%xmm9, %xmm1
	mulss	%xmm9, %xmm1
	movaps	%xmm0, %xmm2
	movss	.LC189(%rip), %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm2, %xmm0
	movaps	%xmm0, %xmm2
	addss	%xmm6, %xmm0
	unpcklps	%xmm1, %xmm2
	movlps	%xmm2, 44(%r15)
	addss	%xmm1, %xmm0
	movss	.LC164(%rip), %xmm1
	maxss	%xmm0, %xmm1
	movss	%xmm1, 40(%r15)
.L539:
	addq	$4, %r13
	addq	$32, %r15
	addq	$4, %rbx
	addq	$4, %rdi
	cmpq	%r13, %rsi
	je	.L1250
.L542:
	movss	0(%r13), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rdi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm3
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%rbx), %xmm0
	movss	%xmm1, 36(%r15)
	unpcklps	%xmm0, %xmm3
	movlps	%xmm3, 28(%r15)
	jb	.L1215
.L540:
	movq	$0, 40(%r15)
	movl	$0x00000000, 48(%r15)
	jmp	.L539
.L562:
	movss	300(%rsp), %xmm11
	movss	304(%rsp), %xmm5
	mulss	%xmm0, %xmm11
	addss	268(%rsp), %xmm11
	mulss	%xmm7, %xmm0
	mulss	%xmm11, %xmm5
	movaps	%xmm0, %xmm4
	subss	%xmm5, %xmm4
	addss	264(%rsp), %xmm4
	movss	%xmm4, 268(%rsp)
	movss	308(%rsp), %xmm4
	mulss	%xmm11, %xmm4
	subss	%xmm4, %xmm0
	movss	%xmm0, 264(%rsp)
	jmp	.L563
.L1326:
	movl	176(%rsp), %ebx
	pxor	%xmm11, %xmm11
	pxor	%xmm13, %xmm13
	cvtsi2ssl	280(%rsp), %xmm13
	movq	192(%rsp), %rsi
	movl	%ebx, %r10d
	subl	%ebp, %r10d
	cvtsi2ssl	%r10d, %xmm11
	divss	%xmm13, %xmm11
	mulss	%xmm2, %xmm11
	movss	%xmm11, (%rsi,%rbp,4)
	addq	$1, %rbp
	cmpl	%ebp, %ebx
	jg	.L837
	movl	%ebx, %r15d
	movq	%rsi, %rbx
.L838:
	cmpl	$0, 344(%rsp)
	jne	.L1303
.L843:
	xorl	%eax, %eax
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L850:
	movss	(%rbx,%rax,4), %xmm1
	movss	.LC98(%rip), %xmm5
	comiss	%xmm1, %xmm5
	ja	.L848
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
	movss	%xmm0, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L850
.L841:
	movq	%r12, %rcx
	call	free
	movq	312(%rsp), %rcx
	call	free
	movq	320(%rsp), %rcx
	call	free
	cmpl	$0, 2300(%rsp)
	jne	.L1304
	movl	2288(%rsp), %eax
	cmpl	$2, %eax
	je	.L851
	ja	.L868
.L1256:
	testl	%eax, %eax
	je	.L1305
	leaq	.LC216(%rip), %rdx
	movl	732(%rsp), %ebp
	leaq	1232(%rsp), %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L1258
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	movl	$1179011410, 464(%rsp)
	leal	0(,%r15,4), %r12d
	leaq	464(%rsp), %rcx
	call	fwrite
	leal	52(%r12), %edx
	movq	%rsi, %rcx
	call	w32
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$1163280727, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$544501094, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$18, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$3, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$1, 464(%rsp)
	call	fwrite
	movl	%ebp, %edx
	movq	%rsi, %rcx
	call	w32
	leal	0(,%rbp,4), %edx
	movq	%rsi, %rcx
	call	w32
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$4, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$32, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$0, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$1952670054, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$4, 464(%rsp)
	call	fwrite
	movl	%r15d, %edx
	movq	%rsi, %rcx
	call	w32
	movl	$1, %edx
	movq	%rsi, %r9
	movl	$4, %r8d
	leaq	464(%rsp), %rcx
	movl	$1635017060, 464(%rsp)
	call	fwrite
	movl	%r12d, %edx
	movq	%rsi, %rcx
	call	w32
.L1239:
	movq	336(%rsp), %r8
	movq	%rsi, %r9
	movl	$4, %edx
	movq	%rbx, %rcx
	call	fwrite
.L1259:
	movq	%rsi, %rcx
	call	fclose
.L856:
	cmpl	$0, 2300(%rsp)
	je	.L867
	leaq	1232(%rsp), %rdx
	leaq	.LC234(%rip), %rcx
	call	printf
.L867:
	movq	%rbx, %rcx
	call	free
	movq	1168(%rsp), %rcx
	call	free
	movq	1192(%rsp), %rcx
	call	free
	movq	1152(%rsp), %rcx
	call	free
	jmp	.L274
.L1287:
	movslq	1200(%rsp), %rax
	movss	(%r12,%rax,4), %xmm0
	movq	%rax, %rdx
	comiss	%xmm12, %xmm0
	jbe	.L501
	subl	$1, %edx
	js	.L501
	xorl	%r8d, %r8d
	jmp	.L508
	.p2align 6
.L1306:
	leal	-1(%rax), %edx
.L505:
	cmpl	%r8d, %edx
	jl	.L501
.L508:
	leal	(%rdx,%r8), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movslq	%eax, %rsi
	movss	(%r12,%rsi,4), %xmm0
	comiss	%xmm12, %xmm0
	ja	.L1306
	comiss	4(%r12,%rsi,4), %xmm12
	jb	.L1210
	leal	1(%rax), %r8d
	jmp	.L505
.L1286:
	cmpl	$1, 56(%rsp)
	je	.L1307
	movss	4(%r14), %xmm11
	jmp	.L473
.L501:
	movq	.LC196(%rip), %rax
	pxor	%xmm15, %xmm15
	movss	%xmm6, 176(%rsp)
	movaps	%xmm15, %xmm13
	movaps	.LC194(%rip), %xmm3
	movaps	%xmm15, %xmm11
	movss	%xmm15, 168(%rsp)
	movaps	%xmm3, 368(%rsp)
	movq	%rax, 400(%rsp)
	movq	.LC197(%rip), %rax
	movaps	%xmm3, 384(%rsp)
	movaps	.LC195(%rip), %xmm3
	movaps	%xmm3, 416(%rsp)
	movq	%rax, 448(%rsp)
	movq	.LC54(%rip), %rax
	movaps	%xmm3, 432(%rsp)
	movaps	.LC55(%rip), %xmm3
	movaps	%xmm3, 464(%rsp)
	movaps	%xmm3, 480(%rsp)
	movq	%rax, 496(%rsp)
	jmp	.L475
.L896:
	movss	.LC50(%rip), %xmm7
	xorl	%ecx, %ecx
	xorl	%r11d, %r11d
	movl	$0x00000000, 256(%rsp)
	movl	$0x00000000, 260(%rsp)
	movss	%xmm7, 140(%rsp)
	movss	.LC204(%rip), %xmm7
	movl	$0x00000000, 264(%rsp)
	movl	$0x00000000, 268(%rsp)
	movl	$0x00000000, 164(%rsp)
	movl	$0x00000000, 160(%rsp)
	movl	%ecx, 220(%rsp)
	movss	%xmm7, 136(%rsp)
.L464:
	movslq	%r11d, %rbp
	movl	%r15d, 176(%rsp)
	pxor	%xmm7, %xmm7
	movl	%r13d, 172(%rsp)
	movq	%rbx, 192(%rsp)
	movss	%xmm15, 232(%rsp)
.L839:
	pxor	%xmm12, %xmm12
	cvtsi2ssl	%ebp, %xmm12
	testq	%r14, %r14
	movss	848(%rsp), %xmm2
	movaps	%xmm0, 368(%rsp)
	movaps	96(%rsp), %xmm3
	movq	128(%rsp), %rax
	movaps	%xmm1, 384(%rsp)
	movss	816(%rsp), %xmm13
	movaps	%xmm3, 464(%rsp)
	divss	%xmm8, %xmm12
	movaps	112(%rsp), %xmm3
	movss	%xmm4, 400(%rsp)
	movss	784(%rsp), %xmm11
	unpcklps	%xmm2, %xmm13
	movss	%xmm5, 404(%rsp)
	movss	752(%rsp), %xmm2
	movaps	%xmm3, 480(%rsp)
	movss	976(%rsp), %xmm0
	movq	%rax, 496(%rsp)
	movss	912(%rsp), %xmm1
	unpcklps	%xmm11, %xmm2
	movlhps	%xmm13, %xmm2
	movaps	%xmm2, 416(%rsp)
	movss	944(%rsp), %xmm11
	unpcklps	%xmm0, %xmm11
	movss	880(%rsp), %xmm0
	unpcklps	%xmm1, %xmm0
	movlhps	%xmm11, %xmm0
	movaps	%xmm0, 432(%rsp)
	movss	1008(%rsp), %xmm1
	movss	1040(%rsp), %xmm0
	unpcklps	%xmm0, %xmm1
	movlps	%xmm1, 448(%rsp)
	mulss	140(%rsp), %xmm12
	je	.L651
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jle	.L651
	movss	(%r14), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1308
	cmpl	$1, 56(%rsp)
	je	.L659
	movaps	%xmm12, %xmm2
	movq	%r14, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm11
.L658:
	cmpb	$0, 214(%rsp)
	jne	.L1309
	movss	200(%rsp), %xmm5
	movss	%xmm6, 144(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm5, 168(%rsp)
.L661:
	movss	48(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L706
	movss	.LC190(%rip), %xmm0
	mulss	1124(%rsp), %xmm0
	divss	%xmm8, %xmm0
	addss	2308(%rsp), %xmm0
	comiss	.LC190(%rip), %xmm0
	jb	.L708
	subss	.LC190(%rip), %xmm0
.L708:
	movss	%xmm0, 2308(%rsp)
	call	sinf
	mulss	48(%rsp), %xmm0
	addss	%xmm0, %xmm11
.L706:
	movss	76(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L710
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	divss	.LC2(%rip), %xmm5
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	.LC203(%rip), %xmm0
	movl	%eax, g_noise_state(%rip)
	mulss	%xmm5, %xmm0
	addss	%xmm6, %xmm0
	mulss	%xmm0, %xmm11
.L710:
	movss	80(%rsp), %xmm3
	movaps	%xmm6, %xmm2
	comiss	%xmm7, %xmm3
	jbe	.L712
	movl	g_noise_state(%rip), %edx
	pxor	%xmm2, %xmm2
	divss	.LC2(%rip), %xmm3
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm2
	mulss	.LC203(%rip), %xmm2
	movl	%eax, g_noise_state(%rip)
	mulss	%xmm3, %xmm2
	addss	%xmm6, %xmm2
.L712:
	comiss	%xmm7, %xmm11
	jbe	.L714
	movss	.LC97(%rip), %xmm0
	comiss	%xmm11, %xmm0
	ja	.L944
	movss	.LC92(%rip), %xmm0
	movaps	%xmm0, %xmm1
	cmpltss	%xmm11, %xmm1
	andps	%xmm1, %xmm0
	andnps	%xmm11, %xmm1
	orps	%xmm0, %xmm1
	movaps	%xmm1, %xmm11
.L714:
	comiss	%xmm8, %xmm7
	jnb	.L1310
	cmpl	$0, 172(%rsp)
	je	.L719
	movq	64(%rsp), %rdi
	leaq	464(%rsp), %r15
	movss	%xmm9, 224(%rsp)
	movaps	%xmm2, %xmm12
	leaq	416(%rsp), %r13
	movss	%xmm10, 236(%rsp)
	leaq	368(%rsp), %rsi
	leaq	504(%rsp), %rbx
	jmp	.L723
	.p2align 4,,10
	.p2align 3
.L1311:
	comiss	%xmm0, %xmm7
	jnb	.L721
	mulss	.LC183(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC190(%rip), %xmm2
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm2
	divss	%xmm8, %xmm2
	movaps	%xmm2, %xmm0
	call	cosf
	movss	.LC189(%rip), %xmm1
	movaps	%xmm0, %xmm2
	movaps	%xmm9, %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm9, %xmm1
	movss	%xmm0, 48(%rdi)
	movaps	%xmm6, %xmm0
	mulss	%xmm2, %xmm1
	subss	%xmm9, %xmm0
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 40(%rdi)
.L722:
	addq	$4, %r15
	addq	$32, %rdi
	addq	$4, %r13
	addq	$4, %rsi
	cmpq	%r15, %rbx
	je	.L1254
.L723:
	movss	(%r15), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rsi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm3
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	0(%r13), %xmm0
	movss	%xmm1, 36(%rdi)
	unpcklps	%xmm0, %xmm3
	movlps	%xmm3, 28(%rdi)
	jb	.L1311
.L721:
	movq	$0, 40(%rdi)
	movl	$0x00000000, 48(%rdi)
	jmp	.L722
.L651:
	cmpl	$1, 56(%rsp)
	movss	216(%rsp), %xmm11
	jne	.L658
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	je	.L933
.L1251:
	movq	1168(%rsp), %rcx
	movss	(%rcx), %xmm0
	comiss	%xmm12, %xmm0
	jb	.L1312
	movl	144(%rcx), %edx
	movq	%rcx, %rax
.L668:
	leaq	4(%rax), %rsi
	movl	$10, %ecx
	leaq	368(%rsp), %rdi
	rep movsl
	leaq	44(%rax), %rsi
	movl	$10, %ecx
	leaq	416(%rsp), %rdi
	rep movsl
	jmp	.L672
	.p2align 5
.L1314:
	movaps	%xmm6, %xmm0
.L674:
	movss	%xmm0, 464(%rsp,%rcx)
	addq	$4, %rcx
	cmpq	$40, %rcx
	je	.L1313
.L672:
	testl	%edx, %edx
	je	.L1314
	movss	104(%rax,%rcx), %xmm0
	jmp	.L674
.L1254:
	movss	224(%rsp), %xmm9
	movaps	%xmm12, %xmm2
	movss	236(%rsp), %xmm10
.L718:
	movss	232(%rsp), %xmm5
	movaps	%xmm6, %xmm0
	movss	168(%rsp), %xmm12
	subss	%xmm5, %xmm0
	mulss	%xmm5, %xmm10
	movaps	%xmm5, %xmm1
	mulss	%xmm5, %xmm9
	movss	136(%rsp), %xmm5
	mulss	%xmm14, %xmm1
	mulss	%xmm0, %xmm12
	comiss	%xmm14, %xmm5
	mulss	%xmm0, %xmm13
	mulss	%xmm15, %xmm0
	addss	%xmm1, %xmm12
	addss	%xmm13, %xmm10
	addss	%xmm0, %xmm9
	jbe	.L732
	comiss	.LC204(%rip), %xmm12
	jb	.L732
	movss	%xmm7, 2304(%rsp)
	comiss	%xmm7, %xmm11
	jbe	.L745
.L735:
	movaps	%xmm8, %xmm1
	movaps	%xmm6, %xmm0
	divss	%xmm11, %xmm1
	divss	%xmm1, %xmm0
	addss	2304(%rsp), %xmm0
	comiss	%xmm6, %xmm0
	jb	.L737
	subss	%xmm6, %xmm0
.L737:
	movss	%xmm0, 2304(%rsp)
	movl	728(%rsp), %eax
	cmpl	$2, %eax
	je	.L1315
	movss	.LC207(%rip), %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L1233
	movaps	%xmm0, %xmm4
	divss	%xmm1, %xmm4
.L744:
	addss	%xmm4, %xmm4
	subl	$1, %eax
	subss	%xmm6, %xmm4
	movaps	%xmm4, %xmm0
	jne	.L740
	movl	g_noise_state(%rip), %edx
	pxor	%xmm4, %xmm4
	mulss	.LC209(%rip), %xmm0
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm4
	mulss	.LC203(%rip), %xmm4
	movl	%eax, g_noise_state(%rip)
	mulss	.LC210(%rip), %xmm4
	addss	%xmm4, %xmm0
.L740:
	mulss	%xmm12, %xmm0
	mulss	%xmm2, %xmm0
.L736:
	comiss	.LC205(%rip), %xmm10
	pxor	%xmm2, %xmm2
	jbe	.L747
	movl	g_noise_state(%rip), %edx
	pxor	%xmm1, %xmm1
	movss	240(%rsp), %xmm4
	movss	160(%rsp), %xmm2
	movss	248(%rsp), %xmm5
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm1
	mulss	.LC203(%rip), %xmm1
	movl	%eax, g_noise_state(%rip)
	mulss	%xmm1, %xmm4
	mulss	244(%rsp), %xmm1
	addss	%xmm4, %xmm2
	mulss	%xmm2, %xmm5
	subss	%xmm5, %xmm1
	addss	164(%rsp), %xmm1
	movss	%xmm1, 160(%rsp)
	movss	252(%rsp), %xmm1
	mulss	%xmm2, %xmm1
	mulss	%xmm10, %xmm2
	subss	%xmm1, %xmm4
	movss	%xmm4, 164(%rsp)
.L747:
	comiss	.LC205(%rip), %xmm9
	pxor	%xmm11, %xmm11
	jbe	.L749
	movl	g_noise_state(%rip), %edx
	pxor	%xmm1, %xmm1
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cmpl	$0, 220(%rsp)
	cvtsi2ssl	%eax, %xmm1
	mulss	.LC203(%rip), %xmm1
	je	.L751
	movss	284(%rsp), %xmm4
	movss	260(%rsp), %xmm11
	movss	292(%rsp), %xmm5
	mulss	%xmm1, %xmm4
	mulss	288(%rsp), %xmm1
	addss	%xmm4, %xmm11
	mulss	%xmm11, %xmm5
	subss	%xmm5, %xmm1
	addss	256(%rsp), %xmm1
	movss	%xmm1, 260(%rsp)
	movss	296(%rsp), %xmm1
	mulss	%xmm11, %xmm1
	subss	%xmm1, %xmm4
	movss	%xmm4, 256(%rsp)
.L752:
	mulss	%xmm9, %xmm11
	movl	%eax, g_noise_state(%rip)
.L749:
	movl	172(%rsp), %ecx
	addss	%xmm0, %xmm2
	movss	748(%rsp), %xmm0
	testl	%ecx, %ecx
	je	.L753
	comiss	%xmm7, %xmm0
	pxor	%xmm13, %xmm13
	jbe	.L754
	movss	760(%rsp), %xmm13
	ucomiss	%xmm7, %xmm13
	jp	.L756
	je	.L1316
.L756:
	movss	772(%rsp), %xmm4
	mulss	%xmm2, %xmm13
	movss	764(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm13
	movss	768(%rsp), %xmm1
	mulss	776(%rsp), %xmm1
	subss	%xmm1, %xmm13
	movaps	%xmm13, %xmm1
	mulss	756(%rsp), %xmm13
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 772(%rsp)
.L758:
	addss	%xmm7, %xmm13
.L754:
	movl	780(%rsp), %r8d
	movd	%r8d, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L759
	movss	792(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L761
	je	.L1317
.L761:
	movss	804(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	796(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	800(%rsp), %xmm1
	mulss	808(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	788(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 804(%rsp)
	movaps	%xmm5, %xmm1
.L763:
	addss	%xmm1, %xmm13
.L759:
	movl	812(%rsp), %eax
	movd	%eax, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L764
	movss	824(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L766
	je	.L1318
.L766:
	movss	836(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	828(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	840(%rsp), %xmm1
	mulss	832(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	820(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 836(%rsp)
	movaps	%xmm5, %xmm1
.L768:
	addss	%xmm1, %xmm13
.L764:
	movl	844(%rsp), %r9d
	movd	%r9d, %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L769
	movss	856(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L771
	je	.L1319
.L771:
	movss	868(%rsp), %xmm4
	mulss	%xmm2, %xmm5
	movss	860(%rsp), %xmm1
	mulss	%xmm4, %xmm1
	subss	%xmm1, %xmm5
	movss	872(%rsp), %xmm1
	mulss	864(%rsp), %xmm1
	subss	%xmm1, %xmm5
	movaps	%xmm5, %xmm1
	mulss	852(%rsp), %xmm5
	unpcklps	%xmm4, %xmm1
	movlps	%xmm1, 868(%rsp)
	movaps	%xmm5, %xmm1
.L773:
	addss	%xmm1, %xmm13
.L769:
	movss	876(%rsp), %xmm1
	comiss	%xmm7, %xmm1
	jbe	.L774
	movss	888(%rsp), %xmm14
	ucomiss	%xmm7, %xmm14
	jp	.L776
	je	.L1320
.L776:
	movss	900(%rsp), %xmm5
	mulss	%xmm2, %xmm14
	movss	892(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm14
	movss	904(%rsp), %xmm4
	mulss	896(%rsp), %xmm4
	subss	%xmm4, %xmm14
	movaps	%xmm14, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 900(%rsp)
	movss	884(%rsp), %xmm4
	mulss	%xmm14, %xmm4
.L778:
	addss	%xmm4, %xmm13
.L774:
	movss	908(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L779
	movss	920(%rsp), %xmm14
	ucomiss	%xmm7, %xmm14
	jp	.L781
	je	.L1321
.L781:
	movss	932(%rsp), %xmm5
	mulss	%xmm2, %xmm14
	movss	924(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm14
	movss	936(%rsp), %xmm4
	mulss	928(%rsp), %xmm4
	subss	%xmm4, %xmm14
	movaps	%xmm14, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 932(%rsp)
	movss	916(%rsp), %xmm4
	mulss	%xmm14, %xmm4
.L783:
	addss	%xmm4, %xmm13
.L779:
	movss	940(%rsp), %xmm14
	comiss	%xmm7, %xmm14
	jbe	.L784
	movss	952(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L786
	je	.L1322
.L786:
	movss	964(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	movss	956(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm15
	movss	968(%rsp), %xmm4
	mulss	960(%rsp), %xmm4
	subss	%xmm4, %xmm15
	movaps	%xmm15, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 964(%rsp)
	movss	948(%rsp), %xmm4
	mulss	%xmm15, %xmm4
.L788:
	addss	%xmm4, %xmm13
.L784:
	movl	972(%rsp), %ecx
	movd	%ecx, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L789
	movss	984(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L791
	je	.L1323
.L791:
	movss	996(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	movss	988(%rsp), %xmm4
	mulss	%xmm5, %xmm4
	subss	%xmm4, %xmm15
	movss	992(%rsp), %xmm4
	mulss	1000(%rsp), %xmm4
	subss	%xmm4, %xmm15
	movaps	%xmm15, %xmm4
	unpcklps	%xmm5, %xmm4
	movlps	%xmm4, 996(%rsp)
	movss	980(%rsp), %xmm4
	mulss	%xmm15, %xmm4
.L793:
	addss	%xmm4, %xmm13
.L789:
	movss	1004(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L794
	movss	1016(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L796
	je	.L1324
.L796:
	movss	1028(%rsp), %xmm5
	mulss	%xmm2, %xmm15
	mulss	1020(%rsp), %xmm5
	subss	%xmm5, %xmm15
	movss	1032(%rsp), %xmm5
	mulss	1024(%rsp), %xmm5
	subss	%xmm5, %xmm15
	movd	%xmm15, %ebx
	movaps	%xmm15, %xmm5
	movss	1028(%rsp), %xmm15
	unpcklps	%xmm15, %xmm5
	movlps	%xmm5, 1028(%rsp)
	movd	%ebx, %xmm5
	mulss	1012(%rsp), %xmm5
.L798:
	addss	%xmm5, %xmm13
.L794:
	movss	1036(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L799
	movss	1048(%rsp), %xmm15
	ucomiss	%xmm7, %xmm15
	jp	.L801
	je	.L1325
.L801:
	mulss	%xmm2, %xmm15
	movss	1060(%rsp), %xmm2
	mulss	1052(%rsp), %xmm2
	subss	%xmm2, %xmm15
	movss	1064(%rsp), %xmm2
	mulss	1056(%rsp), %xmm2
	subss	%xmm2, %xmm15
	movd	%xmm15, %ebx
	movaps	%xmm15, %xmm2
	movss	1060(%rsp), %xmm15
	unpcklps	%xmm15, %xmm2
	movd	%ebx, %xmm15
	movlps	%xmm2, 1060(%rsp)
	mulss	1044(%rsp), %xmm15
.L803:
	addss	%xmm15, %xmm13
.L799:
	movss	.LC210(%rip), %xmm2
	mulss	%xmm11, %xmm2
	addss	%xmm13, %xmm2
.L804:
	movl	84(%rsp), %edx
	testl	%edx, %edx
	je	.L835
	movss	.LC211(%rip), %xmm11
	mulss	2312(%rsp), %xmm11
	movss	%xmm2, 2312(%rsp)
	subss	%xmm11, %xmm2
.L835:
	movss	144(%rsp), %xmm11
	cmpl	%ebp, 92(%rsp)
	mulss	88(%rsp), %xmm11
	mulss	%xmm11, %xmm2
	jg	.L836
	cmpb	$0, 215(%rsp)
	jne	.L1326
.L836:
	movq	192(%rsp), %rsi
	movss	%xmm2, (%rsi,%rbp,4)
	addq	$1, %rbp
	cmpl	%ebp, 176(%rsp)
	jle	.L1243
.L837:
	movd	%r9d, %xmm15
	movd	%eax, %xmm2
	unpcklps	%xmm3, %xmm1
	unpcklps	%xmm15, %xmm2
	movd	%r8d, %xmm15
	unpcklps	%xmm15, %xmm0
	movlhps	%xmm2, %xmm0
	movd	%ecx, %xmm2
	unpcklps	%xmm2, %xmm14
	movlhps	%xmm14, %xmm1
	movaps	%xmm12, %xmm14
	jmp	.L839
	.p2align 4,,10
	.p2align 3
.L732:
	comiss	%xmm7, %xmm11
	jbe	.L745
	comiss	.LC205(%rip), %xmm12
	ja	.L735
.L745:
	pxor	%xmm0, %xmm0
	jmp	.L736
.L753:
	comiss	%xmm7, %xmm0
	jbe	.L805
	movss	760(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1081
	je	.L950
.L1081:
	movss	772(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	764(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	776(%rsp), %xmm2
	mulss	768(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 772(%rsp)
	movss	756(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L805:
	movl	780(%rsp), %r8d
	movd	%r8d, %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L808
	movss	792(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1083
	je	.L951
.L1083:
	movss	804(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	796(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	808(%rsp), %xmm2
	mulss	800(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 804(%rsp)
	movss	788(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L808:
	movl	812(%rsp), %eax
	movd	%eax, %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L811
	movss	824(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1085
	je	.L952
.L1085:
	movss	836(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	828(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	840(%rsp), %xmm2
	mulss	832(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 836(%rsp)
	movss	820(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L811:
	movl	844(%rsp), %r9d
	movd	%r9d, %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L814
	movss	856(%rsp), %xmm1
	ucomiss	%xmm7, %xmm1
	jp	.L1087
	je	.L953
.L1087:
	movss	868(%rsp), %xmm4
	mulss	%xmm2, %xmm1
	movss	860(%rsp), %xmm2
	mulss	%xmm4, %xmm2
	subss	%xmm2, %xmm1
	movss	872(%rsp), %xmm2
	mulss	864(%rsp), %xmm2
	subss	%xmm2, %xmm1
	movaps	%xmm1, %xmm2
	unpcklps	%xmm4, %xmm2
	movlps	%xmm2, 868(%rsp)
	movss	852(%rsp), %xmm2
	mulss	%xmm1, %xmm2
.L814:
	movss	876(%rsp), %xmm1
	comiss	%xmm7, %xmm1
	jbe	.L817
	movss	888(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1089
	je	.L954
.L1089:
	movss	900(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	892(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	904(%rsp), %xmm2
	mulss	896(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	884(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 900(%rsp)
	movaps	%xmm4, %xmm2
.L817:
	movss	908(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L820
	movss	920(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1091
	je	.L955
.L1091:
	movss	932(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	924(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	936(%rsp), %xmm2
	mulss	928(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	916(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 932(%rsp)
	movaps	%xmm4, %xmm2
.L820:
	movss	940(%rsp), %xmm14
	comiss	%xmm7, %xmm14
	jbe	.L823
	movss	952(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1093
	je	.L956
.L1093:
	movss	964(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	956(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	968(%rsp), %xmm2
	mulss	960(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	948(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 964(%rsp)
	movaps	%xmm4, %xmm2
.L823:
	movl	972(%rsp), %ecx
	movd	%ecx, %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L826
	movss	984(%rsp), %xmm4
	ucomiss	%xmm7, %xmm4
	jp	.L1095
	je	.L957
.L1095:
	movss	996(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	movss	988(%rsp), %xmm2
	mulss	%xmm5, %xmm2
	subss	%xmm2, %xmm4
	movss	1000(%rsp), %xmm2
	mulss	992(%rsp), %xmm2
	subss	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	mulss	980(%rsp), %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 996(%rsp)
	movaps	%xmm4, %xmm2
.L826:
	movss	1004(%rsp), %xmm4
	comiss	%xmm7, %xmm4
	jbe	.L829
	movss	1016(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L1097
	je	.L958
.L1097:
	movss	1028(%rsp), %xmm13
	mulss	%xmm2, %xmm5
	movss	1020(%rsp), %xmm2
	mulss	%xmm13, %xmm2
	subss	%xmm2, %xmm5
	movss	1032(%rsp), %xmm2
	mulss	1024(%rsp), %xmm2
	subss	%xmm2, %xmm5
	movaps	%xmm5, %xmm2
	mulss	1012(%rsp), %xmm5
	unpcklps	%xmm13, %xmm2
	movlps	%xmm2, 1028(%rsp)
	movaps	%xmm5, %xmm2
.L829:
	movss	1036(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L832
	movss	1048(%rsp), %xmm13
	ucomiss	%xmm7, %xmm13
	jp	.L1099
	je	.L959
.L1099:
	movss	1060(%rsp), %xmm15
	mulss	%xmm2, %xmm13
	movss	1052(%rsp), %xmm2
	mulss	%xmm15, %xmm2
	subss	%xmm2, %xmm13
	movss	1064(%rsp), %xmm2
	mulss	1056(%rsp), %xmm2
	subss	%xmm2, %xmm13
	movaps	%xmm13, %xmm2
	unpcklps	%xmm15, %xmm2
	movlps	%xmm2, 1060(%rsp)
	movss	1044(%rsp), %xmm2
	mulss	%xmm13, %xmm2
.L832:
	mulss	.LC60(%rip), %xmm11
	addss	%xmm11, %xmm2
	jmp	.L804
.L1310:
	pxor	%xmm0, %xmm0
	movaps	%xmm0, %xmm1
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	464(%rsp), %xmm4
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	movq	%r8, 764(%rsp)
	xorl	%eax, %eax
	movq	%xmm4, %xmm5
	movq	%r9, 796(%rsp)
	movq	.LC54(%rip), %xmm12
	xorl	%r13d, %r13d
	cmpltps	%xmm5, %xmm1
	movq	%r10, 828(%rsp)
	xorl	%r15d, %r15d
	movq	368(%rsp), %xmm5
	movq	%r11, 860(%rsp)
	movaps	%xmm5, %xmm3
	movq	%rbx, 892(%rsp)
	andps	%xmm1, %xmm4
	andnps	%xmm12, %xmm1
	orps	%xmm1, %xmm4
	movss	%xmm4, 224(%rsp)
	movq	416(%rsp), %xmm1
	psrlq	$32, %xmm4
	movlps	%xmm4, 788(%rsp)
	movq	472(%rsp), %xmm4
	unpcklps	%xmm1, %xmm3
	unpcklps	%xmm1, %xmm5
	movaps	%xmm0, %xmm1
	shufps	$78, %xmm5, %xmm5
	movlps	%xmm5, 780(%rsp)
	movq	%xmm4, %xmm5
	cmpltps	%xmm5, %xmm1
	movlps	%xmm3, 748(%rsp)
	movq	376(%rsp), %xmm5
	movss	224(%rsp), %xmm3
	andps	%xmm1, %xmm4
	andnps	%xmm12, %xmm1
	orps	%xmm1, %xmm4
	movss	%xmm4, 224(%rsp)
	psrlq	$32, %xmm4
	movlps	%xmm3, 756(%rsp)
	movq	424(%rsp), %xmm1
	movaps	%xmm5, %xmm3
	movlps	%xmm4, 852(%rsp)
	movq	480(%rsp), %xmm4
	unpcklps	%xmm1, %xmm3
	unpcklps	%xmm1, %xmm5
	movaps	%xmm0, %xmm1
	shufps	$78, %xmm5, %xmm5
	movlps	%xmm5, 844(%rsp)
	movq	%xmm4, %xmm5
	cmpltps	%xmm5, %xmm1
	movlps	%xmm3, 812(%rsp)
	movq	384(%rsp), %xmm5
	movss	224(%rsp), %xmm3
	andps	%xmm1, %xmm4
	andnps	%xmm12, %xmm1
	orps	%xmm1, %xmm4
	movq	432(%rsp), %xmm1
	movlps	%xmm3, 820(%rsp)
	movaps	%xmm5, %xmm3
	movss	%xmm4, 224(%rsp)
	unpcklps	%xmm1, %xmm3
	unpcklps	%xmm1, %xmm5
	psrlq	$32, %xmm4
	movlps	%xmm3, 876(%rsp)
	shufps	$78, %xmm5, %xmm5
	movaps	%xmm0, %xmm1
	movss	224(%rsp), %xmm3
	movlps	%xmm5, 908(%rsp)
	movlps	%xmm3, 884(%rsp)
	movlps	%xmm4, 916(%rsp)
	movq	488(%rsp), %xmm4
	movq	%rsi, 924(%rsp)
	movq	%xmm4, %xmm5
	movq	%rdi, 956(%rsp)
	cmpltps	%xmm5, %xmm1
	movq	%r13, 988(%rsp)
	movq	392(%rsp), %xmm5
	movq	%r15, 1020(%rsp)
	movaps	%xmm5, %xmm3
	movq	%rax, 1052(%rsp)
	andps	%xmm1, %xmm4
	andnps	%xmm12, %xmm1
	orps	%xmm1, %xmm4
	movq	440(%rsp), %xmm1
	movss	%xmm4, 224(%rsp)
	psrlq	$32, %xmm4
	unpcklps	%xmm1, %xmm3
	unpcklps	%xmm1, %xmm5
	shufps	$78, %xmm5, %xmm5
	movq	496(%rsp), %xmm1
	movlps	%xmm4, 980(%rsp)
	movq	%xmm1, %xmm4
	movlps	%xmm5, 972(%rsp)
	movq	448(%rsp), %xmm5
	cmpltps	%xmm4, %xmm0
	movlps	%xmm3, 940(%rsp)
	movq	400(%rsp), %xmm4
	movss	224(%rsp), %xmm3
	andps	%xmm0, %xmm1
	andnps	%xmm12, %xmm0
	orps	%xmm1, %xmm0
	movaps	%xmm4, %xmm1
	movss	%xmm0, 224(%rsp)
	unpcklps	%xmm5, %xmm1
	psrlq	$32, %xmm0
	unpcklps	%xmm5, %xmm4
	movlps	%xmm1, 1004(%rsp)
	shufps	$78, %xmm4, %xmm4
	movss	224(%rsp), %xmm1
	movlps	%xmm3, 948(%rsp)
	movlps	%xmm1, 1012(%rsp)
	movlps	%xmm4, 1036(%rsp)
	movlps	%xmm0, 1044(%rsp)
	jmp	.L718
.L944:
	movaps	%xmm0, %xmm11
	jmp	.L714
.L1303:
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L842:
	movss	(%rbx,%rax,4), %xmm0
	andps	.LC212(%rip), %xmm0
	maxss	%xmm1, %xmm0
	addq	$1, %rax
	cmpl	%eax, %r15d
	movaps	%xmm0, %xmm1
	jg	.L842
	comiss	.LC213(%rip), %xmm0
	jbe	.L843
	movss	.LC214(%rip), %xmm2
	xorl	%eax, %eax
	divss	%xmm0, %xmm2
.L847:
	movss	(%rbx,%rax,4), %xmm0
	mulss	%xmm2, %xmm0
	movss	%xmm0, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L847
	jmp	.L843
	.p2align 4,,10
	.p2align 3
.L848:
	movl	$0xbf800000, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L850
	jmp	.L841
.L719:
	movq	64(%rsp), %rdi
	leaq	464(%rsp), %r13
	movss	%xmm9, 224(%rsp)
	movaps	%xmm2, %xmm12
	leaq	416(%rsp), %r15
	movss	%xmm10, 236(%rsp)
	leaq	368(%rsp), %rsi
	leaq	504(%rsp), %rbx
	jmp	.L731
	.p2align 4,,10
	.p2align 3
.L1231:
	comiss	%xmm0, %xmm7
	jnb	.L728
	mulss	.LC183(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC190(%rip), %xmm2
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm2
	divss	%xmm8, %xmm2
	movaps	%xmm2, %xmm0
	call	cosf
	movaps	%xmm9, %xmm1
	mulss	%xmm9, %xmm1
	movaps	%xmm0, %xmm2
	movss	.LC189(%rip), %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm2, %xmm0
	movaps	%xmm0, %xmm2
	addss	%xmm6, %xmm0
	unpcklps	%xmm1, %xmm2
	movlps	%xmm2, 44(%rdi)
	addss	%xmm1, %xmm0
	movss	.LC164(%rip), %xmm1
	maxss	%xmm0, %xmm1
	movss	%xmm1, 40(%rdi)
.L727:
	addq	$4, %r13
	addq	$32, %rdi
	addq	$4, %r15
	addq	$4, %rsi
	cmpq	%r13, %rbx
	je	.L1254
.L731:
	movss	0(%r13), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rsi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm3
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%r15), %xmm0
	movss	%xmm1, 36(%rdi)
	unpcklps	%xmm0, %xmm3
	movlps	%xmm3, 28(%rdi)
	jb	.L1231
.L728:
	movq	$0, 40(%rdi)
	movl	$0x00000000, 48(%rdi)
	jmp	.L727
.L751:
	movss	300(%rsp), %xmm11
	movss	304(%rsp), %xmm5
	mulss	%xmm1, %xmm11
	addss	268(%rsp), %xmm11
	mulss	%xmm7, %xmm1
	mulss	%xmm11, %xmm5
	movaps	%xmm1, %xmm4
	subss	%xmm5, %xmm4
	addss	264(%rsp), %xmm4
	movss	%xmm4, 268(%rsp)
	movss	308(%rsp), %xmm4
	mulss	%xmm11, %xmm4
	subss	%xmm4, %xmm1
	movss	%xmm1, 264(%rsp)
	jmp	.L752
.L1309:
	movslq	1200(%rsp), %rax
	movss	(%r12,%rax,4), %xmm0
	movq	%rax, %rcx
	comiss	%xmm12, %xmm0
	jbe	.L690
	subl	$1, %ecx
	js	.L690
	xorl	%r8d, %r8d
	jmp	.L697
	.p2align 6
.L1327:
	leal	-1(%rax), %ecx
.L694:
	cmpl	%r8d, %ecx
	jl	.L690
.L697:
	leal	(%rcx,%r8), %edx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	movslq	%eax, %rbx
	movss	(%r12,%rbx,4), %xmm0
	comiss	%xmm12, %xmm0
	ja	.L1327
	comiss	4(%r12,%rbx,4), %xmm12
	jb	.L1226
	leal	1(%rax), %r8d
	jmp	.L694
.L1243:
	movl	176(%rsp), %r15d
	movq	192(%rsp), %rbx
	jmp	.L838
.L1308:
	cmpl	$1, 56(%rsp)
	je	.L1328
	movss	4(%r14), %xmm11
	jmp	.L658
.L690:
	movq	.LC196(%rip), %rax
	pxor	%xmm15, %xmm15
	movaps	%xmm15, %xmm13
	movss	%xmm6, 144(%rsp)
	movss	.LC95(%rip), %xmm0
	movaps	%xmm15, %xmm11
	movss	%xmm15, 168(%rsp)
	movaps	.LC55(%rip), %xmm3
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm0, 368(%rsp)
	movq	%rax, 400(%rsp)
	movq	.LC197(%rip), %rax
	movaps	%xmm0, 384(%rsp)
	movss	.LC61(%rip), %xmm0
	movaps	%xmm3, 464(%rsp)
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm3, 480(%rsp)
	movq	%rax, 448(%rsp)
	movq	.LC54(%rip), %rax
	movaps	%xmm0, 416(%rsp)
	movaps	%xmm0, 432(%rsp)
	movq	%rax, 496(%rsp)
	jmp	.L661
.L959:
	pxor	%xmm2, %xmm2
	jmp	.L832
.L1315:
	movss	.LC206(%rip), %xmm1
	comiss	%xmm0, %xmm1
	jbe	.L1232
	movaps	%xmm0, %xmm5
	movaps	%xmm6, %xmm0
	divss	%xmm1, %xmm5
	subss	%xmm5, %xmm0
	jmp	.L740
.L1322:
	pxor	%xmm4, %xmm4
	jmp	.L788
.L1324:
	pxor	%xmm5, %xmm5
	jmp	.L798
.L1325:
	pxor	%xmm15, %xmm15
	jmp	.L803
.L1323:
	pxor	%xmm4, %xmm4
	jmp	.L793
.L1316:
	pxor	%xmm13, %xmm13
	jmp	.L758
.L1317:
	pxor	%xmm1, %xmm1
	jmp	.L763
.L950:
	pxor	%xmm2, %xmm2
	jmp	.L805
.L1318:
	pxor	%xmm1, %xmm1
	jmp	.L768
.L1319:
	pxor	%xmm1, %xmm1
	jmp	.L773
.L1320:
	pxor	%xmm4, %xmm4
	jmp	.L778
.L1321:
	pxor	%xmm4, %xmm4
	jmp	.L783
.L951:
	pxor	%xmm2, %xmm2
	jmp	.L808
.L952:
	pxor	%xmm2, %xmm2
	jmp	.L811
.L953:
	pxor	%xmm2, %xmm2
	jmp	.L814
.L954:
	pxor	%xmm2, %xmm2
	jmp	.L817
.L955:
	pxor	%xmm2, %xmm2
	jmp	.L820
.L956:
	pxor	%xmm2, %xmm2
	jmp	.L823
.L957:
	pxor	%xmm2, %xmm2
	jmp	.L826
.L958:
	pxor	%xmm2, %xmm2
	jmp	.L829
.L927:
	pxor	%xmm2, %xmm2
	jmp	.L643
.L1292:
	pxor	%xmm12, %xmm12
	jmp	.L569
.L1291:
	movss	.LC206(%rip), %xmm1
	pxor	%xmm2, %xmm2
	comiss	%xmm0, %xmm1
	jbe	.L553
	divss	%xmm1, %xmm0
	movaps	%xmm6, %xmm2
	subss	%xmm0, %xmm2
	jmp	.L553
.L1300:
	pxor	%xmm5, %xmm5
	jmp	.L609
.L1301:
	pxor	%xmm15, %xmm15
	jmp	.L614
.L1294:
	pxor	%xmm1, %xmm1
	jmp	.L579
.L1295:
	pxor	%xmm1, %xmm1
	jmp	.L584
.L1296:
	pxor	%xmm4, %xmm4
	jmp	.L589
.L1297:
	pxor	%xmm4, %xmm4
	jmp	.L594
.L1298:
	pxor	%xmm4, %xmm4
	jmp	.L599
.L1299:
	pxor	%xmm4, %xmm4
	jmp	.L604
.L1293:
	pxor	%xmm1, %xmm1
	jmp	.L574
.L918:
	pxor	%xmm2, %xmm2
	jmp	.L616
.L919:
	pxor	%xmm2, %xmm2
	jmp	.L619
.L920:
	pxor	%xmm2, %xmm2
	jmp	.L622
.L925:
	pxor	%xmm2, %xmm2
	jmp	.L637
.L926:
	pxor	%xmm2, %xmm2
	jmp	.L640
.L921:
	pxor	%xmm2, %xmm2
	jmp	.L625
.L922:
	pxor	%xmm2, %xmm2
	jmp	.L628
.L923:
	pxor	%xmm2, %xmm2
	jmp	.L631
.L924:
	pxor	%xmm2, %xmm2
	jmp	.L634
.L1217:
	movaps	%xmm6, %xmm2
	subss	%xmm1, %xmm0
	divss	.LC208(%rip), %xmm0
	subss	%xmm0, %xmm2
	jmp	.L557
.L1233:
	movaps	%xmm6, %xmm4
	subss	%xmm1, %xmm0
	divss	.LC208(%rip), %xmm0
	subss	%xmm0, %xmm4
	jmp	.L744
.L1285:
	cmpl	$0, 1200(%rsp)
	jle	.L462
	movq	1192(%rsp), %rax
	movss	8084(%rax), %xmm14
	movss	8088(%rax), %xmm10
	movss	8092(%rax), %xmm9
	jmp	.L463
.L1284:
	movl	1200(%rsp), %esi
	testl	%esi, %esi
	jle	.L895
	leal	1(%rsi), %ecx
	movslq	%esi, %rdi
	movslq	%ecx, %rcx
	salq	$2, %rcx
	call	malloc
	imulq	$40, %rdi, %rcx
	movq	%rax, %r12
	call	malloc
	imulq	$40, %rdi, %rcx
	movq	%rax, 312(%rsp)
	call	malloc
	movl	$0x00000000, (%r12)
	xorl	%edx, %edx
	movq	%rax, 320(%rsp)
	movq	1192(%rsp), %rax
.L453:
	imulq	$8100, %rdx, %rcx
	movss	16(%rax,%rcx), %xmm0
	addss	(%r12,%rdx,4), %xmm0
	movss	%xmm0, 4(%r12,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %esi
	jg	.L453
	movq	64(%rsp), %rcx
	xorl	%edx, %edx
	pxor	%xmm1, %xmm1
	movq	312(%rsp), %r8
	movq	320(%rsp), %r9
.L456:
	movss	28(%rcx), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L454
	movss	.LC95(%rip), %xmm0
.L454:
	movss	%xmm0, (%r8,%rdx)
	movss	32(%rcx), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L455
	movss	.LC61(%rip), %xmm0
.L455:
	movss	%xmm0, (%r9,%rdx)
	addq	$4, %rdx
	addq	$32, %rcx
	cmpq	$40, %rdx
	jne	.L456
	movq	312(%rsp), %rdi
	leal	-1(%rsi), %edx
	movq	%r12, 48(%rsp)
	movq	320(%rsp), %rcx
	movq	%rbx, 56(%rsp)
	xorl	%ebx, %ebx
	imulq	$8100, %rdx, %r12
	leaq	40(%rdi), %r14
	leaq	40(%rcx), %rbp
	jmp	.L457
.L1330:
	leaq	.LC185(%rip), %rdx
	movq	%rsi, %rcx
	call	strcmp
	movl	%eax, %ecx
	movq	1192(%rsp), %rax
	leaq	(%rax,%rbx), %rdx
	addq	$8100, %rbx
	testl	%ecx, %ecx
	je	.L459
.L870:
	leaq	280(%rdx), %rsi
	movq	%r14, %rdi
	movl	$10, %ecx
	rep movsl
	movq	%rbp, %rdi
	movl	$10, %ecx
	addq	$40, %r14
	leaq	320(%rdx), %rsi
	addq	$40, %rbp
	rep movsl
.L457:
	cmpq	%rbx, %r12
	je	.L1329
	leaq	(%rax,%rbx), %rsi
	leaq	.LC184(%rip), %rdx
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	jne	.L1330
	movq	1192(%rsp), %rax
	addq	$8100, %rbx
	leaq	(%rax,%rbx), %rdx
	jmp	.L870
.L1282:
	movl	1200(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L441
	movq	1192(%rsp), %r9
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
.L442:
	imulq	$8100, %rax, %rdx
	addq	$1, %rax
	cmpl	%eax, %r8d
	addss	16(%r9,%rdx), %xmm1
	jg	.L442
	movss	.LC50(%rip), %xmm7
	divss	%xmm7, %xmm1
	addss	.LC180(%rip), %xmm1
	movaps	%xmm1, %xmm2
	maxss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	jmp	.L441
.L1281:
	leaq	.LC115(%rip), %rdx
	leaq	.LC165(%rip), %rcx
	call	printf
	movl	720(%rsp), %eax
	testl	%eax, %eax
	jne	.L1331
	leaq	.LC85(%rip), %rdx
.L435:
	leaq	.LC166(%rip), %rcx
	call	printf
	cmpl	$0, 724(%rsp)
	jne	.L891
	leaq	.LC88(%rip), %rdx
.L436:
	leaq	.LC167(%rip), %rcx
	call	printf
	movl	728(%rsp), %eax
	testl	%eax, %eax
	je	.L892
	leaq	.LC91(%rip), %rdx
	subl	$1, %eax
	jne	.L437
	leaq	.LC90(%rip), %rdx
.L437:
	leaq	.LC168(%rip), %rcx
	pxor	%xmm7, %xmm7
	xorl	%ebx, %ebx
	call	printf
	movl	732(%rsp), %edx
	leaq	.LC169(%rip), %rcx
	call	printf
	leaq	.LC170(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	736(%rsp), %xmm1
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC171(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	740(%rsp), %xmm1
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC172(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	1116(%rsp), %xmm7
	cvtss2sd	1108(%rsp), %xmm1
	movq	%xmm7, %r9
	movq	%xmm1, %rdx
	pxor	%xmm7, %xmm7
	cvtss2sd	1112(%rsp), %xmm7
	movq	%r9, %xmm3
	movq	%xmm7, %r8
	movapd	%xmm7, %xmm2
	call	printf
	pxor	%xmm7, %xmm7
	leaq	.LC173(%rip), %rcx
	cvtss2sd	1124(%rsp), %xmm7
	pxor	%xmm1, %xmm1
	movq	%xmm7, %r8
	movapd	%xmm7, %xmm2
	cvtss2sd	1120(%rsp), %xmm1
	movq	%xmm1, %rdx
	pxor	%xmm7, %xmm7
	call	printf
	leaq	.LC174(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	1132(%rsp), %xmm7
	cvtss2sd	1128(%rsp), %xmm1
	movq	%xmm7, %r8
	movapd	%xmm7, %xmm2
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC175(%rip), %rcx
	call	puts
	movq	64(%rsp), %rsi
	movq	%rsi, %rdi
	.p2align 4,,10
	.p2align 3
.L438:
	addl	$1, %ebx
	pxor	%xmm7, %xmm7
	pxor	%xmm0, %xmm0
	addq	$4, %rdi
	cvtss2sd	32(%rsi), %xmm7
	movq	%xmm7, %r9
	movl	%ebx, %edx
	cvtss2sd	344(%rdi), %xmm0
	movq	%r9, %xmm3
	pxor	%xmm7, %xmm7
	cvtss2sd	28(%rsi), %xmm7
	movapd	%xmm7, %xmm2
	movq	%xmm7, %r8
	movsd	%xmm0, 32(%rsp)
	addq	$32, %rsi
	leaq	.LC176(%rip), %rcx
	call	printf
	cmpl	$10, %ebx
	jne	.L438
	leaq	1232(%rsp), %rdx
	leaq	.LC177(%rip), %rcx
	call	printf
	leaq	.LC178(%rip), %rcx
	call	puts
	cmpl	$0, 2300(%rsp)
	je	.L434
	leaq	.LC179(%rip), %rcx
	call	puts
	jmp	.L434
.L1242:
	movl	332(%rsp), %r15d
	movl	348(%rsp), %r8d
	movl	232(%rsp), %r11d
	movl	192(%rsp), %r13d
	movq	224(%rsp), %rbx
	movss	236(%rsp), %xmm15
.L649:
	cmpl	%r8d, %r15d
	jg	.L464
	jmp	.L838
.L1304:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%r15d, %xmm0
	movl	%r15d, %edx
	cvtsi2ssl	732(%rsp), %xmm1
	leaq	.LC215(%rip), %rcx
	pxor	%xmm7, %xmm7
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm7
	movq	%xmm7, %r8
	movapd	%xmm7, %xmm2
	call	printf
	movl	2288(%rsp), %eax
	cmpl	$2, %eax
	je	.L851
	jbe	.L1256
	cmpl	$3, %eax
	jne	.L856
.L855:
	leaq	1232(%rsp), %rcx
	leaq	.LC216(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rsi
	jne	.L1239
.L1257:
	movq	__imp___acrt_iob_func(%rip), %rsi
.L858:
	movl	$2, %ecx
	call	*%rsi
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC233(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	%rbx, %rcx
	call	free
	jmp	.L282
.L1312:
	leal	-1(%rax), %r8d
	movslq	%eax, %rdx
	subq	$1, %rdx
	movl	%r8d, %eax
	imulq	$148, %rdx, %rdx
	comiss	(%rcx,%rdx), %xmm12
	jnb	.L663
	testl	%r8d, %r8d
	jle	.L935
	movq	%rcx, %rdx
	xorl	%eax, %eax
.L667:
	comiss	(%rdx), %xmm12
	jb	.L664
	movss	148(%rdx), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1332
.L664:
	addl	$1, %eax
	addq	$148, %rdx
	cmpl	%r8d, %eax
	jl	.L667
.L935:
	xorl	%eax, %eax
.L663:
	cltq
	movslq	%r8d, %rdx
	imulq	$148, %rdx, %rdx
	imulq	$148, %rax, %rax
	addq	%rcx, %rax
	addq	%rdx, %rcx
	movss	(%rax), %xmm0
	movss	(%rcx), %xmm1
	movl	144(%rax), %edx
	comiss	%xmm1, %xmm0
	movl	144(%rcx), %r10d
	jnb	.L668
	movaps	%xmm12, %xmm15
	subss	%xmm0, %xmm1
	testl	%edx, %edx
	subss	%xmm0, %xmm15
	je	.L1333
	movaps	%xmm15, %xmm5
	xorl	%edx, %edx
	pxor	%xmm11, %xmm11
	movss	%xmm1, 168(%rsp)
	divss	%xmm1, %xmm5
	jmp	.L686
.L1334:
	movaps	%xmm6, %xmm2
	movaps	%xmm6, %xmm1
	cmpltss	%xmm5, %xmm2
	andps	%xmm2, %xmm1
	andnps	%xmm5, %xmm2
	orps	%xmm1, %xmm2
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm13
.L688:
	subss	%xmm3, %xmm0
	testl	%r10d, %r10d
	movss	%xmm13, 368(%rsp,%rdx)
	mulss	%xmm2, %xmm0
	addss	%xmm3, %xmm0
	movss	104(%rax,%rdx), %xmm3
	movss	%xmm0, 416(%rsp,%rdx)
	jne	.L685
	movaps	%xmm6, %xmm0
.L687:
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm3, %xmm0
	movss	%xmm0, 464(%rsp,%rdx)
	addq	$4, %rdx
	cmpq	$40, %rdx
	je	.L1260
.L686:
	movss	4(%rcx,%rdx), %xmm0
	comiss	%xmm5, %xmm11
	movss	4(%rax,%rdx), %xmm13
	movaps	%xmm0, %xmm4
	movss	44(%rax,%rdx), %xmm3
	subss	%xmm13, %xmm4
	movss	44(%rcx,%rdx), %xmm0
	jbe	.L1334
	mulss	%xmm11, %xmm4
	pxor	%xmm2, %xmm2
	addss	%xmm4, %xmm13
	jmp	.L688
.L1290:
	leal	-1(%rax), %edx
	movslq	%eax, %r8
	subq	$1, %r8
	movl	%edx, %eax
	imulq	$148, %r8, %r8
	comiss	(%rcx,%r8), %xmm12
	jnb	.L477
	testl	%edx, %edx
	jle	.L904
	movq	%rcx, %r8
	xorl	%eax, %eax
.L481:
	comiss	(%r8), %xmm12
	jb	.L478
	movss	148(%r8), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1335
.L478:
	addl	$1, %eax
	addq	$148, %r8
	cmpl	%eax, %edx
	jg	.L481
.L904:
	xorl	%eax, %eax
.L477:
	cltq
	movslq	%edx, %rdx
	imulq	$148, %rdx, %rdx
	imulq	$148, %rax, %rax
	addq	%rcx, %rax
	addq	%rdx, %rcx
	movss	(%rax), %xmm0
	movss	(%rcx), %xmm1
	movl	144(%rax), %edx
	comiss	%xmm1, %xmm0
	movl	144(%rcx), %r8d
	jnb	.L482
	movaps	%xmm12, %xmm15
	subss	%xmm0, %xmm1
	testl	%edx, %edx
	subss	%xmm0, %xmm15
	jne	.L483
	movaps	%xmm15, %xmm11
	xorl	%edx, %edx
	pxor	%xmm5, %xmm5
	movss	%xmm1, 168(%rsp)
	divss	%xmm1, %xmm11
	leaq	368(%rsp), %r10
	leaq	416(%rsp), %r9
	jmp	.L489
.L1336:
	movaps	%xmm6, %xmm4
	subss	%xmm2, %xmm13
	movaps	%xmm6, %xmm1
	cmpltss	%xmm11, %xmm4
	testl	%r8d, %r8d
	andps	%xmm4, %xmm1
	andnps	%xmm11, %xmm4
	orps	%xmm1, %xmm4
	mulss	%xmm4, %xmm0
	mulss	%xmm4, %xmm13
	addss	%xmm3, %xmm0
	addss	%xmm2, %xmm13
	movss	%xmm0, (%r10,%rdx)
	movaps	%xmm6, %xmm0
	movss	%xmm13, (%r9,%rdx)
	je	.L486
	movss	104(%rcx,%rdx), %xmm0
.L486:
	movaps	%xmm6, %xmm2
	movaps	%xmm6, %xmm3
	cmpltss	%xmm11, %xmm2
	andps	%xmm2, %xmm3
	andnps	%xmm11, %xmm2
	orps	%xmm3, %xmm2
.L488:
	subss	%xmm6, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm6, %xmm0
	movss	%xmm0, 464(%rsp,%rdx)
	addq	$4, %rdx
	cmpq	$40, %rdx
	je	.L1261
.L489:
	comiss	%xmm11, %xmm5
	movss	4(%rax,%rdx), %xmm3
	movss	4(%rcx,%rdx), %xmm0
	movss	44(%rax,%rdx), %xmm2
	subss	%xmm3, %xmm0
	movss	44(%rcx,%rdx), %xmm13
	jbe	.L1336
	subss	%xmm2, %xmm13
	mulss	%xmm5, %xmm0
	testl	%r8d, %r8d
	mulss	%xmm5, %xmm13
	addss	%xmm3, %xmm0
	addss	%xmm2, %xmm13
	movss	%xmm0, (%r10,%rdx)
	movss	%xmm13, (%r9,%rdx)
	jne	.L487
	movaps	%xmm6, %xmm0
	pxor	%xmm2, %xmm2
	jmp	.L488
.L1210:
	addl	$1, %ecx
	jl	.L501
	imulq	$8100, %rsi, %rax
	movaps	%xmm12, %xmm1
	movaps	%xmm6, %xmm0
	addq	1192(%rsp), %rax
	subss	(%r12,%rsi,4), %xmm1
	movss	16(%rax), %xmm2
	movaps	%xmm1, %xmm5
	movq	%rax, %rdi
	movq	%rax, %rcx
	cmpltss	%xmm2, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm6, %xmm0
	orps	%xmm2, %xmm0
	divss	%xmm0, %xmm5
	call	phon_pitch
	movss	8084(%rdi), %xmm2
	movss	200(%rsp), %xmm3
	movaps	%xmm0, %xmm11
	pxor	%xmm0, %xmm0
	movl	8096(%rdi), %edx
	movss	8088(%rdi), %xmm13
	mulss	%xmm2, %xmm3
	movss	8092(%rdi), %xmm15
	movss	%xmm3, 168(%rsp)
	comiss	%xmm5, %xmm0
	jbe	.L1337
	testl	%edx, %edx
	pxor	%xmm1, %xmm1
	jle	.L1248
.L869:
	cmpl	$2, %edx
	pxor	%xmm15, %xmm15
	movaps	%xmm15, %xmm13
	je	.L908
	movss	%xmm15, 168(%rsp)
	xorl	%eax, %eax
	movaps	%xmm15, %xmm11
	movl	%eax, 220(%rsp)
.L511:
	imulq	$40, %rsi, %rdx
	movq	312(%rsp), %rax
	movaps	%xmm1, %xmm0
	movsldup	%xmm1, %xmm3
	movups	296(%rdi), %xmm4
	shufps	$0, %xmm0, %xmm0
	movups	320(%rdi), %xmm2
	leaq	(%rax,%rdx), %rcx
	addq	320(%rsp), %rdx
	testq	%r14, %r14
	movups	16(%rcx), %xmm1
	movq	.LC54(%rip), %rax
	subps	%xmm1, %xmm4
	movups	16(%rdx), %xmm5
	mulps	%xmm0, %xmm4
	addps	%xmm1, %xmm4
	movups	(%rdx), %xmm1
	subps	%xmm1, %xmm2
	movaps	%xmm4, 384(%rsp)
	mulps	%xmm0, %xmm2
	addps	%xmm1, %xmm2
	movups	336(%rdi), %xmm1
	subps	%xmm5, %xmm1
	movaps	%xmm2, 416(%rsp)
	movq	%xmm3, %xmm2
	mulps	%xmm0, %xmm1
	addps	%xmm5, %xmm1
	movups	280(%rdi), %xmm5
	movaps	%xmm1, 176(%rsp)
	movq	(%rcx), %xmm1
	movhps	8(%rcx), %xmm1
	subps	%xmm1, %xmm5
	movq	(%rcx), %xmm1
	movhps	8(%rcx), %xmm1
	mulps	%xmm0, %xmm5
	addps	%xmm1, %xmm5
	movq	32(%rdx), %xmm1
	movaps	%xmm5, 368(%rsp)
	movaps	176(%rsp), %xmm5
	movaps	%xmm5, 432(%rsp)
	movaps	.LC55(%rip), %xmm5
	movaps	%xmm5, 464(%rsp)
	movaps	%xmm5, 480(%rsp)
	movq	352(%rdi), %xmm0
	subps	%xmm1, %xmm0
	movq	%xmm0, %xmm0
	mulps	%xmm2, %xmm0
	movq	%xmm0, %xmm0
	addps	%xmm1, %xmm0
	movq	32(%rcx), %xmm1
	movq	%xmm0, %rdx
	movq	312(%rdi), %xmm0
	movq	%rax, 496(%rsp)
	movq	%rdx, 448(%rsp)
	subps	%xmm1, %xmm0
	movq	%xmm0, %xmm0
	mulps	%xmm0, %xmm2
	movq	%xmm2, %xmm2
	addps	%xmm1, %xmm2
	movlps	%xmm2, 400(%rsp)
	je	.L909
	movss	%xmm6, 176(%rsp)
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jg	.L1265
	jmp	.L475
.L1226:
	addl	$1, %edx
	jl	.L690
	imulq	$8100, %rbx, %rdi
	movaps	%xmm12, %xmm1
	movaps	%xmm6, %xmm2
	addq	1192(%rsp), %rdi
	subss	(%r12,%rbx,4), %xmm1
	movss	16(%rdi), %xmm0
	movaps	%xmm1, %xmm5
	movq	%rdi, %rcx
	cmpltss	%xmm0, %xmm2
	andps	%xmm2, %xmm0
	andnps	%xmm6, %xmm2
	orps	%xmm0, %xmm2
	divss	%xmm2, %xmm5
	call	phon_pitch
	movss	8084(%rdi), %xmm2
	movss	200(%rsp), %xmm3
	movaps	%xmm0, %xmm11
	pxor	%xmm0, %xmm0
	movl	8096(%rdi), %eax
	movss	8088(%rdi), %xmm13
	mulss	%xmm2, %xmm3
	movss	8092(%rdi), %xmm15
	movss	%xmm3, 168(%rsp)
	comiss	%xmm5, %xmm0
	ja	.L698
	movaps	%xmm6, %xmm0
	xorl	%edx, %edx
	movaps	%xmm6, %xmm1
	cmpltss	%xmm5, %xmm0
	testl	%eax, %eax
	movl	%edx, 220(%rsp)
	andps	%xmm0, %xmm1
	andnps	%xmm5, %xmm0
	orps	%xmm0, %xmm1
	jle	.L699
	movss	.LC198(%rip), %xmm4
	comiss	%xmm1, %xmm4
	ja	.L700
	movss	.LC199(%rip), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L1227
	movaps	%xmm1, %xmm0
	pxor	%xmm13, %xmm13
	movaps	%xmm13, %xmm11
	movss	%xmm1, 144(%rsp)
	subss	%xmm4, %xmm0
	divss	.LC200(%rip), %xmm0
	mulss	.LC187(%rip), %xmm0
	call	sinf
	mulss	.LC201(%rip), %xmm0
	movss	%xmm13, 168(%rsp)
	movss	144(%rsp), %xmm1
	movl	$1, 220(%rsp)
	movaps	%xmm0, %xmm15
.L699:
	imulq	$40, %rbx, %rax
	movq	312(%rsp), %rbx
	movaps	%xmm1, %xmm0
	movsldup	%xmm1, %xmm3
	movups	296(%rdi), %xmm4
	shufps	$0, %xmm0, %xmm0
	movups	320(%rdi), %xmm2
	leaq	(%rbx,%rax), %rdx
	addq	320(%rsp), %rax
	testq	%r14, %r14
	movups	16(%rdx), %xmm1
	subps	%xmm1, %xmm4
	movups	16(%rax), %xmm5
	mulps	%xmm0, %xmm4
	addps	%xmm1, %xmm4
	movups	(%rax), %xmm1
	subps	%xmm1, %xmm2
	movaps	%xmm4, 384(%rsp)
	mulps	%xmm0, %xmm2
	addps	%xmm1, %xmm2
	movups	336(%rdi), %xmm1
	subps	%xmm5, %xmm1
	movaps	%xmm2, 416(%rsp)
	movq	%xmm3, %xmm2
	mulps	%xmm0, %xmm1
	addps	%xmm5, %xmm1
	movups	280(%rdi), %xmm5
	movaps	%xmm1, 144(%rsp)
	movq	(%rdx), %xmm1
	movhps	8(%rdx), %xmm1
	subps	%xmm1, %xmm5
	movq	(%rdx), %xmm1
	movhps	8(%rdx), %xmm1
	mulps	%xmm0, %xmm5
	addps	%xmm1, %xmm5
	movq	32(%rax), %xmm1
	movaps	%xmm5, 368(%rsp)
	movaps	144(%rsp), %xmm5
	movaps	%xmm5, 432(%rsp)
	movaps	.LC55(%rip), %xmm5
	movaps	%xmm5, 464(%rsp)
	movaps	%xmm5, 480(%rsp)
	movq	352(%rdi), %xmm0
	subps	%xmm1, %xmm0
	movq	%xmm0, %xmm0
	mulps	%xmm2, %xmm0
	movq	%xmm0, %xmm0
	addps	%xmm1, %xmm0
	movq	32(%rdx), %xmm1
	movq	%xmm0, %rax
	movq	312(%rdi), %xmm0
	movq	%rax, 448(%rsp)
	movq	.LC54(%rip), %rax
	subps	%xmm1, %xmm0
	movq	%xmm0, %xmm0
	movq	%rax, 496(%rsp)
	mulps	%xmm0, %xmm2
	movq	%xmm2, %xmm2
	addps	%xmm1, %xmm2
	movlps	%xmm2, 400(%rsp)
	je	.L939
	movss	%xmm6, 144(%rsp)
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jle	.L661
.L1269:
	movss	(%r14), %xmm0
	comiss	%xmm12, %xmm0
	jnb	.L1253
.L1228:
	movaps	%xmm12, %xmm2
	movq	%r14, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm11
	jmp	.L661
.L659:
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	jne	.L1251
	movss	200(%rsp), %xmm3
	movss	%xmm6, 144(%rsp)
	movss	208(%rsp), %xmm13
	movss	204(%rsp), %xmm15
	movss	%xmm3, 168(%rsp)
	jmp	.L1228
.L472:
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	jne	.L1247
	movss	200(%rsp), %xmm3
	movss	%xmm6, 176(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm3, 168(%rsp)
	jmp	.L1213
.L1279:
	leaq	1168(%rsp), %rdx
	leaq	1744(%rsp), %rcx
	call	spec_parse
	addl	$1, %eax
	je	.L282
	movl	1180(%rsp), %eax
	cmpl	$22050, %eax
	je	.L426
	movl	%eax, 732(%rsp)
.L426:
	movl	1184(%rsp), %eax
	testl	%eax, %eax
	je	.L427
	movl	%eax, 724(%rsp)
.L427:
	movss	.LC50(%rip), %xmm7
	movss	1188(%rsp), %xmm0
	divss	%xmm7, %xmm0
	addss	.LC83(%rip), %xmm0
	comiss	736(%rsp), %xmm0
	jbe	.L429
	movss	%xmm0, 736(%rsp)
	jmp	.L429
.L1232:
	pxor	%xmm0, %xmm0
	jmp	.L740
.L868:
	cmpl	$3, %eax
	je	.L855
	jmp	.L867
.L483:
	movaps	%xmm15, %xmm5
	xorl	%edx, %edx
	pxor	%xmm11, %xmm11
	movss	%xmm1, 168(%rsp)
	divss	%xmm1, %xmm5
	jmp	.L496
.L1338:
	mulss	%xmm11, %xmm4
	pxor	%xmm2, %xmm2
	addss	%xmm4, %xmm13
.L495:
	subss	%xmm3, %xmm0
	testl	%r8d, %r8d
	movss	%xmm13, 368(%rsp,%rdx)
	mulss	%xmm2, %xmm0
	addss	%xmm3, %xmm0
	movss	104(%rax,%rdx), %xmm3
	movss	%xmm0, 416(%rsp,%rdx)
	movaps	%xmm6, %xmm0
	je	.L494
	movss	104(%rcx,%rdx), %xmm0
.L494:
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm3, %xmm0
	movss	%xmm0, 464(%rsp,%rdx)
	addq	$4, %rdx
	cmpq	$40, %rdx
	je	.L1261
.L496:
	movss	4(%rcx,%rdx), %xmm0
	comiss	%xmm5, %xmm11
	movss	4(%rax,%rdx), %xmm13
	movaps	%xmm0, %xmm4
	movss	44(%rax,%rdx), %xmm3
	subss	%xmm13, %xmm4
	movss	44(%rcx,%rdx), %xmm0
	ja	.L1338
	movaps	%xmm6, %xmm2
	movaps	%xmm6, %xmm1
	cmpltss	%xmm5, %xmm2
	andps	%xmm2, %xmm1
	andnps	%xmm5, %xmm2
	orps	%xmm1, %xmm2
	mulss	%xmm2, %xmm4
	addss	%xmm4, %xmm13
	jmp	.L495
.L1333:
	movaps	%xmm15, %xmm4
	xorl	%edx, %edx
	pxor	%xmm11, %xmm11
	movss	%xmm1, 168(%rsp)
	divss	%xmm1, %xmm4
	leaq	368(%rsp), %r9
	leaq	416(%rsp), %r8
	jmp	.L679
.L1339:
	subss	%xmm2, %xmm13
	mulss	%xmm11, %xmm0
	testl	%r10d, %r10d
	mulss	%xmm11, %xmm13
	addss	%xmm3, %xmm0
	addss	%xmm2, %xmm13
	movss	%xmm0, (%r9,%rdx)
	movss	%xmm13, (%r8,%rdx)
	jne	.L678
	movaps	%xmm6, %xmm0
	pxor	%xmm2, %xmm2
.L681:
	subss	%xmm6, %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm6, %xmm0
	movss	%xmm0, 464(%rsp,%rdx)
	addq	$4, %rdx
	cmpq	$40, %rdx
	je	.L1260
.L679:
	comiss	%xmm4, %xmm11
	movss	4(%rax,%rdx), %xmm3
	movss	4(%rcx,%rdx), %xmm0
	movss	44(%rax,%rdx), %xmm2
	subss	%xmm3, %xmm0
	movss	44(%rcx,%rdx), %xmm13
	ja	.L1339
	movaps	%xmm6, %xmm5
	subss	%xmm2, %xmm13
	movaps	%xmm6, %xmm1
	cmpltss	%xmm4, %xmm5
	testl	%r10d, %r10d
	andps	%xmm5, %xmm1
	andnps	%xmm4, %xmm5
	orps	%xmm1, %xmm5
	mulss	%xmm5, %xmm0
	mulss	%xmm5, %xmm13
	addss	%xmm3, %xmm0
	addss	%xmm2, %xmm13
	movss	%xmm0, (%r9,%rdx)
	movaps	%xmm6, %xmm0
	movss	%xmm13, (%r8,%rdx)
	je	.L682
	movss	104(%rcx,%rdx), %xmm0
.L682:
	movaps	%xmm6, %xmm2
	movaps	%xmm6, %xmm3
	cmpltss	%xmm4, %xmm2
	andps	%xmm2, %xmm3
	andnps	%xmm4, %xmm2
	orps	%xmm3, %xmm2
	jmp	.L681
.L1331:
	leaq	.LC87(%rip), %rdx
	subl	$1, %eax
	jne	.L435
	leaq	.LC86(%rip), %rdx
	jmp	.L435
.L1278:
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC88(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L308
	xorl	%eax, %eax
	movl	%eax, 724(%rsp)
	jmp	.L284
.L1289:
	leaq	g_preset_natural(%rip), %rax
	jmp	.L400
.L698:
	testl	%eax, %eax
	pxor	%xmm1, %xmm1
	jle	.L1252
.L700:
	cmpl	$2, %eax
	pxor	%xmm15, %xmm15
	movaps	%xmm15, %xmm13
	je	.L938
	movss	%xmm15, 168(%rsp)
	xorl	%eax, %eax
	movaps	%xmm15, %xmm11
	movl	%eax, 220(%rsp)
	jmp	.L699
.L1337:
	movaps	%xmm6, %xmm0
	xorl	%ecx, %ecx
	movaps	%xmm6, %xmm1
	cmpltss	%xmm5, %xmm0
	testl	%edx, %edx
	movl	%ecx, 220(%rsp)
	andps	%xmm0, %xmm1
	andnps	%xmm5, %xmm0
	orps	%xmm0, %xmm1
	jle	.L511
	movss	.LC198(%rip), %xmm4
	comiss	%xmm1, %xmm4
	ja	.L869
	movss	.LC199(%rip), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L1212
	movaps	%xmm1, %xmm0
	pxor	%xmm13, %xmm13
	movaps	%xmm13, %xmm11
	movss	%xmm1, 176(%rsp)
	subss	%xmm4, %xmm0
	divss	.LC200(%rip), %xmm0
	mulss	.LC187(%rip), %xmm0
	call	sinf
	mulss	.LC201(%rip), %xmm0
	movss	%xmm13, 168(%rsp)
	movss	176(%rsp), %xmm1
	movl	$1, 220(%rsp)
	movaps	%xmm0, %xmm15
	jmp	.L511
.L685:
	movss	104(%rcx,%rdx), %xmm0
	jmp	.L687
.L487:
	movss	104(%rcx,%rdx), %xmm0
	pxor	%xmm2, %xmm2
	jmp	.L488
.L1261:
	movss	168(%rsp), %xmm1
	movss	84(%rax), %xmm13
	divss	%xmm1, %xmm15
	pxor	%xmm1, %xmm1
	movss	100(%rax), %xmm2
	movss	96(%rax), %xmm5
	movss	92(%rax), %xmm4
	movss	88(%rax), %xmm11
	movss	84(%rcx), %xmm0
	comiss	%xmm15, %xmm1
	ja	.L875
	movaps	%xmm6, %xmm1
	movaps	%xmm6, %xmm3
	cmpltss	%xmm15, %xmm1
	andps	%xmm1, %xmm3
	andnps	%xmm15, %xmm1
	orps	%xmm3, %xmm1
.L875:
	subss	%xmm13, %xmm0
	movss	92(%rcx), %xmm15
	subss	%xmm4, %xmm15
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm15
	addss	%xmm13, %xmm0
	movss	88(%rcx), %xmm13
	subss	%xmm11, %xmm13
	movss	%xmm0, 168(%rsp)
	movss	100(%rcx), %xmm0
	addss	%xmm4, %xmm15
	mulss	%xmm1, %xmm13
	subss	%xmm2, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm11, %xmm13
	movss	96(%rcx), %xmm11
	subss	%xmm5, %xmm11
	addss	%xmm2, %xmm0
	mulss	%xmm1, %xmm11
	movss	%xmm0, 176(%rsp)
	addss	%xmm5, %xmm11
	jmp	.L874
.L1260:
	movss	168(%rsp), %xmm1
	movss	84(%rax), %xmm13
	divss	%xmm1, %xmm15
	pxor	%xmm1, %xmm1
	movss	100(%rax), %xmm4
	movss	96(%rax), %xmm5
	movss	92(%rax), %xmm2
	movss	88(%rax), %xmm11
	movss	84(%rcx), %xmm0
	comiss	%xmm15, %xmm1
	ja	.L871
	movaps	%xmm6, %xmm1
	movaps	%xmm6, %xmm3
	cmpltss	%xmm15, %xmm1
	andps	%xmm1, %xmm3
	andnps	%xmm15, %xmm1
	orps	%xmm3, %xmm1
.L871:
	subss	%xmm13, %xmm0
	movss	92(%rcx), %xmm15
	subss	%xmm2, %xmm15
	mulss	%xmm1, %xmm0
	mulss	%xmm1, %xmm15
	addss	%xmm13, %xmm0
	movss	88(%rcx), %xmm13
	subss	%xmm11, %xmm13
	movss	%xmm0, 168(%rsp)
	movss	100(%rcx), %xmm0
	addss	%xmm2, %xmm15
	mulss	%xmm1, %xmm13
	subss	%xmm4, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm11, %xmm13
	movss	96(%rcx), %xmm11
	subss	%xmm5, %xmm11
	addss	%xmm4, %xmm0
	mulss	%xmm1, %xmm11
	movss	%xmm0, 144(%rsp)
	addss	%xmm5, %xmm11
.L873:
	testq	%r14, %r14
	je	.L661
	movl	1160(%rsp), %edx
	testl	%edx, %edx
	jg	.L1269
	jmp	.L661
.L678:
	movss	104(%rcx,%rdx), %xmm0
	pxor	%xmm2, %xmm2
	jmp	.L681
.L851:
	leaq	1232(%rsp), %rcx
	leaq	.LC216(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbp
	je	.L1257
	movss	.LC226(%rip), %xmm7
	xorl	%esi, %esi
	jmp	.L864
.L866:
	movss	(%rbx,%rsi,4), %xmm1
	movss	.LC98(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L865
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L865:
	mulss	%xmm7, %xmm0
	movq	%rbp, %r9
	movl	$2, %r8d
	movl	$1, %edx
	addq	$1, %rsi
	leaq	464(%rsp), %rcx
	cvttss2sil	%xmm0, %eax
	movw	%ax, 464(%rsp)
	call	fwrite
.L864:
	cmpl	%esi, %r15d
	jg	.L866
	movq	%rbp, %rcx
	call	fclose
	jmp	.L856
.L1305:
	leaq	.LC216(%rip), %rdx
	movl	732(%rsp), %ebp
	leaq	1232(%rsp), %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L1258
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	movl	$1179011410, 464(%rsp)
	leaq	464(%rsp), %rcx
	call	fwrite
	leal	36(%r15,%r15), %edx
	movq	%rsi, %rcx
	call	w32
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$1163280727, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$544501094, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$16, 464(%rsp)
	call	fwrite
	movzwl	.LC222(%rip), %r13d
	movq	%rsi, %r9
	movl	$2, %r8d
	leaq	464(%rsp), %rcx
	movl	$1, %edx
	movw	%r13w, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	%r13w, 464(%rsp)
	call	fwrite
	movl	%ebp, %edx
	movq	%rsi, %rcx
	call	w32
	leal	(%rbp,%rbp), %edx
	movq	%rsi, %rcx
	xorl	%ebp, %ebp
	call	w32
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$2, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movw	$16, 464(%rsp)
	call	fwrite
	movq	%rsi, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	464(%rsp), %rcx
	movl	$1635017060, 464(%rsp)
	call	fwrite
	leal	(%r15,%r15), %edx
	movq	%rsi, %rcx
	call	w32
	movss	.LC226(%rip), %xmm7
	jmp	.L859
.L861:
	movss	(%rbx,%rbp,4), %xmm1
	movss	.LC98(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L860
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L860:
	mulss	%xmm7, %xmm0
	movq	%rsi, %r9
	movl	$2, %r8d
	movl	$1, %edx
	addq	$1, %rbp
	leaq	464(%rsp), %rcx
	cvttss2sil	%xmm0, %eax
	movw	%ax, 464(%rsp)
	call	fwrite
.L859:
	cmpl	%ebp, %r15d
	jg	.L861
	jmp	.L1259
.L1313:
	movss	84(%rax), %xmm3
	movss	96(%rax), %xmm11
	movss	%xmm3, 168(%rsp)
	movss	100(%rax), %xmm3
	movss	92(%rax), %xmm15
	movss	%xmm3, 144(%rsp)
	movss	88(%rax), %xmm13
	jmp	.L873
.L1280:
	leaq	1192(%rsp), %rdx
	leaq	1744(%rsp), %rcx
	call	phoneme_parse
	addl	$1, %eax
	je	.L282
	movl	1204(%rsp), %eax
	cmpl	$22050, %eax
	je	.L432
	movl	%eax, 732(%rsp)
.L432:
	movl	1208(%rsp), %eax
	testl	%eax, %eax
	je	.L429
	movl	%eax, 724(%rsp)
	jmp	.L429
.L902:
	movss	200(%rsp), %xmm3
	movss	%xmm6, 176(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm3, 168(%rsp)
	jmp	.L475
.L892:
	leaq	.LC89(%rip), %rdx
	jmp	.L437
.L891:
	leaq	.LC48(%rip), %rdx
	jmp	.L436
.L933:
	movss	200(%rsp), %xmm3
	movss	%xmm6, 144(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm3, 168(%rsp)
	jmp	.L661
.L1307:
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	jne	.L1247
	movss	200(%rsp), %xmm3
	movss	%xmm6, 176(%rsp)
	movss	204(%rsp), %xmm15
	movss	208(%rsp), %xmm13
	movss	%xmm3, 168(%rsp)
.L1249:
	movss	4(%r14), %xmm11
	jmp	.L475
.L1328:
	movl	1176(%rsp), %eax
	testl	%eax, %eax
	jne	.L1251
	movss	200(%rsp), %xmm3
	movss	%xmm6, 144(%rsp)
	movss	208(%rsp), %xmm13
	movss	204(%rsp), %xmm15
	movss	%xmm3, 168(%rsp)
.L1253:
	movss	4(%r14), %xmm11
	jmp	.L661
.L1329:
	movq	48(%rsp), %r12
	movq	56(%rsp), %rbx
	jmp	.L452
.L887:
	leaq	g_preset_breathy(%rip), %rax
	jmp	.L400
.L1283:
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	call	*%rbx
	leaq	.LC181(%rip), %rdx
	movl	%r15d, %r8d
	movq	%rax, %rcx
	call	fprintf
	movl	$2, %ecx
	call	*%rbx
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC182(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L282
.L311:
	leaq	.LC132(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L314
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC89(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L316
	xorl	%r15d, %r15d
	movl	%r15d, 728(%rsp)
	jmp	.L284
.L908:
	movss	.LC96(%rip), %xmm3
	movss	%xmm3, 168(%rsp)
.L1248:
	xorl	%eax, %eax
	movl	%eax, 220(%rsp)
	jmp	.L511
.L938:
	movss	.LC96(%rip), %xmm3
	movss	%xmm3, 168(%rsp)
.L1252:
	xorl	%eax, %eax
	movl	%eax, 220(%rsp)
	jmp	.L699
.L939:
	movss	%xmm6, 144(%rsp)
	jmp	.L661
.L308:
	leaq	.LC48(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L310
	movl	$1, 724(%rsp)
	jmp	.L284
.L909:
	movss	%xmm6, 176(%rsp)
	jmp	.L475
.L1335:
	leal	1(%rax), %edx
	jmp	.L477
.L1332:
	leal	1(%rax), %r8d
	jmp	.L663
.L1212:
	movaps	%xmm1, %xmm4
	subl	$1, %edx
	subss	%xmm0, %xmm4
	divss	.LC202(%rip), %xmm4
	je	.L1340
	mulss	%xmm4, %xmm2
	pxor	%xmm15, %xmm15
	movss	%xmm2, 168(%rsp)
	movaps	%xmm6, %xmm2
	subss	%xmm4, %xmm2
	mulss	%xmm2, %xmm13
	jmp	.L511
.L1227:
	movaps	%xmm1, %xmm4
	subl	$1, %eax
	subss	%xmm0, %xmm4
	divss	.LC202(%rip), %xmm4
	je	.L1341
	mulss	%xmm4, %xmm2
	pxor	%xmm15, %xmm15
	movss	%xmm2, 168(%rsp)
	movaps	%xmm6, %xmm2
	subss	%xmm4, %xmm2
	mulss	%xmm2, %xmm13
	jmp	.L699
.L314:
	leaq	.LC133(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L319
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L321
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L321:
	movss	%xmm0, 1108(%rsp)
	jmp	.L284
.L316:
	leaq	.LC90(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L317
	movl	$1, 728(%rsp)
	jmp	.L284
.L319:
	leaq	.LC134(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L322
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L324
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L324:
	movss	%xmm0, 1112(%rsp)
	jmp	.L284
.L1341:
	pxor	%xmm15, %xmm15
	mulss	%xmm4, %xmm13
	movss	%xmm15, 168(%rsp)
	jmp	.L699
.L1340:
	pxor	%xmm15, %xmm15
	mulss	%xmm4, %xmm13
	movss	%xmm15, 168(%rsp)
	jmp	.L511
.L322:
	leaq	.LC135(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L325
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L327
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L327:
	movss	%xmm0, 1116(%rsp)
	jmp	.L284
.L317:
	leaq	.LC91(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L318
	movl	$2, 728(%rsp)
	jmp	.L284
.L325:
	leaq	.LC136(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L328
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L330
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L330:
	movss	%xmm0, 1120(%rsp)
	jmp	.L284
.L328:
	leaq	.LC138(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L331
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	movss	.LC84(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L333
	movss	.LC139(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L333:
	movss	%xmm0, 1124(%rsp)
	jmp	.L284
.L295:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC123(%rip), %rdx
	movq	%rbp, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
.L1258:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movq	__imp___acrt_iob_func(%rip), %rsi
	movl	$2, %ecx
	movq	%rax, %rbp
	call	*%rsi
	leaq	1232(%rsp), %r8
	movq	%rbp, %r9
	leaq	.LC217(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L858
.L331:
	leaq	.LC140(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L334
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L336
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L336:
	movss	%xmm0, 1128(%rsp)
	jmp	.L284
.L334:
	leaq	.LC141(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L337
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L339
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L339:
	movss	%xmm0, 1132(%rsp)
	jmp	.L284
.L337:
	leaq	.LC142(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L340
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %r13
	leaq	.LC43(%rip), %rdx
	movq	%r13, %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L1342
	movl	$65536, %ecx
	xorl	%r14d, %r14d
	call	malloc
	movl	%r14d, 1160(%rsp)
	movq	%rax, 1152(%rsp)
.L343:
	leaq	464(%rsp), %rcx
	movq	%r12, %r8
	movl	$256, %edx
	call	fgets
	testq	%rax, %rax
	je	.L348
	cmpl	$8191, 1160(%rsp)
	jg	.L348
	leaq	464(%rsp), %rcx
	jmp	.L349
.L344:
	addq	$1, %rcx
.L349:
	movzbl	(%rcx), %eax
	cmpb	$32, %al
	je	.L344
	cmpb	$9, %al
	je	.L344
	subl	$10, %eax
	cmpb	$25, %al
	ja	.L345
	movl	$33554441, %edx
	btq	%rax, %rdx
	jc	.L343
.L345:
	leaq	364(%rsp), %r9
	leaq	360(%rsp), %r8
	leaq	.LC144(%rip), %rdx
	call	sscanf
	cmpl	$2, %eax
	jne	.L343
	movslq	1160(%rsp), %rcx
	movq	1152(%rsp), %rdx
	movss	364(%rsp), %xmm1
	movss	360(%rsp), %xmm0
	movq	%rcx, %rax
	addl	$1, %eax
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, (%rdx,%rcx,8)
	movl	%eax, 1160(%rsp)
	jmp	.L343
.L1342:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC143(%rip), %rdx
	movq	%r13, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
.L340:
	leaq	.LC145(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L350
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movl	$1, 368(%rsp,%rax,4)
	movq	%rax, %rdx
	salq	$5, %rdx
	movss	%xmm0, 748(%rsp,%rdx)
	jmp	.L284
.L348:
	movq	%r12, %rcx
	call	fclose
	jmp	.L284
.L459:
	leaq	(%rax,%rbx), %rdx
	jmp	.L870
.L318:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC123(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
.L310:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC130(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
.L350:
	leaq	.LC146(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L352
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movl	$1, 416(%rsp,%rax,4)
	movq	%rax, %rdx
	salq	$5, %rdx
	movss	%xmm0, 752(%rsp,%rdx)
	jmp	.L284
.L352:
	leaq	.LC147(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L354
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1068(%rsp,%rax,4)
	jmp	.L284
.L354:
	leaq	.LC148(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1343
	leaq	.LC149(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L358
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1136(%rsp)
	jmp	.L284
.L1343:
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 912(%rsp)
	movss	%xmm0, 944(%rsp)
	movss	%xmm0, 976(%rsp)
	movss	%xmm0, 1008(%rsp)
	movss	%xmm0, 1040(%rsp)
	jmp	.L284
.L358:
	leaq	.LC150(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L360
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1140(%rsp)
	jmp	.L284
.L360:
	leaq	.LC151(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L362
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1144(%rsp)
	jmp	.L284
.L362:
	leaq	.LC152(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L364
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %rdx
	leaq	1232(%rsp), %rcx
	movl	$511, %r8d
	call	strncpy
	jmp	.L284
.L364:
	leaq	.LC153(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L366
	cmpl	%ebx, %esi
	jle	.L1245
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC154(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L368
	xorl	%r13d, %r13d
	movl	%r13d, 2288(%rsp)
	jmp	.L284
.L366:
	leaq	.LC159(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1344
	leaq	.LC160(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1345
	leaq	.LC161(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1346
	leaq	.LC162(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1347
	cmpb	$45, (%r12)
	je	.L377
	leaq	1232(%rsp), %rcx
	movl	$511, %r8d
	movq	%r12, %rdx
	call	strncpy
.L373:
	movl	%r13d, %ebx
	jmp	.L284
.L368:
	leaq	.LC155(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L369
	movl	$1, 2288(%rsp)
	jmp	.L284
.L377:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC163(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L373
.L369:
	leaq	.LC156(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L370
	movl	$2, 2288(%rsp)
	jmp	.L284
.L1347:
	movl	$1, 2300(%rsp)
	jmp	.L373
.L1345:
	xorl	%r12d, %r12d
	movl	%r12d, 2292(%rsp)
	jmp	.L373
.L1344:
	movl	$1, 2292(%rsp)
	jmp	.L373
.L1346:
	xorl	%ebx, %ebx
	movl	%ebx, 2296(%rsp)
	jmp	.L373
.L370:
	leaq	.LC157(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L371
	movl	$3, 2288(%rsp)
	jmp	.L284
.L371:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC158(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L282
	.seh_endproc
	.section .rdata,"dr"
	.align 32
g_preset_impulsive:
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
	.long	1062836634
	.long	1034147594
	.long	0
	.long	1125515264
	.long	0
	.long	1084227584
	.long	1056964608
	.long	1065353216
	.align 32
g_preset_breathy:
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
	.long	1055286886
	.long	1059481190
	.long	1028443341
	.long	1119748096
	.long	1056964608
	.long	1083179008
	.long	1082130432
	.long	1082130432
	.align 32
g_preset_natural:
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
	.long	1075838976
	.long	1039516303
	.long	0
	.long	1123024896
	.long	1069547520
	.long	1085276160
	.long	1065353216
	.long	1073741824
	.align 32
g_phoneme_db:
	.ascii "a\0"
	.space 14
	.long	1132068864
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1123024896
	.ascii "e\0"
	.space 14
	.long	1130102784
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1123024896
	.ascii "i\0"
	.space 14
	.long	1128792064
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1123024896
	.ascii "o\0"
	.space 14
	.long	1132068864
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122369536
	.ascii "u\0"
	.space 14
	.long	1130102784
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122369536
	.ascii "ae\0"
	.space 13
	.long	1131413504
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1123024896
	.ascii "ah\0"
	.space 13
	.long	1130758144
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122762752
	.ascii "aw\0"
	.space 13
	.long	1132593152
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122369536
	.ascii "er\0"
	.space 13
	.long	1130102784
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122762752
	.ascii "ih\0"
	.space 13
	.long	1127481344
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1123024896
	.ascii "uh\0"
	.space 13
	.long	1128792064
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
	.long	1063675494
	.long	1036831949
	.long	0
	.long	1122762752
	.ascii "m\0"
	.space 14
	.long	1117782016
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
	.long	1063675494
	.long	0
	.long	0
	.long	1122369536
	.ascii "n\0"
	.space 14
	.long	1117782016
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
	.long	1063675494
	.long	0
	.long	0
	.long	1122369536
	.ascii "ng\0"
	.space 13
	.long	1120403456
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
	.long	1063675494
	.long	0
	.long	0
	.long	1122369536
	.ascii "l\0"
	.space 14
	.long	1123024896
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
	.long	1062836634
	.long	1028443341
	.long	0
	.long	1122369536
	.ascii "r\0"
	.space 14
	.long	1123024896
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
	.long	1062836634
	.long	1028443341
	.long	0
	.long	1122369536
	.ascii "w\0"
	.space 14
	.long	1120403456
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
	.long	1062836634
	.long	1028443341
	.long	0
	.long	1122369536
	.ascii "y\0"
	.space 14
	.long	1120403456
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
	.long	1062836634
	.long	1028443341
	.long	0
	.long	1122369536
	.ascii "v\0"
	.space 14
	.long	1123024896
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
	.long	1056964608
	.long	1036831949
	.long	1056964608
	.long	1121714176
	.ascii "z\0"
	.space 14
	.long	1123024896
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
	.long	1056964608
	.long	1036831949
	.long	1058642330
	.long	1121714176
	.ascii "zh\0"
	.space 13
	.long	1123024896
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
	.long	1056964608
	.long	1036831949
	.long	1058642330
	.long	1121714176
	.ascii "dh\0"
	.space 13
	.long	1120403456
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
	.long	1056964608
	.long	1036831949
	.long	1053609165
	.long	1121714176
	.ascii "f\0"
	.space 14
	.long	1123024896
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
	.long	0
	.long	1050253722
	.long	1061997773
	.long	0
	.ascii "s\0"
	.space 14
	.long	1124204544
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
	.long	0
	.long	1036831949
	.long	1063675494
	.long	0
	.ascii "sh\0"
	.space 13
	.long	1124204544
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
	.long	0
	.long	1045220557
	.long	1061997773
	.long	0
	.ascii "th\0"
	.space 13
	.long	1124204544
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
	.long	0
	.long	1045220557
	.long	1058642330
	.long	0
	.ascii "h\0"
	.space 14
	.long	1117782016
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
	.long	0
	.long	1045220557
	.long	0
	.long	0
	.ascii "b\0"
	.space 14
	.long	1117782016
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
	.long	1060320051
	.long	1053609165
	.long	1058642330
	.long	1117782016
	.ascii "d\0"
	.space 14
	.long	1117782016
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
	.long	1060320051
	.long	1053609165
	.long	1056964608
	.long	1117782016
	.ascii "g\0"
	.space 14
	.long	1117782016
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
	.long	1060320051
	.long	1053609165
	.long	1056964608
	.long	1117782016
	.ascii "p\0"
	.space 14
	.long	1117782016
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
	.long	0
	.long	1061997773
	.long	1061997773
	.long	0
	.ascii "t\0"
	.space 14
	.long	1117782016
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
	.long	0
	.long	1061997773
	.long	1060320051
	.long	0
	.ascii "k\0"
	.space 14
	.long	1117782016
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
	.long	0
	.long	1061997773
	.long	1060320051
	.long	0
	.ascii "ch\0"
	.space 13
	.long	1120403456
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
	.long	0
	.long	1058642330
	.long	1061997773
	.long	0
	.ascii "jh\0"
	.space 13
	.long	1120403456
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
	.long	1056964608
	.long	1056964608
	.long	1060320051
	.long	1117782016
	.ascii "_\0"
	.space 14
	.long	1117782016
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
	.long	0
	.long	0
	.long	0
	.long	0
	.ascii "SIL\0"
	.space 12
	.long	1117782016
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
	.long	0
	.long	0
	.long	0
	.long	0
	.data
	.align 4
g_noise_state:
	.long	-1412567295
	.set	.LC0,.LC103+4
	.section .rdata,"dr"
	.align 4
.LC2:
	.long	1120403456
	.set	.LC42,.LC55
	.align 8
.LC45:
	.long	0
	.long	22050
	.align 4
.LC50:
	.long	1148846080
	.set	.LC54,.LC55
	.align 16
.LC55:
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.align 4
.LC58:
	.long	897988541
	.set	.LC60,.LC99+4
	.set	.LC61,.LC79+8
	.align 4
.LC64:
	.long	1082130432
	.align 4
.LC69:
	.long	953267991
	.align 16
.LC77:
	.long	1143930880
	.long	1150844928
	.long	1159888896
	.long	1163739136
	.align 16
.LC78:
	.long	1166843904
	.long	1168891904
	.long	1170939904
	.long	1172987904
	.align 16
.LC79:
	.long	1174720512
	.long	1175744512
	.long	1121714176
	.long	1124204544
	.align 16
.LC80:
	.long	1121714176
	.long	1124204544
	.long	1124859904
	.long	1125515264
	.align 16
.LC81:
	.long	1126170624
	.long	1126825984
	.long	1127481344
	.long	1128136704
	.align 8
.LC82:
	.long	1061997773
	.long	1045220557
	.align 4
.LC83:
	.long	1036831949
	.align 4
.LC84:
	.long	1056964608
	.set	.LC92,.LC100+12
	.set	.LC93,.LC101+4
	.set	.LC94,.LC101
	.set	.LC95,.LC77
	.align 4
.LC96:
	.long	1043878380
	.align 4
.LC97:
	.long	1109393408
	.align 4
.LC98:
	.long	-1082130432
	.align 8
.LC99:
	.long	1060320051
	.long	1048576000
	.align 16
.LC100:
	.long	1084227584
	.long	1065353216
	.long	1073741824
	.long	1140457472
	.align 8
.LC101:
	.long	1165623296
	.long	1157234688
	.align 8
.LC102:
	.long	1
	.long	1
	.align 8
.LC103:
	.long	1073741824
	.long	1123024896
	.align 8
.LC104:
	.long	1150844928
	.long	1124204544
	.align 8
.LC105:
	.long	1159888896
	.long	1121714176
	.align 8
.LC106:
	.long	1163739136
	.long	1124204544
	.align 8
.LC107:
	.long	1166843904
	.long	1124859904
	.align 8
.LC108:
	.long	1168891904
	.long	1125515264
	.align 8
.LC109:
	.long	1170939904
	.long	1126170624
	.align 8
.LC110:
	.long	1172987904
	.long	1126825984
	.align 8
.LC111:
	.long	1174720512
	.long	1127481344
	.align 8
.LC112:
	.long	1175744512
	.long	1128136704
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
.LC164:
	.long	814313567
	.align 4
.LC180:
	.long	1028443341
	.align 4
.LC183:
	.long	-1068953637
	.align 4
.LC186:
	.long	1006834287
	.align 4
.LC187:
	.long	1078530011
	.align 4
.LC188:
	.long	1068827891
	.align 4
.LC189:
	.long	-1073741824
	.align 4
.LC190:
	.long	1086918619
	.align 4
.LC191:
	.long	1159533667
	.align 4
.LC192:
	.long	1002740646
	.align 4
.LC193:
	.long	1011129254
	.align 16
.LC194:
	.long	1143930880
	.long	1143930880
	.long	1143930880
	.long	1143930880
	.align 16
.LC195:
	.long	1121714176
	.long	1121714176
	.long	1121714176
	.long	1121714176
	.set	.LC196,.LC194
	.set	.LC197,.LC195
	.align 4
.LC198:
	.long	1053609165
	.align 4
.LC199:
	.long	1057803469
	.align 4
.LC200:
	.long	1041865114
	.align 4
.LC201:
	.long	1068708659
	.align 4
.LC202:
	.long	1055286886
	.align 4
.LC203:
	.long	805306368
	.align 4
.LC204:
	.long	981668463
	.align 4
.LC205:
	.long	925353388
	.align 4
.LC206:
	.long	1025758986
	.set	.LC207,.LC99
	.align 4
.LC208:
	.long	1050253722
	.align 4
.LC209:
	.long	1059481190
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
	.set	.LC222,.LC102
	.align 4
.LC226:
	.long	1191181824
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-Builds project) 15.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
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
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	expf;	.scl	2;	.type	32;	.endef
	.def	tanf;	.scl	2;	.type	32;	.endef
	.def	cosf;	.scl	2;	.type	32;	.endef
	.def	sinf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
