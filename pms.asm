	.file	"pms.c"
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
	movl	$10, %edx
	leaq	.LC16(%rip), %rcx
	call	printf
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
	call	puts
	leaq	.LC42(%rip), %rcx
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
.L55:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	call	atoi
	testl	%eax, %eax
	jle	.L58
	cmpl	%eax, FORMANTS(%rip)
	jl	.L58
	jmp	.L55
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
	pushq	%r15
	.seh_pushreg	%r15
	movl	$8280, %eax
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
	.seh_stackalloc	8280
	movaps	%xmm6, 8256(%rsp)
	.seh_savexmm	%xmm6, 8256
	.seh_endprologue
	movq	%rdx, %r13
	movq	%rcx, 8352(%rsp)
	leaq	.LC44(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L142
	movl	$148, %edx
	movl	$8192, %ecx
	call	calloc
	testq	%rax, %rax
	movq	%rax, 0(%r13)
	je	.L143
	movq	.LC46(%rip), %rax
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
	leaq	64(%rsp), %r15
	addl	$1, %ebx
	cmpb	$32, %al
	jne	.L141
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L127:
	movzbl	1(%r15), %eax
	addq	$1, %r15
	cmpb	$32, %al
	je	.L127
.L141:
	cmpb	$9, %al
	je	.L127
	cmpb	$35, %al
	ja	.L68
	movabsq	$34359747585, %rdx
	btq	%rax, %rdx
	jc	.L64
.L68:
	leaq	.LC47(%rip), %rdx
	movl	$11, %r8d
	movq	%r15, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L144
	leaq	.LC48(%rip), %rdx
	movl	$14, %r8d
	movq	%r15, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L145
	leaq	.LC50(%rip), %rdx
	movl	$8, %r8d
	movq	%r15, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L146
	leaq	.LC52(%rip), %rdx
	movl	$9, %r8d
	movq	%r15, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L64
	leaq	.LC53(%rip), %rdx
	movl	$13, %r8d
	movq	%r15, %rcx
	call	*%rbp
	testl	%eax, %eax
	je	.L64
	movslq	8(%r13), %rax
	cmpl	$8191, %eax
	jg	.L147
	imulq	$148, %rax, %rdx
	movq	0(%r13), %r8
	xorl	%eax, %eax
	movl	$37, %ecx
	leaq	(%r8,%rdx), %r14
	movq	%r14, %rdi
	rep stosl
	movl	FORMANTS(%rip), %eax
	testl	%eax, %eax
	jle	.L138
	leal	-1(%rax), %ecx
	cmpl	$2, %ecx
	jbe	.L107
	movl	%eax, %ecx
	movss	.LC43(%rip), %xmm0
	shrl	$2, %ecx
	subl	$1, %ecx
	shufps	$0, %xmm0, %xmm0
	movups	%xmm0, 104(%r8,%rdx)
	je	.L82
	movups	%xmm0, 120(%r8,%rdx)
.L82:
	testb	$3, %al
	je	.L138
	movl	%eax, %edx
	andl	$-4, %edx
.L81:
	movss	.LC43(%rip), %xmm6
	leal	1(%rdx), %r8d
	movslq	%edx, %rcx
	cmpl	%eax, %r8d
	movss	%xmm6, 104(%r14,%rcx,4)
	jge	.L80
	addl	$2, %edx
	movss	%xmm6, 108(%r14,%rcx,4)
	cmpl	%edx, %eax
	jle	.L80
	movss	%xmm6, 112(%r14,%rcx,4)
.L80:
	leaq	56(%rsp), %rdi
	movss	%xmm6, 100(%r14)
	movq	%rdi, %rcx
	movq	%r15, 56(%rsp)
	call	nxtok
	testq	%rax, %rax
	je	.L148
	movq	%rax, %rcx
	call	atof
	cmpl	$0, FORMANTS(%rip)
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, (%r14)
	jle	.L85
	xorl	%r15d, %r15d
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L149:
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 4(%r14,%r15,4)
	call	nxtok
	testq	%rax, %rax
	je	.L86
	movq	%rax, %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 44(%r14,%r15,4)
	addq	$1, %r15
	cmpl	%r15d, FORMANTS(%rip)
	jle	.L85
.L87:
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	jne	.L149
.L86:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC57(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L144:
	leaq	12(%r15), %rcx
	call	atoi
	movl	%eax, 12(%r13)
	jmp	.L64
.L145:
	movzbl	15(%r15), %eax
	leaq	15(%r15), %rcx
	cmpb	$9, %al
	je	.L128
	cmpb	$32, %al
	jne	.L72
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L128:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L128
	cmpb	$9, %al
	je	.L128
.L72:
	leaq	.LC49(%rip), %rdx
	movl	$8, %r8d
	call	*%rbp
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 16(%r13)
	jmp	.L64
.L146:
	leaq	9(%r15), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	mulss	.LC51(%rip), %xmm0
	movss	%xmm0, 20(%r13)
	jmp	.L64
.L147:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$8192, %r8d
	leaq	.LC54(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L79:
	movq	%r12, %rcx
	call	fclose
	movslq	8(%r13), %rax
	testl	%eax, %eax
	je	.L150
	pxor	%xmm0, %xmm0
	comiss	20(%r13), %xmm0
	jnb	.L103
.L105:
	xorl	%eax, %eax
.L60:
	movaps	8256(%rsp), %xmm6
	addq	$8280, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L103:
	subq	$1, %rax
	movss	.LC2(%rip), %xmm0
	imulq	$148, %rax, %rax
	addq	0(%r13), %rax
	addss	(%rax), %xmm0
	movss	%xmm0, 20(%r13)
	jmp	.L105
.L85:
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L140
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 84(%r14)
	call	nxtok
	testq	%rax, %rax
	je	.L140
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 88(%r14)
	call	nxtok
	testq	%rax, %rax
	je	.L140
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 92(%r14)
	call	nxtok
	testq	%rax, %rax
	je	.L140
	movq	%rax, %rcx
	call	atof
	movq	%rdi, %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 96(%r14)
	call	nxtok
	testq	%rax, %rax
	je	.L140
	movq	%rax, %rcx
	call	atof
	movss	.LC58(%rip), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	ja	.L151
.L95:
	cmpl	$0, FORMANTS(%rip)
	movss	%xmm0, 100(%r14)
	jle	.L90
	leaq	104(%r14), %rax
	xorl	%r15d, %r15d
	movq	%rax, 40(%rsp)
	jmp	.L99
.L152:
	movq	%rax, %rcx
	addl	$1, %r15d
	call	atof
	movq	40(%rsp), %rax
	cvtsd2ss	%xmm0, %xmm0
	addq	$4, %rax
	movss	%xmm0, -4(%rax)
	cmpl	%r15d, FORMANTS(%rip)
	movq	%rax, 40(%rsp)
	jle	.L100
.L99:
	movq	%rdi, %rcx
	call	nxtok
	testq	%rax, %rax
	jne	.L152
	testl	%r15d, %r15d
	je	.L90
.L100:
	movl	$1, 144(%r14)
	jmp	.L90
.L140:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC56(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
.L90:
	addl	$1, 8(%r13)
	jmp	.L64
.L138:
	movss	.LC43(%rip), %xmm6
	jmp	.L80
.L148:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC56(%rip), %rdx
	movl	%ebx, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L64
.L151:
	movaps	%xmm6, %xmm0
	jmp	.L95
.L107:
	xorl	%edx, %edx
	jmp	.L81
.L150:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	8352(%rsp), %r8
	leaq	.LC59(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L62:
	movl	$-1, %eax
	jmp	.L60
.L143:
	movq	%r12, %rcx
	call	fclose
	jmp	.L62
.L142:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movl	$2, %ecx
	movq	%rax, %rbx
	call	*__imp___acrt_iob_func(%rip)
	movq	8352(%rsp), %r8
	movq	%rbx, %r9
	leaq	.LC45(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
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
	pushq	%r15
	.seh_pushreg	%r15
	movl	$4328, %eax
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
	.seh_stackalloc	4328
	movaps	%xmm6, 4304(%rsp)
	.seh_savexmm	%xmm6, 4304
	.seh_endprologue
	movq	%rdx, %r15
	movq	%rcx, %rbx
	leaq	.LC44(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r14
	je	.L285
	movl	$8100, %edx
	movl	$1024, %ecx
	call	calloc
	testq	%rax, %rax
	movq	%rax, (%r15)
	je	.L286
	movq	.LC46(%rip), %rax
	movl	$6385769, 24(%r15)
	movq	__imp__strnicmp(%rip), %r12
	movss	.LC60(%rip), %xmm6
	movq	%rax, 8(%r15)
	movabsq	$4575657221408423936, %rax
	movq	%rax, 16(%r15)
	leaq	24(%r15), %rax
	movq	%rax, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L159:
	leaq	208(%rsp), %rcx
	movq	%r14, %r8
	movl	$4096, %edx
	call	fgets
	testq	%rax, %rax
	je	.L176
	movzbl	208(%rsp), %eax
	leaq	208(%rsp), %rsi
	cmpb	$32, %al
	jne	.L284
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L257:
	movzbl	1(%rsi), %eax
	addq	$1, %rsi
	cmpb	$32, %al
	je	.L257
.L284:
	cmpb	$9, %al
	je	.L257
	cmpb	$35, %al
	ja	.L161
	movabsq	$34359747585, %rdx
	btq	%rax, %rdx
	jc	.L159
.L161:
	leaq	.LC47(%rip), %rdx
	movl	$11, %r8d
	movq	%rsi, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L287
	leaq	.LC48(%rip), %rdx
	movl	$14, %r8d
	movq	%rsi, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L288
	leaq	.LC63(%rip), %rdx
	movl	$5, %r8d
	movq	%rsi, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L289
	leaq	.LC65(%rip), %rdx
	movl	$11, %r8d
	movq	%rsi, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L290
	leaq	.LC67(%rip), %rdx
	movl	$10, %r8d
	movq	%rsi, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L159
	movslq	8(%r15), %rax
	cmpl	$1023, %eax
	jg	.L291
	movq	%rax, 56(%rsp)
	imulq	$8100, %rax, %rax
	movq	(%r15), %rdx
	movl	$8100, %r8d
	movq	%rdx, 48(%rsp)
	leaq	(%rdx,%rax), %rbp
	xorl	%edx, %edx
	movq	%rax, 64(%rsp)
	movq	%rbp, %rcx
	call	memset
	movq	%rsi, 88(%rsp)
	leaq	88(%rsp), %rsi
	movq	%rsi, %rcx
	movq	%rsi, 32(%rsp)
	call	nxtok
	testq	%rax, %rax
	je	.L159
	movl	$15, %r8d
	movq	%rax, %rdx
	movq	%rbp, %rcx
	call	strncpy
	movq	%rsi, %rcx
	call	nxtok
	testq	%rax, %rax
	je	.L159
	movq	%rax, %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 16(%rbp)
	movss	20(%r15), %xmm1
	comiss	.LC69(%rip), %xmm1
	ja	.L292
.L178:
	movq	%rbx, 4400(%rsp)
	movq	__imp__stricmp(%rip), %r13
	leaq	g_phoneme_db(%rip), %rbx
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L294:
	leaq	4292+g_phoneme_db(%rip), %rax
	addq	$116, %rbx
	cmpq	%rbx, %rax
	je	.L293
.L181:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L294
	movl	FORMANTS(%rip), %edx
	movq	%rbx, 72(%rsp)
	movq	%rbx, %rsi
	movq	4400(%rsp), %rbx
	testl	%edx, %edx
	jle	.L189
	cmpl	$1, %edx
	je	.L218
	movq	48(%rsp), %rcx
	leaq	20(%rsi), %r11
	movq	64(%rsp), %r9
	leaq	280(%rcx,%r9), %r8
	leaq	320(%rcx,%r9), %r10
	leaq	296(%rcx,%r9), %r9
	cmpq	%r9, %r11
	leaq	76(%rsi), %r9
	setnb	%r11b
	cmpq	%r9, %r8
	setnb	%r9b
	orb	%r11b, %r9b
	je	.L218
	leaq	-24(%r10), %r9
	subq	%rsi, %r9
	cmpq	$48, %r9
	jbe	.L218
	leal	-1(%rdx), %r11d
	movl	%edx, %r9d
	cmpl	$2, %r11d
	jbe	.L219
	shrl	$2, %r9d
	xorl	%eax, %eax
	salq	$4, %r9
.L187:
	movups	20(%rsi,%rax), %xmm0
	movups	%xmm0, (%r8,%rax)
	movups	60(%rsi,%rax), %xmm0
	movups	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpq	%r9, %rax
	jne	.L187
	movl	%edx, %eax
	andl	$-4, %eax
	cmpl	%eax, %edx
	movl	%eax, %r8d
	je	.L189
	subl	%eax, %edx
	cmpl	$1, %edx
	movl	%edx, %r9d
	je	.L191
.L186:
	leaq	5(%r8), %r10
	movq	48(%rsp), %rcx
	imulq	$2025, 56(%rsp), %rdx
	testb	$1, %r9b
	leaq	70(%r8,%rdx), %rdx
	movq	(%rsi,%r10,4), %r8
	movq	%r8, (%rcx,%rdx,4)
	movq	40(%rsi,%r10,4), %r8
	movq	%r8, 40(%rcx,%rdx,4)
	je	.L189
	movl	%r9d, %edx
	andl	$-2, %edx
	addl	%edx, %eax
.L191:
	cltq
	movss	20(%rsi,%rax,4), %xmm0
	movss	%xmm0, 280(%rbp,%rax,4)
	movss	60(%rsi,%rax,4), %xmm0
	movss	%xmm0, 320(%rbp,%rax,4)
.L189:
	movss	100(%rsi), %xmm0
	leaq	.LC70(%rip), %rdx
	movq	%rbp, %rcx
	movss	%xmm0, 8084(%rbp)
	movss	104(%rsi), %xmm0
	movss	%xmm0, 8088(%rbp)
	movss	108(%rsi), %xmm0
	movss	%xmm0, 8092(%rbp)
	call	*%r13
	testl	%eax, %eax
	jne	.L295
.L183:
	movl	$1, 8096(%rbp)
.L200:
	leaq	144(%rsp), %rax
	xorl	%r13d, %r13d
	movq	%rbx, 4400(%rsp)
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L199:
	movq	32(%rsp), %rcx
	call	nxtok
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L296
	movl	$58, %edx
	movq	%rbx, %rcx
	call	strchr
	movl	$47, %edx
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	strchr
	testq	%rsi, %rsi
	je	.L202
	testq	%rax, %rax
	je	.L297
.L203:
	cmpl	%r13d, FORMANTS(%rip)
	jle	.L199
	movq	%rbx, %rdx
	movq	48(%rsp), %rbx
	movl	$63, %r8d
	movq	%rbx, %rcx
	call	strncpy
	movq	%rbx, %rcx
	movl	$47, %edx
	movb	$0, 207(%rsp)
	call	strchr
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L298
	movq	48(%rsp), %rcx
	movb	$0, (%rax)
	movslq	%r13d, %rsi
	call	atof
	leaq	1(%rbx), %rcx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 280(%rbp,%rsi,4)
	call	atof
	cvtsd2ss	%xmm0, %xmm0
.L208:
	movss	%xmm0, 320(%rbp,%rsi,4)
	addl	$1, %r13d
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L287:
	leaq	12(%rsi), %rcx
	call	atoi
	movl	%eax, 12(%r15)
	jmp	.L159
.L288:
	movzbl	15(%rsi), %eax
	leaq	15(%rsi), %rcx
	cmpb	$32, %al
	jne	.L282
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L258:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L258
.L282:
	cmpb	$9, %al
	je	.L258
	leaq	.LC49(%rip), %rdx
	movl	$8, %r8d
	call	*%r12
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, 16(%r15)
	jmp	.L159
.L289:
	leaq	6(%rsi), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	movaps	%xmm6, %xmm2
	cvtsd2ss	%xmm0, %xmm1
	comiss	%xmm1, %xmm6
	ja	.L169
	movss	.LC64(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm0, %xmm2
.L169:
	movss	%xmm2, 20(%r15)
	jmp	.L159
.L291:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$1024, %r8d
	leaq	.LC68(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L176:
	movq	%r14, %rcx
	call	fclose
	movl	8(%r15), %eax
	testl	%eax, %eax
	je	.L299
	xorl	%eax, %eax
.L154:
	movaps	4304(%rsp), %xmm6
	addq	$4328, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L290:
	movzbl	12(%rsi), %eax
	leaq	12(%rsi), %rcx
	cmpb	$32, %al
	jne	.L283
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L259:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	$32, %al
	je	.L259
.L283:
	cmpb	$9, %al
	je	.L259
	movq	40(%rsp), %r8
	leaq	.LC66(%rip), %rdx
	call	sscanf
	jmp	.L159
.L202:
	testq	%rax, %rax
	je	.L199
	jmp	.L203
.L297:
	movl	276(%rbp), %esi
	cmpl	$31, %esi
	jg	.L199
	leal	1(%rsi), %eax
	movl	$63, %r8d
	movq	%rbx, %rdx
	leaq	144(%rsp), %rcx
	movl	%eax, 276(%rbp)
	call	strncpy
	movl	$58, %edx
	movb	$0, 207(%rsp)
	leaq	144(%rsp), %rcx
	call	strchr
	testq	%rax, %rax
	je	.L199
	movb	$0, (%rax)
	leaq	144(%rsp), %rcx
	movq	%rax, 56(%rsp)
	call	atof
	movq	56(%rsp), %rax
	movslq	%esi, %r9
	leaq	2(%r9), %rbx
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 4(%rbp,%rbx,8)
	leaq	1(%rax), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 8(%rbp,%rbx,8)
	jmp	.L199
.L296:
	cmpl	$0, 276(%rbp)
	movq	4400(%rsp), %rbx
	jne	.L210
	movq	72(%rsp), %rax
	testq	%rax, %rax
	je	.L220
	movss	112(%rax), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L220
.L211:
	movl	$0x00000000, 20(%rbp)
	movss	%xmm0, 24(%rbp)
	movl	$0x42c80000, 28(%rbp)
	movss	%xmm0, 32(%rbp)
	movl	$2, 276(%rbp)
.L210:
	addl	$1, 8(%r15)
	jmp	.L159
.L292:
	divss	%xmm1, %xmm0
	movss	%xmm0, 16(%rbp)
	jmp	.L178
.L295:
	leaq	.LC71(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r13
	testl	%eax, %eax
	je	.L183
	leaq	.LC72(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r13
	testl	%eax, %eax
	je	.L183
	leaq	.LC73(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L196
.L197:
	movl	$2, 8096(%rbp)
	jmp	.L200
.L293:
	movq	.LC80(%rip), %rdx
	movaps	.LC78(%rip), %xmm0
	movl	FORMANTS(%rip), %eax
	movaps	%xmm0, 96(%rsp)
	movaps	.LC79(%rip), %xmm0
	movq	%rdx, 128(%rsp)
	movq	.LC83(%rip), %rdx
	movaps	%xmm0, 112(%rsp)
	movaps	.LC81(%rip), %xmm0
	testl	%eax, %eax
	movq	4400(%rsp), %rbx
	movaps	%xmm0, 144(%rsp)
	movaps	.LC82(%rip), %xmm0
	movq	%rdx, 176(%rsp)
	movaps	%xmm0, 160(%rsp)
	jle	.L201
	leaq	0(,%rax,4), %rsi
	leaq	280(%rbp), %rcx
	movq	%rsi, %r8
	leaq	96(%rsp), %rdx
	call	memcpy
	leaq	320(%rbp), %rcx
	movq	%rsi, %r8
	leaq	144(%rsp), %rdx
	call	memcpy
.L201:
	movq	.LC76(%rip), %rax
	xorl	%edx, %edx
	movq	%rdx, 72(%rsp)
	movq	%rax, 8084(%rbp)
	jmp	.L200
.L220:
	movss	.LC0(%rip), %xmm0
	jmp	.L211
.L298:
	movq	48(%rsp), %rcx
	movslq	%r13d, %rsi
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 280(%rbp,%rsi,4)
	movss	.LC61(%rip), %xmm0
	jmp	.L208
.L218:
	xorl	%eax, %eax
.L193:
	movss	20(%rsi,%rax,4), %xmm0
	movss	%xmm0, 280(%rbp,%rax,4)
	movss	60(%rsi,%rax,4), %xmm0
	movss	%xmm0, 320(%rbp,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %edx
	jg	.L193
	jmp	.L189
.L219:
	xorl	%r8d, %r8d
	jmp	.L186
.L285:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movl	$2, %ecx
	movq	%rax, %rsi
	call	*__imp___acrt_iob_func(%rip)
	movq	%rsi, %r9
	movq	%rbx, %r8
	leaq	.LC62(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L156:
	movl	$-1, %eax
	jmp	.L154
.L299:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC77(%rip), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L156
.L286:
	movq	%r14, %rcx
	call	fclose
	jmp	.L156
.L196:
	leaq	.LC74(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r13
	testl	%eax, %eax
	je	.L197
	leaq	.LC75(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r13
	testl	%eax, %eax
	je	.L197
	xorl	%ecx, %ecx
	movl	%ecx, 8096(%rbp)
	jmp	.L200
	.seh_endproc
	.p2align 4
	.def	contour_f0.part.0;	.scl	3;	.type	32;	.endef
	.seh_proc	contour_f0.part.0
contour_f0.part.0:
	.seh_endprologue
	movslq	%edx, %rax
	leaq	-8(%rcx,%rax,8), %r8
	comiss	(%r8), %xmm2
	jnb	.L301
	cmpl	$1, %edx
	je	.L301
	leal	-2(%rdx), %eax
	leaq	8(%rcx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L307:
	movss	(%rcx), %xmm0
	comiss	%xmm0, %xmm2
	jb	.L302
	movss	8(%rcx), %xmm1
	comiss	%xmm2, %xmm1
	jnb	.L315
.L302:
	addq	$8, %rcx
	cmpq	%rcx, %rax
	jne	.L307
.L301:
	movss	4(%r8), %xmm3
.L300:
	movaps	%xmm3, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L315:
	comiss	%xmm1, %xmm0
	movss	4(%rcx), %xmm3
	jnb	.L300
	subss	%xmm0, %xmm1
	movss	12(%rcx), %xmm4
	subss	%xmm0, %xmm2
	divss	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	comiss	%xmm2, %xmm1
	ja	.L306
	movss	.LC43(%rip), %xmm0
	movaps	%xmm0, %xmm1
	cmpltss	%xmm2, %xmm1
	andps	%xmm1, %xmm0
	andnps	%xmm2, %xmm1
	orps	%xmm0, %xmm1
.L306:
	subss	%xmm3, %xmm4
	movaps	%xmm4, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm3
	movaps	%xmm3, %xmm0
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
	subq	$2568, %rsp
	.seh_stackalloc	2568
	movaps	%xmm6, 2400(%rsp)
	.seh_savexmm	%xmm6, 2400
	movaps	%xmm7, 2416(%rsp)
	.seh_savexmm	%xmm7, 2416
	movaps	%xmm8, 2432(%rsp)
	.seh_savexmm	%xmm8, 2432
	movaps	%xmm9, 2448(%rsp)
	.seh_savexmm	%xmm9, 2448
	movaps	%xmm10, 2464(%rsp)
	.seh_savexmm	%xmm10, 2464
	movaps	%xmm11, 2480(%rsp)
	.seh_savexmm	%xmm11, 2480
	movaps	%xmm12, 2496(%rsp)
	.seh_savexmm	%xmm12, 2496
	movaps	%xmm13, 2512(%rsp)
	.seh_savexmm	%xmm13, 2512
	movaps	%xmm14, 2528(%rsp)
	.seh_savexmm	%xmm14, 2528
	movaps	%xmm15, 2544(%rsp)
	.seh_savexmm	%xmm15, 2544
	.seh_endprologue
	movl	%ecx, %esi
	movq	%rdx, %rdi
	call	__main
	leaq	800(%rsp), %rax
	xorl	%edx, %edx
	movl	$1600, %r8d
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)
	call	memset
	movaps	.LC101(%rip), %xmm0
	movabsq	$4611686018427409954, %rax
	movq	%rax, 812(%rsp)
	movabsq	$4561245704582856704, %rax
	movq	%rax, 820(%rsp)
	movq	.LC100(%rip), %rax
	movlps	%xmm0, 1204(%rsp)
	movhps	%xmm0, 1212(%rsp)
	movaps	.LC78(%rip), %xmm0
	movq	%rax, 1188(%rsp)
	movq	.LC102(%rip), %rax
	movaps	%xmm0, 352(%rsp)
	movaps	.LC79(%rip), %xmm0
	movaps	%xmm0, 368(%rsp)
	movaps	.LC81(%rip), %xmm0
	movq	%rax, 1220(%rsp)
	movq	.LC103(%rip), %rax
	movaps	%xmm0, 400(%rsp)
	movaps	.LC82(%rip), %xmm0
	movaps	%xmm0, 416(%rsp)
	movq	%rax, 2372(%rsp)
	movabsq	$8587929587188790639, %rax
	movq	%rax, 1312(%rsp)
	movq	.LC80(%rip), %rax
	movl	$7758199, 1319(%rsp)
	movq	%rax, 384(%rsp)
	movq	.LC83(%rip), %rax
	movq	%rax, 432(%rsp)
	movl	FORMANTS(%rip), %eax
	testl	%eax, %eax
	jle	.L317
	leal	-1(%rax), %edx
	cmpl	$2, %edx
	jbe	.L1024
	movq	.LC104(%rip), %rdx
	movss	.LC43(%rip), %xmm6
	movss	%xmm6, 836(%rsp)
	movaps	%xmm6, %xmm0
	movq	%rdx, 828(%rsp)
	movq	.LC105(%rip), %rdx
	shufps	$0, %xmm0, %xmm0
	movss	%xmm6, 868(%rsp)
	movss	%xmm6, 900(%rsp)
	movss	%xmm6, 932(%rsp)
	movq	%rdx, 860(%rsp)
	movq	.LC106(%rip), %rdx
	movlps	%xmm0, 1148(%rsp)
	movhps	%xmm0, 1156(%rsp)
	movq	%rdx, 892(%rsp)
	movq	.LC107(%rip), %rdx
	movq	%rdx, 924(%rsp)
	movl	%eax, %edx
	shrl	$2, %edx
	cmpl	$1, %edx
	jne	.L1690
.L319:
	movl	%eax, %edx
	andl	$-4, %edx
	testb	$3, %al
	je	.L317
.L318:
	movslq	%edx, %rcx
	movss	400(%rsp,%rcx,4), %xmm1
	movq	%rcx, %r8
	movss	352(%rsp,%rcx,4), %xmm0
	salq	$5, %r8
	movss	%xmm6, 836(%rsp,%r8)
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 828(%rsp,%r8)
	movss	%xmm6, 1148(%rsp,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %eax
	jle	.L317
	movslq	%ecx, %rcx
	addl	$2, %edx
	movss	400(%rsp,%rcx,4), %xmm1
	movq	%rcx, %r8
	movss	352(%rsp,%rcx,4), %xmm0
	salq	$5, %r8
	cmpl	%edx, %eax
	movss	%xmm6, 836(%rsp,%r8)
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 828(%rsp,%r8)
	movss	%xmm6, 1148(%rsp,%rcx,4)
	jle	.L317
	movslq	%edx, %rdx
	movss	400(%rsp,%rdx,4), %xmm1
	movq	%rdx, %rax
	movss	352(%rsp,%rdx,4), %xmm0
	salq	$5, %rax
	movss	%xmm6, 836(%rsp,%rax)
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 828(%rsp,%rax)
	movss	%xmm6, 1148(%rsp,%rdx,4)
.L317:
	cmpl	$1, %esi
	jle	.L1691
	movq	$0, 448(%rsp)
	xorl	%ebp, %ebp
	movl	$1, %r13d
	movq	$0, 456(%rsp)
	movq	$0, 464(%rsp)
	movq	$0, 472(%rsp)
	movq	$0, 480(%rsp)
	movq	$0, 496(%rsp)
	movq	$0, 504(%rsp)
	movq	$0, 512(%rsp)
	movq	$0, 520(%rsp)
	movq	$0, 528(%rsp)
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L1694:
	leaq	.LC118(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L327
	leaq	.LC121(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L333
	cmpl	%ebx, %esi
	jle	.L1659
	testl	%ebp, %ebp
	je	.L335
	cmpl	$2, 800(%rsp)
	jne	.L336
.L335:
	movl	$2, 800(%rsp)
	.p2align 4,,10
	.p2align 3
.L1658:
	movslq	%ebx, %rax
	movl	$511, %r8d
	movq	(%rdi,%rax,8), %rdx
	leaq	1824(%rsp), %rcx
	call	strncpy
.L337:
	movl	$1, %ebp
.L332:
	leal	1(%rbx), %r13d
	cmpl	%r13d, %esi
	jle	.L1692
.L431:
	leaq	.LC112(%rip), %rdx
	movslq	%r13d, %r14
	movq	(%rdi,%r14,8), %r12
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L323
	cmpb	$45, (%r12)
	jne	.L325
	cmpb	$104, 1(%r12)
	jne	.L325
	cmpb	$0, 2(%r12)
	je	.L323
.L325:
	leaq	.LC113(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1693
	leaq	.LC117(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	leal	1(%r13), %ebx
	testl	%eax, %eax
	jne	.L1694
.L327:
	cmpl	%ebx, %esi
	jle	.L1659
	testl	%ebp, %ebp
	je	.L331
	cmpl	$1, 800(%rsp)
	jne	.L336
.L331:
	movl	$1, 800(%rsp)
	jmp	.L1658
	.p2align 4,,10
	.p2align 3
.L333:
	leaq	.LC122(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L338
	cmpl	%ebx, %esi
	jle	.L1659
	testl	%ebp, %ebp
	je	.L340
	cmpl	$0, 800(%rsp)
	jne	.L336
.L340:
	leaq	2336(%rsp), %rcx
	movslq	%ebx, %rax
	xorl	%r8d, %r8d
	movq	(%rdi,%rax,8), %rbp
	movl	%r8d, 800(%rsp)
	movl	$31, %r8d
	movq	%rbp, %rdx
	call	strncpy
	movq	__imp__stricmp(%rip), %r12
	leaq	.LC90(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	je	.L1695
	leaq	.LC91(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	jne	.L342
	movl	$1, 808(%rsp)
	jmp	.L337
.L1690:
	movq	.LC108(%rip), %rdx
	movss	%xmm6, 964(%rsp)
	movss	%xmm6, 996(%rsp)
	movss	%xmm6, 1028(%rsp)
	movss	%xmm6, 1060(%rsp)
	movq	%rdx, 956(%rsp)
	movq	.LC109(%rip), %rdx
	movups	%xmm0, 1164(%rsp)
	movq	%rdx, 988(%rsp)
	movq	.LC110(%rip), %rdx
	movq	%rdx, 1020(%rsp)
	movq	.LC111(%rip), %rdx
	movq	%rdx, 1052(%rsp)
	jmp	.L319
.L338:
	leaq	.LC124(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1696
	leaq	.LC126(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L349
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	movss	.LC84(%rip), %xmm1
	cvtsd2ss	%xmm0, %xmm0
	comiss	%xmm0, %xmm1
	ja	.L351
	movss	.LC127(%rip), %xmm2
	movaps	%xmm2, %xmm1
	cmpltss	%xmm0, %xmm1
	andps	%xmm1, %xmm2
	andnps	%xmm0, %xmm1
	orps	%xmm2, %xmm1
.L351:
	movss	%xmm1, 816(%rsp)
	jmp	.L332
.L1691:
	call	print_help
.L322:
	xorl	%eax, %eax
.L316:
	movaps	2400(%rsp), %xmm6
	movaps	2416(%rsp), %xmm7
	movaps	2432(%rsp), %xmm8
	movaps	2448(%rsp), %xmm9
	movaps	2464(%rsp), %xmm10
	movaps	2480(%rsp), %xmm11
	movaps	2496(%rsp), %xmm12
	movaps	2512(%rsp), %xmm13
	movaps	2528(%rsp), %xmm14
	movaps	2544(%rsp), %xmm15
	addq	$2568, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L323:
	call	print_help
	xorl	%ecx, %ecx
	call	exit
.L1695:
	xorl	%ecx, %ecx
	movl	%ecx, 808(%rsp)
	jmp	.L337
.L349:
	leaq	.LC128(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L353
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 820(%rsp)
	jmp	.L332
.L1693:
	leaq	.LC116(%rip), %rcx
	leaq	.LC114(%rip), %r8
	leaq	.LC115(%rip), %rdx
	call	printf
	xorl	%ecx, %ecx
	call	exit
.L1659:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC119(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
.L330:
	movl	$1, %eax
	jmp	.L316
.L1696:
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atoi
	movl	%eax, %r12d
	cmpl	$8000, %eax
	movl	%eax, 812(%rsp)
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
	jne	.L332
	cmpl	$48000, %r12d
	je	.L332
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC125(%rip), %rdx
	movl	%r12d, %r8d
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L342:
	leaq	.LC92(%rip), %rdx
	movq	%rbp, %rcx
	call	*%r12
	testl	%eax, %eax
	jne	.L343
	movl	$2, 808(%rsp)
	jmp	.L337
.L336:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC120(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L330
.L1024:
	movss	.LC43(%rip), %xmm6
	xorl	%edx, %edx
	jmp	.L318
.L353:
	leaq	.LC129(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1697
	leaq	.LC131(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L360
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L362
	movss	.LC43(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L362:
	movss	%xmm0, 824(%rsp)
	jmp	.L332
.L1692:
	movl	808(%rsp), %edx
	orl	%edx, %ebp
	je	.L1698
	cmpl	$1, %edx
	je	.L1035
	leaq	g_preset_impulsive(%rip), %rax
	cmpl	$2, %edx
	jne	.L1699
.L435:
	movl	FORMANTS(%rip), %ebx
	testl	%ebx, %ebx
	jle	.L442
	leal	-1(%rbx), %edx
	cmpl	$2, %edx
	jbe	.L1037
	leaq	828(%rsp), %rdx
	movl	%ebx, %r8d
	xorl	%ecx, %ecx
	shrl	$2, %r8d
	salq	$4, %r8
.L440:
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
	cmpq	%rcx, %r8
	jne	.L440
	movl	%ebx, %edx
	andl	$-4, %edx
	cmpl	%edx, %ebx
	movl	%edx, %ecx
	je	.L442
.L439:
	movl	%ebx, %r8d
	subl	%ecx, %r8d
	cmpl	$1, %r8d
	je	.L444
	movq	64(%rsp), %rsi
	movq	%rcx, %r9
	movq	(%rax,%rcx,4), %xmm0
	salq	$5, %r9
	testb	$1, %r8b
	movq	40(%rax,%rcx,4), %xmm1
	movaps	%xmm0, %xmm2
	unpcklps	%xmm1, %xmm2
	unpcklps	%xmm1, %xmm0
	movlps	%xmm2, 28(%rsi,%r9)
	shufps	$78, %xmm0, %xmm0
	movlps	%xmm0, 60(%rsi,%r9)
	je	.L442
	andl	$-2, %r8d
	addl	%r8d, %edx
.L444:
	movslq	%edx, %rdx
	movss	40(%rax,%rdx,4), %xmm1
	movss	(%rax,%rdx,4), %xmm0
	salq	$5, %rdx
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 828(%rsp,%rdx)
.L442:
	movaps	80(%rax), %xmm0
	testl	%ebx, %ebx
	movq	100(%rax), %rdx
	movaps	96(%rax), %xmm1
	shufps	$160, %xmm0, %xmm1
	shufps	$36, %xmm1, %xmm0
	movss	92(%rax), %xmm1
	movups	%xmm0, 1188(%rsp)
	movss	108(%rax), %xmm0
	movq	%rdx, 1204(%rsp)
	movss	%xmm1, 820(%rsp)
	movss	%xmm0, 1212(%rsp)
	jle	.L438
	cmpl	$0, 448(%rsp)
	jne	.L446
	movss	(%rax), %xmm0
	movss	%xmm0, 828(%rsp)
.L446:
	cmpl	$0, 496(%rsp)
	je	.L1700
.L447:
	cmpl	$1, %ebx
	je	.L438
	cmpl	$0, 452(%rsp)
	jne	.L449
	movss	4(%rax), %xmm0
	movss	%xmm0, 860(%rsp)
.L449:
	cmpl	$0, 500(%rsp)
	je	.L1701
.L450:
	cmpl	$2, %ebx
	je	.L438
	cmpl	$0, 456(%rsp)
	jne	.L451
	movss	8(%rax), %xmm0
	movss	%xmm0, 892(%rsp)
.L451:
	cmpl	$0, 504(%rsp)
	je	.L1702
.L452:
	cmpl	$3, %ebx
	je	.L438
	cmpl	$0, 460(%rsp)
	jne	.L453
	movss	12(%rax), %xmm0
	movss	%xmm0, 924(%rsp)
.L453:
	cmpl	$0, 508(%rsp)
	je	.L1703
.L454:
	cmpl	$4, %ebx
	je	.L438
	cmpl	$0, 464(%rsp)
	jne	.L455
	movss	16(%rax), %xmm0
	movss	%xmm0, 956(%rsp)
.L455:
	cmpl	$0, 512(%rsp)
	jne	.L456
	movss	56(%rax), %xmm0
	movss	%xmm0, 960(%rsp)
.L456:
	cmpl	$5, %ebx
	je	.L438
	cmpl	$0, 468(%rsp)
	jne	.L457
	movss	20(%rax), %xmm0
	movss	%xmm0, 988(%rsp)
.L457:
	cmpl	$0, 516(%rsp)
	jne	.L458
	movss	60(%rax), %xmm0
	movss	%xmm0, 992(%rsp)
.L458:
	cmpl	$6, %ebx
	je	.L438
	cmpl	$0, 472(%rsp)
	jne	.L459
	movss	24(%rax), %xmm0
	movss	%xmm0, 1020(%rsp)
.L459:
	cmpl	$0, 520(%rsp)
	jne	.L460
	movss	64(%rax), %xmm0
	movss	%xmm0, 1024(%rsp)
.L460:
	cmpl	$7, %ebx
	je	.L438
	cmpl	$0, 476(%rsp)
	jne	.L461
	movss	28(%rax), %xmm0
	movss	%xmm0, 1052(%rsp)
.L461:
	cmpl	$0, 524(%rsp)
	jne	.L462
	movss	68(%rax), %xmm0
	movss	%xmm0, 1056(%rsp)
.L462:
	cmpl	$8, %ebx
	je	.L438
	cmpl	$0, 480(%rsp)
	jne	.L463
	movss	32(%rax), %xmm0
	movss	%xmm0, 1084(%rsp)
.L463:
	cmpl	$0, 528(%rsp)
	jne	.L464
	movss	72(%rax), %xmm0
	movss	%xmm0, 1088(%rsp)
.L464:
	cmpl	$9, %ebx
	je	.L438
	cmpl	$0, 484(%rsp)
	jne	.L465
	movss	36(%rax), %xmm0
	movss	%xmm0, 1116(%rsp)
.L465:
	cmpl	$0, 532(%rsp)
	jne	.L438
	movss	76(%rax), %xmm0
	movss	%xmm0, 1120(%rsp)
.L438:
	leal	-1(%rbx), %eax
	cmpl	$9, %eax
	ja	.L1704
	movss	1148(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L468
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1148(%rsp)
.L468:
	movss	%xmm0, 836(%rsp)
	cmpl	$1, %ebx
	je	.L470
	movss	1152(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L471
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1152(%rsp)
.L471:
	movss	%xmm0, 868(%rsp)
	cmpl	$2, %ebx
	je	.L470
	movss	1156(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L473
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1156(%rsp)
.L473:
	movss	%xmm0, 900(%rsp)
	cmpl	$3, %ebx
	je	.L470
	movss	1160(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L475
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1160(%rsp)
.L475:
	movss	%xmm0, 932(%rsp)
	cmpl	$4, %ebx
	je	.L470
	movss	1164(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L477
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1164(%rsp)
.L477:
	movss	%xmm0, 964(%rsp)
	cmpl	$5, %ebx
	je	.L470
	movss	1168(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L479
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1168(%rsp)
.L479:
	movss	%xmm0, 996(%rsp)
	cmpl	$6, %ebx
	je	.L470
	movss	1172(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	jbe	.L481
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1172(%rsp)
.L481:
	movss	%xmm0, 1028(%rsp)
	cmpl	$7, %ebx
	je	.L470
	movss	1176(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	ja	.L1705
.L483:
	movss	%xmm0, 1060(%rsp)
	cmpl	$8, %ebx
	je	.L470
	movss	1180(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	ja	.L1706
.L485:
	movss	%xmm0, 1092(%rsp)
	cmpl	$10, %ebx
	jne	.L470
	movss	1184(%rsp), %xmm0
	movss	.LC166(%rip), %xmm6
	comiss	%xmm0, %xmm6
	ja	.L1707
.L487:
	movss	%xmm0, 1124(%rsp)
.L470:
	movl	800(%rsp), %eax
	cmpl	$1, %eax
	je	.L1708
	cmpl	$2, %eax
	je	.L1709
.L494:
	cmpl	$0, 2380(%rsp)
	jne	.L1710
.L499:
	xorl	%ecx, %ecx
	call	_time64
	movl	800(%rsp), %ebx
	xorl	$-559038242, %eax
	movl	812(%rsp), %ecx
	movss	816(%rsp), %xmm0
	movl	%eax, g_noise_state(%rip)
	cmpl	$2, %ebx
	je	.L1711
	cmpl	$1, %ebx
	jne	.L507
	movss	.LC51(%rip), %xmm6
	movss	1268(%rsp), %xmm1
	divss	%xmm6, %xmm1
	addss	.LC84(%rip), %xmm1
	movaps	%xmm1, %xmm2
	maxss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
.L507:
	pxor	%xmm8, %xmm8
	cvtsi2ssl	%ecx, %xmm8
	mulss	%xmm8, %xmm0
	cvttss2sil	%xmm0, %eax
	testl	%eax, %eax
	movl	%eax, 228(%rsp)
	jg	.L513
	leal	(%rcx,%rcx), %eax
	movl	%eax, 228(%rsp)
.L513:
	movslq	228(%rsp), %rdi
	movl	$5760000, %eax
	movl	$4, %edx
	cmpl	%eax, %edi
	cmovle	%rdi, %rax
	movq	%rax, %rcx
	movl	%eax, 72(%rsp)
	movq	%rax, 312(%rsp)
	call	calloc
	testq	%rax, %rax
	movq	%rax, %rsi
	je	.L1712
	movss	1216(%rsp), %xmm6
	comiss	.LC137(%rip), %xmm6
	ja	.L515
	movss	.LC93(%rip), %xmm6
.L515:
	movss	1224(%rsp), %xmm0
	comiss	.LC137(%rip), %xmm0
	ja	.L516
	movss	.LC94(%rip), %xmm0
.L516:
	movss	1220(%rsp), %xmm13
	comiss	.LC137(%rip), %xmm13
	ja	.L517
	movss	.LC95(%rip), %xmm13
.L517:
	mulss	.LC185(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movl	FORMANTS(%rip), %edi
	movaps	%xmm0, %xmm12
	testl	%edi, %edi
	jle	.L523
	cmpl	$1, %edi
	je	.L1043
	movl	%edi, %eax
	xorl	%r14d, %r14d
	shrl	%eax
	movq	%r14, 852(%rsp)
	cmpl	$1, %eax
	movq	%r14, 884(%rsp)
	je	.L522
	xorl	%r13d, %r13d
	cmpl	$2, %eax
	movq	%r13, 916(%rsp)
	movq	%r13, 948(%rsp)
	je	.L522
	xorl	%r12d, %r12d
	cmpl	$3, %eax
	movq	%r12, 980(%rsp)
	movq	%r12, 1012(%rsp)
	je	.L522
	xorl	%ebp, %ebp
	cmpl	$4, %eax
	movq	%rbp, 1044(%rsp)
	movq	%rbp, 1076(%rsp)
	je	.L522
	xorl	%r11d, %r11d
	movq	%r11, 1108(%rsp)
	movq	%r11, 1140(%rsp)
.L522:
	movl	%edi, %eax
	andl	$-2, %eax
	testb	$1, %dil
	je	.L523
.L521:
	cltq
	xorl	%r10d, %r10d
	salq	$5, %rax
	movq	%r10, 852(%rsp,%rax)
.L523:
	movl	$0x00000000, 2392(%rsp)
	xorl	%r15d, %r15d
	cmpl	$2, %ebx
	movq	%r15, 2384(%rsp)
	je	.L519
.L1044:
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	movq	%r9, 280(%rsp)
	movq	%r9, 272(%rsp)
.L520:
	movss	.LC188(%rip), %xmm0
	movss	.LC99(%rip), %xmm1
	mulss	%xmm8, %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	call	expf
	movl	800(%rsp), %eax
	movaps	%xmm0, %xmm15
	cmpl	$2, %eax
	movl	%eax, 76(%rsp)
	je	.L1713
.L536:
	movss	1188(%rsp), %xmm11
	movss	1192(%rsp), %xmm9
	movss	1196(%rsp), %xmm10
.L537:
	cmpl	$0, 228(%rsp)
	movl	2372(%rsp), %ebp
	jle	.L1714
	mulss	.LC189(%rip), %xmm6
	divss	%xmm8, %xmm6
	movaps	%xmm6, %xmm0
	call	tanf
	movss	.LC190(%rip), %xmm7
	movaps	%xmm0, %xmm2
	movss	.LC43(%rip), %xmm6
	mulss	%xmm7, %xmm2
	movss	.LC191(%rip), %xmm3
	mulss	%xmm0, %xmm0
	movaps	%xmm6, %xmm5
	mulss	.LC192(%rip), %xmm13
	movaps	%xmm2, %xmm1
	addss	%xmm6, %xmm1
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm5
	movaps	%xmm0, %xmm1
	subss	%xmm6, %xmm1
	addss	%xmm1, %xmm1
	movss	%xmm5, 168(%rsp)
	mulss	%xmm5, %xmm1
	mulss	%xmm5, %xmm3
	movss	%xmm1, 176(%rsp)
	movaps	%xmm6, %xmm1
	movss	%xmm3, 172(%rsp)
	subss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	movaps	%xmm13, %xmm0
	divss	%xmm8, %xmm0
	mulss	%xmm5, %xmm1
	movaps	%xmm6, %xmm5
	subss	%xmm12, %xmm5
	movss	%xmm1, 180(%rsp)
	movss	%xmm5, 248(%rsp)
	call	cosf
	movss	.LC191(%rip), %xmm1
	mulss	%xmm12, %xmm1
	mulss	%xmm12, %xmm12
	mulss	%xmm0, %xmm1
	movss	.LC193(%rip), %xmm0
	movss	%xmm12, 264(%rsp)
	divss	%xmm8, %xmm0
	movss	%xmm1, 252(%rsp)
	call	tanf
	movaps	%xmm6, %xmm5
	cmpl	$2, 76(%rsp)
	movss	.LC191(%rip), %xmm3
	mulss	%xmm0, %xmm7
	movq	1232(%rsp), %r15
	mulss	%xmm0, %xmm0
	sete	%dl
	testq	%r13, %r13
	setne	%al
	movaps	%xmm7, %xmm1
	andl	%eax, %edx
	movl	804(%rsp), %eax
	addss	%xmm6, %xmm1
	movb	%dl, 150(%rsp)
	addss	%xmm0, %xmm1
	divss	%xmm1, %xmm5
	movaps	%xmm0, %xmm1
	subss	%xmm6, %xmm1
	addss	%xmm1, %xmm1
	movss	%xmm5, 232(%rsp)
	mulss	%xmm5, %xmm1
	mulss	%xmm5, %xmm3
	movss	%xmm1, 240(%rsp)
	movaps	%xmm6, %xmm1
	movss	%xmm3, 236(%rsp)
	subss	%xmm7, %xmm1
	movss	1196(%rsp), %xmm7
	movss	%xmm7, 140(%rsp)
	movss	820(%rsp), %xmm7
	addss	%xmm0, %xmm1
	movss	.LC194(%rip), %xmm0
	movss	%xmm7, 152(%rsp)
	movss	1200(%rsp), %xmm7
	mulss	%xmm8, %xmm0
	movss	%xmm7, 48(%rsp)
	mulss	%xmm5, %xmm1
	movss	1208(%rsp), %xmm7
	movss	%xmm7, 80(%rsp)
	movss	1212(%rsp), %xmm7
	cvttss2sil	%xmm0, %edi
	movss	.LC195(%rip), %xmm0
	movss	%xmm7, 84(%rsp)
	movss	%xmm1, 244(%rsp)
	mulss	%xmm8, %xmm0
	cvttss2sil	%xmm0, %r14d
	testl	%r14d, %r14d
	setg	151(%rsp)
	movl	%eax, 56(%rsp)
	movl	2376(%rsp), %eax
	movss	1192(%rsp), %xmm7
	movl	FORMANTS(%rip), %ebx
	movss	%xmm7, 144(%rsp)
	movss	1188(%rsp), %xmm7
	movl	%eax, 88(%rsp)
	movl	72(%rsp), %eax
	movss	%xmm7, 136(%rsp)
	movss	824(%rsp), %xmm7
	movss	%xmm7, 92(%rsp)
	movl	%eax, %ecx
	subl	%r14d, %ecx
	testl	%edi, %edi
	movl	%ecx, 96(%rsp)
	jle	.L1045
	movss	.LC51(%rip), %xmm7
	cmpl	%edi, %eax
	movl	%eax, %r11d
	movslq	%ebx, %rcx
	cmovg	%edi, %r11d
	xorl	%r8d, %r8d
	xorl	%r12d, %r12d
	movl	%r14d, 308(%rsp)
	movss	%xmm7, 100(%rsp)
	movss	.LC204(%rip), %xmm7
	leal	-1(%rbx), %eax
	movss	%xmm11, 132(%rsp)
	movss	%xmm7, 104(%rsp)
	pxor	%xmm7, %xmm7
	cvtsi2ssl	%edi, %xmm7
	leaq	0(,%rcx,4), %r14
	movl	%eax, 268(%rsp)
	leaq	4(,%rax,4), %rax
	movq	%rax, 216(%rsp)
	movl	$0x00000000, 196(%rsp)
	movl	$0x00000000, 200(%rsp)
	movl	$0x00000000, 204(%rsp)
	movl	$0x00000000, 224(%rsp)
	movl	$0x00000000, 108(%rsp)
	movl	$0x00000000, 128(%rsp)
	movl	%r8d, 156(%rsp)
	movl	%edi, 320(%rsp)
	movl	%r11d, 192(%rsp)
	movl	%ebp, 324(%rsp)
	movq	%rcx, 328(%rsp)
	movq	%rsi, 184(%rsp)
	movss	%xmm7, 208(%rsp)
	pxor	%xmm7, %xmm7
	.p2align 4,,10
	.p2align 3
.L759:
	pxor	%xmm14, %xmm14
	cvtsi2ssl	%r12d, %xmm14
	testl	%ebx, %ebx
	movaps	%xmm14, %xmm2
	divss	%xmm8, %xmm2
	mulss	100(%rsp), %xmm2
	jle	.L553
	movss	828(%rsp), %xmm0
	cmpl	$1, %ebx
	movss	%xmm0, 448(%rsp)
	je	.L1715
	movss	860(%rsp), %xmm0
	cmpl	$2, %ebx
	movss	%xmm0, 452(%rsp)
	je	.L1716
	movss	892(%rsp), %xmm0
	cmpl	$3, %ebx
	movss	%xmm0, 456(%rsp)
	je	.L1662
	movss	924(%rsp), %xmm0
	cmpl	$4, %ebx
	movss	%xmm0, 460(%rsp)
	je	.L1662
	movss	956(%rsp), %xmm0
	cmpl	$5, %ebx
	movss	%xmm0, 464(%rsp)
	je	.L1662
	movss	988(%rsp), %xmm0
	cmpl	$6, %ebx
	movss	%xmm0, 468(%rsp)
	je	.L1662
	movss	1020(%rsp), %xmm0
	cmpl	$7, %ebx
	movss	%xmm0, 472(%rsp)
	je	.L1662
	movss	1052(%rsp), %xmm0
	cmpl	$8, %ebx
	movss	%xmm0, 476(%rsp)
	je	.L1662
	movss	1084(%rsp), %xmm0
	cmpl	$9, %ebx
	movss	%xmm0, 480(%rsp)
	je	.L1662
	movss	1116(%rsp), %xmm0
	movss	%xmm0, 484(%rsp)
.L1662:
	movss	832(%rsp), %xmm0
	cmpl	$3, %ebx
	movss	%xmm0, 496(%rsp)
	movss	864(%rsp), %xmm0
	movss	%xmm0, 500(%rsp)
	movss	896(%rsp), %xmm0
	movss	%xmm0, 504(%rsp)
	je	.L543
	movss	928(%rsp), %xmm0
	cmpl	$4, %ebx
	movss	%xmm0, 508(%rsp)
	je	.L543
	movss	960(%rsp), %xmm0
	cmpl	$5, %ebx
	movss	%xmm0, 512(%rsp)
	je	.L543
	movss	992(%rsp), %xmm0
	cmpl	$6, %ebx
	movss	%xmm0, 516(%rsp)
	je	.L543
	movss	1024(%rsp), %xmm0
	cmpl	$7, %ebx
	movss	%xmm0, 520(%rsp)
	je	.L543
	movss	1056(%rsp), %xmm0
	cmpl	$8, %ebx
	movss	%xmm0, 524(%rsp)
	je	.L543
	movss	1088(%rsp), %xmm0
	cmpl	$9, %ebx
	movss	%xmm0, 528(%rsp)
	je	.L543
	movss	1120(%rsp), %xmm0
	movss	%xmm0, 532(%rsp)
.L543:
	movq	216(%rsp), %r8
	leaq	544(%rsp), %rcx
	movss	%xmm2, 112(%rsp)
	leaq	1148(%rsp), %rdx
	call	memcpy
	movss	112(%rsp), %xmm2
.L553:
	testq	%r15, %r15
	je	.L1620
	movl	1240(%rsp), %edx
	testl	%edx, %edx
	jle	.L1620
	movss	(%r15), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1717
	cmpl	$1, 76(%rsp)
	je	.L560
	movq	%r15, %rcx
	movss	%xmm2, 112(%rsp)
	call	contour_f0.part.0
	movss	112(%rsp), %xmm2
	movaps	%xmm0, %xmm1
.L561:
	cmpb	$0, 150(%rsp)
	jne	.L1718
	movss	140(%rsp), %xmm5
	movss	144(%rsp), %xmm12
	movss	136(%rsp), %xmm13
	movss	%xmm5, 112(%rsp)
.L1665:
	movss	%xmm6, 120(%rsp)
.L563:
	movss	48(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L618
	movss	.LC192(%rip), %xmm0
	mulss	1204(%rsp), %xmm0
	divss	%xmm8, %xmm0
	addss	2388(%rsp), %xmm0
	comiss	.LC192(%rip), %xmm0
	jb	.L620
	subss	.LC192(%rip), %xmm0
.L620:
	movss	%xmm1, 160(%rsp)
	movss	%xmm0, 2388(%rsp)
	call	sinf
	mulss	48(%rsp), %xmm0
	movss	160(%rsp), %xmm1
	addss	%xmm0, %xmm1
.L618:
	movss	80(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L622
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
	mulss	%xmm0, %xmm1
.L622:
	movss	84(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L1629
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
	movss	%xmm0, 160(%rsp)
.L624:
	comiss	%xmm7, %xmm1
	jbe	.L626
	movss	.LC98(%rip), %xmm2
	comiss	%xmm1, %xmm2
	ja	.L1064
	movss	.LC93(%rip), %xmm2
	movaps	%xmm2, %xmm3
	cmpltss	%xmm1, %xmm3
	andps	%xmm3, %xmm2
	andnps	%xmm1, %xmm3
	orps	%xmm2, %xmm3
	movaps	%xmm3, %xmm1
.L626:
	testl	%ebx, %ebx
	jle	.L637
	comiss	%xmm8, %xmm7
	jnb	.L631
	movq	64(%rsp), %rax
	xorl	%edi, %edi
	movq	%r12, 288(%rsp)
	cmpl	$0, 56(%rsp)
	leaq	448(%rsp), %rbp
	movl	%ebx, 304(%rsp)
	movss	%xmm9, 256(%rsp)
	movq	%rbp, %rbx
	movss	%xmm10, 296(%rsp)
	leaq	544(%rsp), %rbp
	movss	%xmm1, 300(%rsp)
	movq	%rax, %rsi
	leaq	496(%rsp), %r12
	je	.L644
	jmp	.L636
	.p2align 4,,10
	.p2align 3
.L1719:
	comiss	%xmm0, %xmm7
	jnb	.L634
	mulss	.LC185(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC192(%rip), %xmm3
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm3
	divss	%xmm8, %xmm3
	movaps	%xmm3, %xmm0
	call	cosf
	movss	.LC191(%rip), %xmm1
	movaps	%xmm0, %xmm3
	movaps	%xmm9, %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm9, %xmm1
	movss	%xmm0, 48(%rsi)
	movaps	%xmm6, %xmm0
	mulss	%xmm3, %xmm1
	subss	%xmm9, %xmm0
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 40(%rsi)
.L635:
	addq	$4, %rdi
	addq	$4, %rbp
	addq	$32, %rsi
	cmpq	%rdi, %r14
	je	.L1668
.L636:
	movss	0(%rbp), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rbx,%rdi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm4
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%r12,%rdi), %xmm0
	movss	%xmm1, 36(%rsi)
	unpcklps	%xmm0, %xmm4
	movlps	%xmm4, 28(%rsi)
	jb	.L1719
.L634:
	movq	$0, 40(%rsi)
	movl	$0x00000000, 48(%rsi)
	jmp	.L635
	.p2align 4,,10
	.p2align 3
.L1630:
	comiss	%xmm0, %xmm7
	jnb	.L642
	mulss	.LC185(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC192(%rip), %xmm3
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm3
	divss	%xmm8, %xmm3
	movaps	%xmm3, %xmm0
	call	cosf
	movaps	%xmm9, %xmm1
	mulss	%xmm9, %xmm1
	movaps	%xmm0, %xmm3
	movss	.LC191(%rip), %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm3, %xmm0
	movaps	%xmm0, %xmm3
	addss	%xmm6, %xmm0
	unpcklps	%xmm1, %xmm3
	movlps	%xmm3, 44(%rsi)
	addss	%xmm1, %xmm0
	movss	.LC166(%rip), %xmm1
	maxss	%xmm0, %xmm1
	movss	%xmm1, 40(%rsi)
.L641:
	addq	$4, %rdi
	addq	$4, %rbp
	addq	$32, %rsi
	cmpq	%r14, %rdi
	je	.L1668
.L644:
	movss	0(%rbp), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rbx,%rdi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm4
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%r12,%rdi), %xmm0
	movss	%xmm1, 36(%rsi)
	unpcklps	%xmm0, %xmm4
	movlps	%xmm4, 28(%rsi)
	jb	.L1630
.L642:
	movq	$0, 40(%rsi)
	movl	$0x00000000, 48(%rsi)
	jmp	.L641
.L1668:
	movq	288(%rsp), %r12
	movl	304(%rsp), %ebx
	movss	256(%rsp), %xmm9
	movss	296(%rsp), %xmm10
	movss	300(%rsp), %xmm1
.L637:
	mulss	%xmm15, %xmm11
	movaps	%xmm6, %xmm2
	movss	104(%rsp), %xmm5
	subss	%xmm15, %xmm2
	mulss	%xmm15, %xmm9
	mulss	%xmm15, %xmm10
	comiss	132(%rsp), %xmm5
	mulss	%xmm2, %xmm13
	mulss	%xmm2, %xmm12
	mulss	112(%rsp), %xmm2
	addss	%xmm13, %xmm11
	addss	%xmm12, %xmm9
	addss	%xmm2, %xmm10
	jbe	.L630
	comiss	.LC204(%rip), %xmm11
	jb	.L630
	movss	%xmm7, 2384(%rsp)
	comiss	%xmm7, %xmm1
	jbe	.L654
.L650:
	movaps	%xmm8, %xmm2
	divss	%xmm1, %xmm2
	movaps	%xmm6, %xmm1
	divss	%xmm2, %xmm1
	addss	2384(%rsp), %xmm1
	comiss	%xmm6, %xmm1
	jb	.L653
	subss	%xmm6, %xmm1
.L653:
	movss	%xmm1, 2384(%rsp)
	movl	808(%rsp), %eax
	cmpl	$2, %eax
	je	.L1720
	movss	.LC208(%rip), %xmm2
	comiss	%xmm1, %xmm2
	jbe	.L1632
	movaps	%xmm1, %xmm3
	divss	%xmm2, %xmm3
.L661:
	subl	$1, %eax
	je	.L662
	addss	%xmm3, %xmm3
	subss	%xmm6, %xmm3
.L657:
	mulss	%xmm11, %xmm3
	mulss	160(%rsp), %xmm3
.L651:
	comiss	.LC206(%rip), %xmm9
	pxor	%xmm1, %xmm1
	jbe	.L663
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	movss	168(%rsp), %xmm2
	movss	128(%rsp), %xmm1
	movss	176(%rsp), %xmm4
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
	mulss	%xmm0, %xmm2
	mulss	172(%rsp), %xmm0
	addss	%xmm2, %xmm1
	mulss	%xmm1, %xmm4
	subss	%xmm4, %xmm0
	addss	108(%rsp), %xmm0
	movss	%xmm0, 128(%rsp)
	movss	180(%rsp), %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm9, %xmm1
	subss	%xmm0, %xmm2
	movss	%xmm2, 108(%rsp)
.L663:
	comiss	.LC206(%rip), %xmm10
	pxor	%xmm0, %xmm0
	jbe	.L665
	movl	g_noise_state(%rip), %edx
	pxor	%xmm2, %xmm2
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cmpl	$0, 156(%rsp)
	cvtsi2ssl	%eax, %xmm2
	mulss	.LC203(%rip), %xmm2
	je	.L667
	movss	232(%rsp), %xmm4
	movss	200(%rsp), %xmm0
	movss	240(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	mulss	236(%rsp), %xmm2
	addss	%xmm4, %xmm0
	mulss	%xmm0, %xmm5
	subss	%xmm5, %xmm2
	addss	196(%rsp), %xmm2
	movss	%xmm2, 200(%rsp)
	movss	244(%rsp), %xmm2
	mulss	%xmm0, %xmm2
	subss	%xmm2, %xmm4
	movss	%xmm4, 196(%rsp)
.L668:
	mulss	%xmm10, %xmm0
	movl	%eax, g_noise_state(%rip)
.L665:
	movl	56(%rsp), %eax
	addss	%xmm3, %xmm1
	testl	%eax, %eax
	je	.L669
	testl	%ebx, %ebx
	pxor	%xmm2, %xmm2
	jle	.L671
	movss	828(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L1635
	movss	840(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L707
	je	.L1721
.L707:
	movss	852(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	844(%rsp), %xmm4
	mulss	%xmm3, %xmm4
	subss	%xmm4, %xmm2
	movss	848(%rsp), %xmm4
	mulss	856(%rsp), %xmm4
	subss	%xmm4, %xmm2
	movaps	%xmm2, %xmm4
	mulss	836(%rsp), %xmm2
	unpcklps	%xmm3, %xmm4
	movlps	%xmm4, 852(%rsp)
.L709:
	addss	%xmm7, %xmm2
.L705:
	cmpl	$1, %ebx
	je	.L671
	movss	860(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L711
	movss	872(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L713
	je	.L1722
.L713:
	movss	884(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	876(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	880(%rsp), %xmm3
	mulss	888(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	868(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 884(%rsp)
	movaps	%xmm5, %xmm3
.L715:
	addss	%xmm3, %xmm2
.L711:
	cmpl	$2, %ebx
	je	.L671
	movss	892(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L716
	movss	904(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L718
	je	.L1723
.L718:
	movss	916(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	908(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	912(%rsp), %xmm3
	mulss	920(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	900(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 916(%rsp)
	movaps	%xmm5, %xmm3
.L720:
	addss	%xmm3, %xmm2
.L716:
	cmpl	$3, %ebx
	je	.L671
	movss	924(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L721
	movss	936(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L723
	je	.L1724
.L723:
	movss	948(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	940(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	944(%rsp), %xmm3
	mulss	952(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	932(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 948(%rsp)
	movaps	%xmm5, %xmm3
.L725:
	addss	%xmm3, %xmm2
.L721:
	cmpl	$4, %ebx
	je	.L671
	movss	956(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L726
	movss	968(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L728
	je	.L1725
.L728:
	movss	980(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	972(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	976(%rsp), %xmm3
	mulss	984(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	964(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 980(%rsp)
	movaps	%xmm5, %xmm3
.L730:
	addss	%xmm3, %xmm2
.L726:
	cmpl	$5, %ebx
	je	.L671
	movss	988(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L731
	movss	1000(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L733
	je	.L1726
.L733:
	movss	1012(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1004(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1008(%rsp), %xmm3
	mulss	1016(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	996(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1012(%rsp)
	movaps	%xmm5, %xmm3
.L735:
	addss	%xmm3, %xmm2
.L731:
	cmpl	$6, %ebx
	je	.L671
	movss	1020(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L736
	movss	1032(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L738
	je	.L1727
.L738:
	movss	1044(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1036(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1040(%rsp), %xmm3
	mulss	1048(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1028(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1044(%rsp)
	movaps	%xmm5, %xmm3
.L740:
	addss	%xmm3, %xmm2
.L736:
	cmpl	$7, %ebx
	je	.L671
	movss	1052(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L741
	movss	1064(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L743
	je	.L1728
.L743:
	movss	1076(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1068(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1072(%rsp), %xmm3
	mulss	1080(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1060(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1076(%rsp)
	movaps	%xmm5, %xmm3
.L745:
	addss	%xmm3, %xmm2
.L741:
	cmpl	$8, %ebx
	je	.L671
	movss	1084(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L746
	movss	1096(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L748
	je	.L1729
.L748:
	movss	1108(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1100(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1104(%rsp), %xmm3
	mulss	1112(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1092(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1108(%rsp)
	movaps	%xmm5, %xmm3
.L750:
	addss	%xmm3, %xmm2
.L746:
	cmpl	$9, %ebx
	je	.L671
	movss	1116(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L671
	movss	1128(%rsp), %xmm3
	ucomiss	%xmm7, %xmm3
	jp	.L1190
	je	.L1080
.L1190:
	movss	1140(%rsp), %xmm4
	mulss	%xmm3, %xmm1
	movss	1132(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm1
	movss	1136(%rsp), %xmm3
	mulss	1144(%rsp), %xmm3
	subss	%xmm3, %xmm1
	movaps	%xmm1, %xmm3
	mulss	1124(%rsp), %xmm1
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1140(%rsp)
.L753:
	addss	%xmm1, %xmm2
.L671:
	mulss	.LC210(%rip), %xmm0
	addss	%xmm2, %xmm0
.L704:
	movl	88(%rsp), %eax
	testl	%eax, %eax
	je	.L755
	movss	.LC211(%rip), %xmm1
	mulss	2392(%rsp), %xmm1
	movss	%xmm0, 2392(%rsp)
	subss	%xmm1, %xmm0
.L755:
	movss	120(%rsp), %xmm1
	mulss	92(%rsp), %xmm1
	cmpl	%r12d, 96(%rsp)
	mulss	%xmm0, %xmm1
	movaps	%xmm14, %xmm0
	divss	208(%rsp), %xmm0
	mulss	%xmm1, %xmm0
	jg	.L756
	cmpb	$0, 151(%rsp)
	jne	.L1730
.L756:
	movq	184(%rsp), %rax
	movss	%xmm0, (%rax,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, 192(%rsp)
	jle	.L1656
.L757:
	movss	%xmm11, 132(%rsp)
	jmp	.L759
.L630:
	comiss	%xmm7, %xmm1
	jbe	.L654
	comiss	.LC206(%rip), %xmm11
	ja	.L650
.L654:
	pxor	%xmm3, %xmm3
	jmp	.L651
.L1620:
	cmpl	$1, 76(%rsp)
	movss	152(%rsp), %xmm1
	jne	.L561
	movslq	1256(%rsp), %rcx
	testl	%ecx, %ecx
	je	.L1051
.L1663:
	movq	1248(%rsp), %rdx
	movss	(%rdx), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L564
	leal	-1(%rcx), %eax
	subq	$1, %rcx
	imulq	$148, %rcx, %rcx
	movl	%eax, %r9d
	comiss	(%rdx,%rcx), %xmm2
	jnb	.L565
	testl	%eax, %eax
	jle	.L1053
	movq	%rdx, %rcx
	xorl	%r9d, %r9d
.L569:
	comiss	(%rcx), %xmm2
	jb	.L566
	movss	148(%rcx), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1731
.L566:
	addl	$1, %r9d
	addq	$148, %rcx
	cmpl	%r9d, %eax
	jg	.L569
.L1053:
	xorl	%r9d, %r9d
.L565:
	movslq	%r9d, %r9
	cltq
	imulq	$148, %r9, %r9
	imulq	$148, %rax, %rax
	addq	%rdx, %r9
	addq	%rax, %rdx
	testl	%ebx, %ebx
	movss	(%r9), %xmm0
	movss	(%rdx), %xmm3
	jle	.L1023
	comiss	%xmm3, %xmm0
	movl	144(%r9), %r10d
	movl	144(%rdx), %r8d
	jnb	.L573
	movaps	%xmm2, %xmm4
	subss	%xmm0, %xmm3
	testl	%r10d, %r10d
	subss	%xmm0, %xmm4
	movd	%xmm4, %r10d
	jne	.L574
	divss	%xmm3, %xmm4
	xorl	%eax, %eax
	movss	%xmm2, 112(%rsp)
	pxor	%xmm12, %xmm12
	leaq	544(%rsp), %rcx
	movss	%xmm3, 120(%rsp)
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	jmp	.L579
.L1732:
	movaps	%xmm6, %xmm5
	movaps	%xmm6, %xmm3
	testl	%r8d, %r8d
	cmpltss	%xmm4, %xmm5
	subss	%xmm13, %xmm2
	andps	%xmm5, %xmm3
	andnps	%xmm4, %xmm5
	orps	%xmm3, %xmm5
	mulss	%xmm5, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, 0(%rbp,%rax,4)
	movaps	%xmm2, %xmm0
	mulss	%xmm5, %xmm0
	addss	%xmm13, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	movaps	%xmm6, %xmm0
	je	.L577
	movss	104(%rdx,%rax,4), %xmm0
.L577:
	movaps	%xmm6, %xmm1
	movaps	%xmm6, %xmm5
	cmpltss	%xmm4, %xmm1
	andps	%xmm1, %xmm5
	andnps	%xmm4, %xmm1
	orps	%xmm5, %xmm1
.L578:
	subss	%xmm6, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm6, %xmm0
	movss	%xmm0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L1679
.L579:
	comiss	%xmm4, %xmm12
	movss	4(%r9,%rax,4), %xmm1
	movss	4(%rdx,%rax,4), %xmm0
	movss	44(%r9,%rax,4), %xmm13
	subss	%xmm1, %xmm0
	movss	44(%rdx,%rax,4), %xmm2
	jbe	.L1732
	mulss	%xmm12, %xmm0
	subss	%xmm13, %xmm2
	testl	%r8d, %r8d
	addss	%xmm1, %xmm0
	movss	%xmm0, 0(%rbp,%rax,4)
	movaps	%xmm2, %xmm0
	mulss	%xmm12, %xmm0
	addss	%xmm13, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	je	.L1054
	movss	104(%rdx,%rax,4), %xmm0
	pxor	%xmm1, %xmm1
	jmp	.L578
.L669:
	testl	%ebx, %ebx
	jle	.L672
	movss	828(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L673
	movss	840(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1152
	je	.L1069
.L1152:
	movss	852(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	844(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	848(%rsp), %xmm1
	mulss	856(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	836(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 852(%rsp)
	movaps	%xmm2, %xmm1
.L673:
	cmpl	$1, %ebx
	je	.L672
	movss	860(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L677
	movss	872(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1154
	je	.L1070
.L1154:
	movss	884(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	876(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	880(%rsp), %xmm1
	mulss	888(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	868(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 884(%rsp)
	movaps	%xmm2, %xmm1
.L677:
	cmpl	$2, %ebx
	je	.L672
	movss	892(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L680
	movss	904(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1156
	je	.L1071
.L1156:
	movss	916(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	908(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	912(%rsp), %xmm1
	mulss	920(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	900(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 916(%rsp)
	movaps	%xmm2, %xmm1
.L680:
	cmpl	$3, %ebx
	je	.L672
	movss	924(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L683
	movss	936(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1158
	je	.L1072
.L1158:
	movss	948(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	940(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	944(%rsp), %xmm1
	mulss	952(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	932(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 948(%rsp)
	movaps	%xmm2, %xmm1
.L683:
	cmpl	$4, %ebx
	je	.L672
	movss	956(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L686
	movss	968(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1160
	je	.L1073
.L1160:
	movss	980(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	972(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	976(%rsp), %xmm1
	mulss	984(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	964(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 980(%rsp)
	movaps	%xmm2, %xmm1
.L686:
	cmpl	$5, %ebx
	je	.L672
	movss	988(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L689
	movss	1000(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1162
	je	.L1074
.L1162:
	movss	1012(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1004(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1008(%rsp), %xmm1
	mulss	1016(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	996(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1012(%rsp)
	movaps	%xmm2, %xmm1
.L689:
	cmpl	$6, %ebx
	je	.L672
	movss	1020(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L692
	movss	1032(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1164
	je	.L1075
.L1164:
	movss	1044(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1036(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1040(%rsp), %xmm1
	mulss	1048(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1028(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1044(%rsp)
	movaps	%xmm2, %xmm1
.L692:
	cmpl	$7, %ebx
	je	.L672
	movss	1052(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L695
	movss	1064(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1166
	je	.L1076
.L1166:
	movss	1076(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1068(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1072(%rsp), %xmm1
	mulss	1080(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1060(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1076(%rsp)
	movaps	%xmm2, %xmm1
.L695:
	cmpl	$8, %ebx
	je	.L672
	movss	1084(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L698
	movss	1096(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1168
	je	.L1077
.L1168:
	movss	1108(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1100(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1104(%rsp), %xmm1
	mulss	1112(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1092(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1108(%rsp)
	movaps	%xmm2, %xmm1
.L698:
	cmpl	$9, %ebx
	je	.L672
	movss	1116(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L672
	movss	1128(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1170
	je	.L1078
.L1170:
	movss	1140(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1132(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1136(%rsp), %xmm1
	mulss	1144(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1124(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1140(%rsp)
	movaps	%xmm2, %xmm1
.L672:
	mulss	.LC60(%rip), %xmm0
	addss	%xmm1, %xmm0
	jmp	.L704
.L1629:
	movss	%xmm6, 160(%rsp)
	jmp	.L624
.L631:
	cmpl	$1, %ebx
	je	.L1065
	movq	544(%rsp), %xmm4
	movl	%ebx, %edx
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	movq	.LC205(%rip), %rax
	pxor	%xmm3, %xmm3
	movaps	%xmm3, %xmm2
	shrl	%edx
	movq	%xmm4, %xmm5
	cmpl	$1, %edx
	movq	496(%rsp), %xmm0
	movq	%rdi, 844(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rbp, 876(%rsp)
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	448(%rsp), %xmm5
	movss	%xmm4, 256(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 868(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 828(%rsp)
	movss	256(%rsp), %xmm2
	movlps	%xmm5, 860(%rsp)
	movlps	%xmm2, 836(%rsp)
	je	.L646
	movq	552(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%r11d, %r11d
	xorl	%esi, %esi
	movq	504(%rsp), %xmm0
	cmpl	$2, %edx
	movq	%r11, 908(%rsp)
	movq	%xmm4, %xmm5
	movq	%rsi, 940(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	456(%rsp), %xmm5
	movss	%xmm4, 256(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 932(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 892(%rsp)
	movss	256(%rsp), %xmm2
	movlps	%xmm5, 924(%rsp)
	movlps	%xmm2, 900(%rsp)
	je	.L646
	movq	560(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	movq	512(%rsp), %xmm0
	cmpl	$3, %edx
	movq	%r9, 972(%rsp)
	movq	%xmm4, %xmm5
	movq	%r10, 1004(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	464(%rsp), %xmm5
	movss	%xmm4, 256(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 996(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 956(%rsp)
	movss	256(%rsp), %xmm2
	movlps	%xmm5, 988(%rsp)
	movlps	%xmm2, 964(%rsp)
	je	.L646
	movq	568(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	movq	520(%rsp), %xmm0
	cmpl	$4, %edx
	movq	%rcx, 1036(%rsp)
	movq	%xmm4, %xmm5
	movq	%r8, 1068(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	472(%rsp), %xmm5
	movss	%xmm4, 256(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 1060(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 1020(%rsp)
	movss	256(%rsp), %xmm2
	movlps	%xmm5, 1052(%rsp)
	movlps	%xmm2, 1028(%rsp)
	je	.L646
	movq	576(%rsp), %xmm2
	movq	528(%rsp), %xmm5
	movq	%xmm2, %xmm4
	cmpltps	%xmm4, %xmm3
	movq	%rax, %xmm4
	xorl	%eax, %eax
	movq	%rax, 1100(%rsp)
	xorl	%eax, %eax
	movq	%rax, 1132(%rsp)
	andps	%xmm3, %xmm2
	andnps	%xmm4, %xmm3
	orps	%xmm2, %xmm3
	movq	480(%rsp), %xmm4
	movss	%xmm3, 256(%rsp)
	psrlq	$32, %xmm3
	movaps	%xmm4, %xmm2
	movlps	%xmm3, 1124(%rsp)
	unpcklps	%xmm5, %xmm4
	shufps	$78, %xmm4, %xmm4
	unpcklps	%xmm5, %xmm2
	movlps	%xmm2, 1084(%rsp)
	movss	256(%rsp), %xmm2
	movlps	%xmm4, 1116(%rsp)
	movlps	%xmm2, 1092(%rsp)
.L646:
	testb	$1, %bl
	je	.L637
	movl	%ebx, %eax
	andl	$-2, %eax
.L645:
	cltq
	movss	544(%rsp,%rax,4), %xmm2
	comiss	%xmm7, %xmm2
	ja	.L648
	movaps	%xmm6, %xmm2
.L648:
	movq	64(%rsp), %rdi
	movq	%rax, %rdx
	movss	496(%rsp,%rax,4), %xmm3
	salq	$5, %rdx
	movss	448(%rsp,%rax,4), %xmm4
	xorl	%eax, %eax
	unpcklps	%xmm3, %xmm4
	movlps	%xmm4, 28(%rdi,%rdx)
	movss	%xmm2, 836(%rsp,%rdx)
	movl	$0x00000000, 840(%rsp,%rdx)
	movq	%rax, 44(%rdi,%rdx)
	jmp	.L637
.L1730:
	movl	72(%rsp), %eax
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2ssl	308(%rsp), %xmm2
	subl	%r12d, %eax
	cvtsi2ssl	%eax, %xmm1
	movq	184(%rsp), %rax
	divss	%xmm2, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, 192(%rsp)
	jg	.L757
	movl	320(%rsp), %edi
	movq	%rax, %rsi
	movl	308(%rsp), %r14d
	movl	192(%rsp), %r11d
	movl	324(%rsp), %ebp
	movq	328(%rsp), %rcx
	jmp	.L758
.L1064:
	movaps	%xmm2, %xmm1
	jmp	.L626
.L667:
	movss	248(%rsp), %xmm0
	movss	252(%rsp), %xmm5
	mulss	%xmm2, %xmm0
	addss	224(%rsp), %xmm0
	mulss	%xmm7, %xmm2
	mulss	%xmm0, %xmm5
	movaps	%xmm2, %xmm4
	subss	%xmm5, %xmm4
	addss	204(%rsp), %xmm4
	movss	%xmm4, 224(%rsp)
	movss	264(%rsp), %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm4, %xmm2
	movss	%xmm2, 204(%rsp)
	jmp	.L668
.L1718:
	movslq	1280(%rsp), %rax
	movss	0(%r13,%rax,4), %xmm0
	movq	%rax, %rcx
	comiss	%xmm2, %xmm0
	jbe	.L592
	subl	$1, %ecx
	js	.L592
	xorl	%r8d, %r8d
	jmp	.L599
	.p2align 6
.L1733:
	leal	-1(%rax), %ecx
.L596:
	cmpl	%r8d, %ecx
	jl	.L592
.L599:
	leal	(%r8,%rcx), %edx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	movslq	%eax, %rdi
	movss	0(%r13,%rdi,4), %xmm0
	comiss	%xmm2, %xmm0
	ja	.L1733
	comiss	4(%r13,%rdi,4), %xmm2
	jb	.L1625
	leal	1(%rax), %r8d
	jmp	.L596
.L1635:
	pxor	%xmm2, %xmm2
	jmp	.L705
.L1717:
	cmpl	$1, 76(%rsp)
	je	.L1734
	movss	4(%r15), %xmm1
	jmp	.L561
.L592:
	testl	%ebx, %ebx
	jle	.L1666
	cmpl	$2, 268(%rsp)
	jbe	.L1061
	movl	%ebx, %eax
	movss	.LC96(%rip), %xmm2
	movss	.LC61(%rip), %xmm1
	shrl	$2, %eax
	movss	.LC43(%rip), %xmm0
	subl	$1, %eax
	shufps	$0, %xmm2, %xmm2
	movaps	%xmm2, 448(%rsp)
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, 496(%rsp)
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm0, 544(%rsp)
	jne	.L1735
.L614:
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L1666
.L613:
	movss	.LC96(%rip), %xmm1
	cltq
	movss	.LC61(%rip), %xmm0
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
.L616:
	movss	%xmm1, 0(%rbp,%rax,4)
	movss	%xmm0, (%rdi,%rax,4)
	movss	%xmm6, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L616
.L1666:
	pxor	%xmm12, %xmm12
	movaps	%xmm12, %xmm13
	movaps	%xmm12, %xmm1
	movss	%xmm6, 120(%rsp)
	movl	$0x00000000, 112(%rsp)
	jmp	.L563
.L1045:
	movss	.LC51(%rip), %xmm7
	xorl	%r12d, %r12d
	movl	$0x00000000, 196(%rsp)
	xorl	%r11d, %r11d
	leal	-1(%rbx), %eax
	movslq	%ebx, %rcx
	movl	$0x00000000, 200(%rsp)
	movss	%xmm7, 100(%rsp)
	movss	.LC204(%rip), %xmm7
	movl	$0x00000000, 204(%rsp)
	movl	$0x00000000, 224(%rsp)
	movl	$0x00000000, 108(%rsp)
	movl	$0x00000000, 128(%rsp)
	movl	%r12d, 156(%rsp)
	movl	%eax, 268(%rsp)
	movss	%xmm7, 104(%rsp)
.L538:
	movl	268(%rsp), %eax
	movslq	%r11d, %r12
	pxor	%xmm7, %xmm7
	movl	%r14d, 184(%rsp)
	movl	%ebp, 296(%rsp)
	leaq	0(,%rcx,4), %r14
	movq	%rsi, 120(%rsp)
	leaq	4(,%rax,4), %rax
	movq	%rax, 160(%rsp)
.L980:
	pxor	%xmm2, %xmm2
	cvtsi2ssl	%r12d, %xmm2
	testl	%ebx, %ebx
	divss	%xmm8, %xmm2
	mulss	100(%rsp), %xmm2
	jle	.L760
	movss	828(%rsp), %xmm0
	cmpl	$1, %ebx
	movss	%xmm0, 448(%rsp)
	je	.L1736
	movss	860(%rsp), %xmm0
	cmpl	$2, %ebx
	movss	%xmm0, 452(%rsp)
	je	.L1737
	movss	892(%rsp), %xmm0
	cmpl	$3, %ebx
	movss	%xmm0, 456(%rsp)
	je	.L1669
	movss	924(%rsp), %xmm0
	cmpl	$4, %ebx
	movss	%xmm0, 460(%rsp)
	je	.L1669
	movss	956(%rsp), %xmm0
	cmpl	$5, %ebx
	movss	%xmm0, 464(%rsp)
	je	.L1669
	movss	988(%rsp), %xmm0
	cmpl	$6, %ebx
	movss	%xmm0, 468(%rsp)
	je	.L1669
	movss	1020(%rsp), %xmm0
	cmpl	$7, %ebx
	movss	%xmm0, 472(%rsp)
	je	.L1669
	movss	1052(%rsp), %xmm0
	cmpl	$8, %ebx
	movss	%xmm0, 476(%rsp)
	je	.L1669
	movss	1084(%rsp), %xmm0
	cmpl	$9, %ebx
	movss	%xmm0, 480(%rsp)
	je	.L1669
	movss	1116(%rsp), %xmm0
	movss	%xmm0, 484(%rsp)
.L1669:
	movss	832(%rsp), %xmm0
	cmpl	$3, %ebx
	movss	%xmm0, 496(%rsp)
	movss	864(%rsp), %xmm0
	movss	%xmm0, 500(%rsp)
	movss	896(%rsp), %xmm0
	movss	%xmm0, 504(%rsp)
	je	.L762
	movss	928(%rsp), %xmm0
	cmpl	$4, %ebx
	movss	%xmm0, 508(%rsp)
	je	.L762
	movss	960(%rsp), %xmm0
	cmpl	$5, %ebx
	movss	%xmm0, 512(%rsp)
	je	.L762
	movss	992(%rsp), %xmm0
	cmpl	$6, %ebx
	movss	%xmm0, 516(%rsp)
	je	.L762
	movss	1024(%rsp), %xmm0
	cmpl	$7, %ebx
	movss	%xmm0, 520(%rsp)
	je	.L762
	movss	1056(%rsp), %xmm0
	cmpl	$8, %ebx
	movss	%xmm0, 524(%rsp)
	je	.L762
	movss	1088(%rsp), %xmm0
	cmpl	$9, %ebx
	movss	%xmm0, 528(%rsp)
	je	.L762
	movss	1120(%rsp), %xmm0
	movss	%xmm0, 532(%rsp)
.L762:
	movq	160(%rsp), %r8
	leaq	544(%rsp), %rcx
	movss	%xmm2, 112(%rsp)
	leaq	1148(%rsp), %rdx
	call	memcpy
	movss	112(%rsp), %xmm2
.L760:
	testq	%r15, %r15
	je	.L772
	movl	1240(%rsp), %edx
	testl	%edx, %edx
	jle	.L772
	movss	(%r15), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1738
	cmpl	$1, 76(%rsp)
	je	.L780
	movq	%r15, %rcx
	movss	%xmm2, 112(%rsp)
	call	contour_f0.part.0
	movss	112(%rsp), %xmm2
	movaps	%xmm0, %xmm1
.L779:
	cmpb	$0, 150(%rsp)
	jne	.L1739
	movss	140(%rsp), %xmm5
	movaps	%xmm6, %xmm14
	movss	144(%rsp), %xmm13
	movss	136(%rsp), %xmm12
	movss	%xmm5, 112(%rsp)
.L782:
	movss	48(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L839
	movss	.LC192(%rip), %xmm0
	mulss	1204(%rsp), %xmm0
	divss	%xmm8, %xmm0
	addss	2388(%rsp), %xmm0
	comiss	.LC192(%rip), %xmm0
	jb	.L841
	subss	.LC192(%rip), %xmm0
.L841:
	movss	%xmm1, 132(%rsp)
	movss	%xmm0, 2388(%rsp)
	call	sinf
	mulss	48(%rsp), %xmm0
	movss	132(%rsp), %xmm1
	addss	%xmm0, %xmm1
.L839:
	movss	80(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L843
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
	mulss	%xmm0, %xmm1
.L843:
	movss	84(%rsp), %xmm5
	comiss	%xmm7, %xmm5
	jbe	.L1644
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
	movss	%xmm0, 132(%rsp)
.L845:
	comiss	%xmm7, %xmm1
	jbe	.L847
	movss	.LC98(%rip), %xmm2
	comiss	%xmm1, %xmm2
	ja	.L1099
	movss	.LC93(%rip), %xmm2
	movaps	%xmm2, %xmm3
	cmpltss	%xmm1, %xmm3
	andps	%xmm3, %xmm2
	andnps	%xmm1, %xmm3
	orps	%xmm2, %xmm3
	movaps	%xmm3, %xmm1
.L847:
	testl	%ebx, %ebx
	jle	.L849
	comiss	%xmm8, %xmm7
	jnb	.L1740
	movq	64(%rsp), %rax
	xorl	%edi, %edi
	movq	%r12, 208(%rsp)
	cmpl	$0, 56(%rsp)
	leaq	448(%rsp), %rbp
	movl	%ebx, 288(%rsp)
	movss	%xmm9, 192(%rsp)
	movq	%rbp, %rbx
	movss	%xmm10, 216(%rsp)
	leaq	544(%rsp), %rbp
	movss	%xmm1, 256(%rsp)
	movq	%rax, %rsi
	leaq	496(%rsp), %r12
	je	.L868
	jmp	.L860
	.p2align 4,,10
	.p2align 3
.L1741:
	comiss	%xmm0, %xmm7
	jnb	.L858
	mulss	.LC185(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC192(%rip), %xmm3
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm3
	divss	%xmm8, %xmm3
	movaps	%xmm3, %xmm0
	call	cosf
	movss	.LC191(%rip), %xmm1
	movaps	%xmm0, %xmm3
	movaps	%xmm9, %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm9, %xmm1
	movss	%xmm0, 48(%rsi)
	movaps	%xmm6, %xmm0
	mulss	%xmm3, %xmm1
	subss	%xmm9, %xmm0
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, 40(%rsi)
.L859:
	addq	$4, %rdi
	addq	$4, %rbp
	addq	$32, %rsi
	cmpq	%r14, %rdi
	je	.L1673
.L860:
	movss	0(%rbp), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rbx,%rdi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm4
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%r12,%rdi), %xmm0
	movss	%xmm1, 36(%rsi)
	unpcklps	%xmm0, %xmm4
	movlps	%xmm4, 28(%rsi)
	jb	.L1741
.L858:
	movq	$0, 40(%rsi)
	movl	$0x00000000, 48(%rsi)
	jmp	.L859
	.p2align 4,,10
	.p2align 3
.L1646:
	comiss	%xmm0, %xmm7
	jnb	.L865
	mulss	.LC185(%rip), %xmm0
	divss	%xmm8, %xmm0
	call	expf
	movss	.LC192(%rip), %xmm3
	movaps	%xmm0, %xmm9
	mulss	%xmm10, %xmm3
	divss	%xmm8, %xmm3
	movaps	%xmm3, %xmm0
	call	cosf
	movaps	%xmm9, %xmm1
	mulss	%xmm9, %xmm1
	movaps	%xmm0, %xmm3
	movss	.LC191(%rip), %xmm0
	mulss	%xmm9, %xmm0
	mulss	%xmm3, %xmm0
	movaps	%xmm0, %xmm3
	addss	%xmm6, %xmm0
	unpcklps	%xmm1, %xmm3
	movlps	%xmm3, 44(%rsi)
	addss	%xmm1, %xmm0
	movss	.LC166(%rip), %xmm1
	maxss	%xmm0, %xmm1
	movss	%xmm1, 40(%rsi)
.L864:
	addq	$4, %rdi
	addq	$4, %rbp
	addq	$32, %rsi
	cmpq	%rdi, %r14
	je	.L1673
.L868:
	movss	0(%rbp), %xmm1
	movaps	%xmm7, %xmm0
	movss	(%rbx,%rdi), %xmm10
	cmpltss	%xmm1, %xmm0
	comiss	%xmm10, %xmm7
	movaps	%xmm10, %xmm4
	andps	%xmm0, %xmm1
	andnps	%xmm6, %xmm0
	orps	%xmm0, %xmm1
	movss	(%r12,%rdi), %xmm0
	movss	%xmm1, 36(%rsi)
	unpcklps	%xmm0, %xmm4
	movlps	%xmm4, 28(%rsi)
	jb	.L1646
.L865:
	movq	$0, 40(%rsi)
	movl	$0x00000000, 48(%rsi)
	jmp	.L864
.L1673:
	movq	208(%rsp), %r12
	movl	288(%rsp), %ebx
	movss	192(%rsp), %xmm9
	movss	216(%rsp), %xmm10
	movss	256(%rsp), %xmm1
.L849:
	movaps	%xmm6, %xmm2
	movss	104(%rsp), %xmm5
	movaps	%xmm15, %xmm3
	subss	%xmm15, %xmm2
	mulss	%xmm11, %xmm3
	mulss	%xmm15, %xmm9
	comiss	%xmm11, %xmm5
	mulss	%xmm15, %xmm10
	mulss	%xmm2, %xmm12
	mulss	%xmm2, %xmm13
	mulss	112(%rsp), %xmm2
	addss	%xmm3, %xmm12
	addss	%xmm13, %xmm9
	addss	%xmm2, %xmm10
	jbe	.L869
	comiss	.LC204(%rip), %xmm12
	jb	.L869
	movss	%xmm7, 2384(%rsp)
	comiss	%xmm7, %xmm1
	jbe	.L883
.L872:
	movaps	%xmm8, %xmm2
	divss	%xmm1, %xmm2
	movaps	%xmm6, %xmm1
	divss	%xmm2, %xmm1
	addss	2384(%rsp), %xmm1
	comiss	%xmm6, %xmm1
	jb	.L874
	subss	%xmm6, %xmm1
.L874:
	movss	%xmm1, 2384(%rsp)
	movl	808(%rsp), %eax
	cmpl	$2, %eax
	je	.L1742
	movss	.LC208(%rip), %xmm2
	comiss	%xmm1, %xmm2
	jbe	.L1648
	movaps	%xmm1, %xmm3
	divss	%xmm2, %xmm3
.L881:
	subl	$1, %eax
	je	.L882
	addss	%xmm3, %xmm3
	subss	%xmm6, %xmm3
.L877:
	mulss	%xmm12, %xmm3
	mulss	132(%rsp), %xmm3
.L873:
	comiss	.LC206(%rip), %xmm9
	pxor	%xmm1, %xmm1
	jbe	.L885
	movl	g_noise_state(%rip), %edx
	pxor	%xmm0, %xmm0
	movss	168(%rsp), %xmm2
	movss	128(%rsp), %xmm1
	movss	176(%rsp), %xmm4
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
	mulss	%xmm0, %xmm2
	mulss	172(%rsp), %xmm0
	addss	%xmm2, %xmm1
	mulss	%xmm1, %xmm4
	subss	%xmm4, %xmm0
	addss	108(%rsp), %xmm0
	movss	%xmm0, 128(%rsp)
	movss	180(%rsp), %xmm0
	mulss	%xmm1, %xmm0
	mulss	%xmm9, %xmm1
	subss	%xmm0, %xmm2
	movss	%xmm2, 108(%rsp)
.L885:
	comiss	.LC206(%rip), %xmm10
	pxor	%xmm0, %xmm0
	jbe	.L887
	movl	g_noise_state(%rip), %edx
	pxor	%xmm2, %xmm2
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cmpl	$0, 156(%rsp)
	cvtsi2ssl	%eax, %xmm2
	mulss	.LC203(%rip), %xmm2
	je	.L889
	movss	232(%rsp), %xmm4
	movss	200(%rsp), %xmm0
	movss	240(%rsp), %xmm5
	mulss	%xmm2, %xmm4
	mulss	236(%rsp), %xmm2
	addss	%xmm4, %xmm0
	mulss	%xmm0, %xmm5
	subss	%xmm5, %xmm2
	addss	196(%rsp), %xmm2
	movss	%xmm2, 200(%rsp)
	movss	244(%rsp), %xmm2
	mulss	%xmm0, %xmm2
	subss	%xmm2, %xmm4
	movss	%xmm4, 196(%rsp)
.L890:
	mulss	%xmm10, %xmm0
	movl	%eax, g_noise_state(%rip)
.L887:
	movl	56(%rsp), %edx
	addss	%xmm3, %xmm1
	testl	%edx, %edx
	je	.L891
	testl	%ebx, %ebx
	jle	.L1105
	movss	828(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L1651
	movss	840(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L895
	je	.L1743
.L895:
	movss	852(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	844(%rsp), %xmm4
	mulss	%xmm3, %xmm4
	subss	%xmm4, %xmm2
	movss	848(%rsp), %xmm4
	mulss	856(%rsp), %xmm4
	subss	%xmm4, %xmm2
	movaps	%xmm2, %xmm4
	mulss	836(%rsp), %xmm2
	unpcklps	%xmm3, %xmm4
	movlps	%xmm4, 852(%rsp)
.L897:
	addss	%xmm7, %xmm2
.L893:
	cmpl	$1, %ebx
	je	.L892
	movss	860(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L899
	movss	872(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L901
	je	.L1744
.L901:
	movss	884(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	876(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	880(%rsp), %xmm3
	mulss	888(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	868(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 884(%rsp)
	movaps	%xmm5, %xmm3
.L903:
	addss	%xmm3, %xmm2
.L899:
	cmpl	$2, %ebx
	je	.L892
	movss	892(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L904
	movss	904(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L906
	je	.L1745
.L906:
	movss	916(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	908(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	912(%rsp), %xmm3
	mulss	920(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	900(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 916(%rsp)
	movaps	%xmm5, %xmm3
.L908:
	addss	%xmm3, %xmm2
.L904:
	cmpl	$3, %ebx
	je	.L892
	movss	924(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L909
	movss	936(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L911
	je	.L1746
.L911:
	movss	948(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	940(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	944(%rsp), %xmm3
	mulss	952(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	932(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 948(%rsp)
	movaps	%xmm5, %xmm3
.L913:
	addss	%xmm3, %xmm2
.L909:
	cmpl	$4, %ebx
	je	.L892
	movss	956(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L914
	movss	968(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L916
	je	.L1747
.L916:
	movss	980(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	972(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	976(%rsp), %xmm3
	mulss	984(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	964(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 980(%rsp)
	movaps	%xmm5, %xmm3
.L918:
	addss	%xmm3, %xmm2
.L914:
	cmpl	$5, %ebx
	je	.L892
	movss	988(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L919
	movss	1000(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L921
	je	.L1748
.L921:
	movss	1012(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1004(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1008(%rsp), %xmm3
	mulss	1016(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	996(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1012(%rsp)
	movaps	%xmm5, %xmm3
.L923:
	addss	%xmm3, %xmm2
.L919:
	cmpl	$6, %ebx
	je	.L892
	movss	1020(%rsp), %xmm3
	comiss	%xmm7, %xmm3
	jbe	.L924
	movss	1032(%rsp), %xmm5
	ucomiss	%xmm7, %xmm5
	jp	.L926
	je	.L1749
.L926:
	movss	1044(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1036(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1040(%rsp), %xmm3
	mulss	1048(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1028(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1044(%rsp)
	movaps	%xmm5, %xmm3
.L928:
	addss	%xmm3, %xmm2
.L924:
	cmpl	$7, %ebx
	je	.L892
	movss	1052(%rsp), %xmm4
	pxor	%xmm3, %xmm3
	comiss	%xmm3, %xmm4
	jbe	.L929
	movss	1064(%rsp), %xmm5
	ucomiss	%xmm3, %xmm5
	jp	.L931
	je	.L933
.L931:
	movss	1076(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1068(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1072(%rsp), %xmm3
	mulss	1080(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1060(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1076(%rsp)
	movaps	%xmm5, %xmm3
.L933:
	addss	%xmm3, %xmm2
.L929:
	cmpl	$8, %ebx
	je	.L892
	movss	1084(%rsp), %xmm4
	pxor	%xmm3, %xmm3
	comiss	%xmm3, %xmm4
	jbe	.L934
	movss	1096(%rsp), %xmm5
	ucomiss	%xmm3, %xmm5
	jp	.L936
	je	.L938
.L936:
	movss	1108(%rsp), %xmm4
	mulss	%xmm1, %xmm5
	movss	1100(%rsp), %xmm3
	mulss	%xmm4, %xmm3
	subss	%xmm3, %xmm5
	movss	1104(%rsp), %xmm3
	mulss	1112(%rsp), %xmm3
	subss	%xmm3, %xmm5
	movaps	%xmm5, %xmm3
	mulss	1092(%rsp), %xmm5
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1108(%rsp)
	movaps	%xmm5, %xmm3
.L938:
	addss	%xmm3, %xmm2
.L934:
	cmpl	$9, %ebx
	je	.L892
	movss	1116(%rsp), %xmm3
	pxor	%xmm4, %xmm4
	comiss	%xmm4, %xmm3
	jbe	.L892
	movss	1128(%rsp), %xmm3
	ucomiss	%xmm4, %xmm3
	jp	.L1234
	je	.L1107
.L1234:
	movss	1140(%rsp), %xmm4
	mulss	%xmm3, %xmm1
	movss	1132(%rsp), %xmm5
	mulss	%xmm4, %xmm5
	subss	%xmm5, %xmm1
	movss	1144(%rsp), %xmm5
	mulss	1136(%rsp), %xmm5
	subss	%xmm5, %xmm1
	movaps	%xmm1, %xmm3
	mulss	1124(%rsp), %xmm1
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 1140(%rsp)
.L941:
	addss	%xmm1, %xmm2
.L892:
	mulss	.LC210(%rip), %xmm0
	addss	%xmm2, %xmm0
.L943:
	movl	88(%rsp), %eax
	testl	%eax, %eax
	je	.L976
	movss	.LC211(%rip), %xmm1
	mulss	2392(%rsp), %xmm1
	movss	%xmm0, 2392(%rsp)
	subss	%xmm1, %xmm0
.L976:
	movss	92(%rsp), %xmm1
	cmpl	%r12d, 96(%rsp)
	mulss	%xmm14, %xmm1
	mulss	%xmm1, %xmm0
	jg	.L977
	cmpb	$0, 151(%rsp)
	jne	.L1750
.L977:
	movq	120(%rsp), %rax
	movss	%xmm0, (%rax,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, 72(%rsp)
	jle	.L1657
.L978:
	movaps	%xmm12, %xmm11
	jmp	.L980
.L869:
	comiss	%xmm7, %xmm1
	jbe	.L883
	comiss	.LC206(%rip), %xmm12
	ja	.L872
.L883:
	pxor	%xmm3, %xmm3
	jmp	.L873
.L772:
	cmpl	$1, 76(%rsp)
	movss	152(%rsp), %xmm1
	jne	.L779
	movl	1256(%rsp), %eax
	testl	%eax, %eax
	je	.L1086
.L1670:
	movq	1248(%rsp), %rdx
	movss	(%rdx), %xmm4
	comiss	%xmm2, %xmm4
	jnb	.L783
	leal	-1(%rax), %ecx
	movslq	%eax, %r8
	subq	$1, %r8
	movl	%ecx, %eax
	imulq	$148, %r8, %r8
	comiss	(%rdx,%r8), %xmm2
	jnb	.L784
	testl	%ecx, %ecx
	jle	.L1088
	movq	%rdx, %r8
	xorl	%eax, %eax
.L788:
	comiss	(%r8), %xmm2
	jb	.L785
	movss	148(%r8), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1751
.L785:
	addl	$1, %eax
	addq	$148, %r8
	cmpl	%ecx, %eax
	jl	.L788
.L1088:
	xorl	%eax, %eax
.L784:
	movslq	%eax, %r9
	movslq	%ecx, %rax
	imulq	$148, %r9, %r9
	imulq	$148, %rax, %rax
	addq	%rdx, %r9
	addq	%rax, %rdx
	testl	%ebx, %ebx
	movss	(%r9), %xmm4
	movss	(%rdx), %xmm0
	jle	.L1021
	comiss	%xmm0, %xmm4
	movl	144(%r9), %r10d
	movl	144(%rdx), %r8d
	jnb	.L1019
	movaps	%xmm2, %xmm3
	subss	%xmm4, %xmm0
	testl	%r10d, %r10d
	subss	%xmm4, %xmm3
	je	.L1752
	movaps	%xmm3, %xmm5
	xorl	%eax, %eax
	movss	%xmm0, 112(%rsp)
	movd	%xmm3, %esi
	divss	%xmm0, %xmm5
	pxor	%xmm12, %xmm12
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	jmp	.L810
.L1754:
	movaps	%xmm6, %xmm13
	movaps	%xmm6, %xmm0
	cmpltss	%xmm5, %xmm13
	andps	%xmm13, %xmm0
	andnps	%xmm5, %xmm13
	orps	%xmm0, %xmm13
	mulss	%xmm13, %xmm4
	addss	%xmm4, %xmm14
.L812:
	subss	%xmm3, %xmm1
	testl	%r8d, %r8d
	movss	104(%r9,%rax,4), %xmm4
	movss	%xmm14, 0(%rbp,%rax,4)
	mulss	%xmm13, %xmm1
	addss	%xmm3, %xmm1
	movss	%xmm1, (%rdi,%rax,4)
	jne	.L809
	movaps	%xmm6, %xmm1
.L811:
	subss	%xmm4, %xmm1
	mulss	%xmm13, %xmm1
	addss	%xmm4, %xmm1
	movss	%xmm1, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L1753
.L810:
	comiss	%xmm5, %xmm12
	movss	4(%r9,%rax,4), %xmm14
	movss	4(%rdx,%rax,4), %xmm4
	movss	44(%r9,%rax,4), %xmm3
	subss	%xmm14, %xmm4
	movss	44(%rdx,%rax,4), %xmm1
	jbe	.L1754
	mulss	%xmm12, %xmm4
	pxor	%xmm13, %xmm13
	addss	%xmm4, %xmm14
	jmp	.L812
.L891:
	testl	%ebx, %ebx
	jle	.L944
	movss	828(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L945
	movss	840(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1236
	je	.L1108
.L1236:
	movss	852(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	844(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	848(%rsp), %xmm1
	mulss	856(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	836(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 852(%rsp)
	movaps	%xmm2, %xmm1
.L945:
	cmpl	$1, %ebx
	je	.L944
	movss	860(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L949
	movss	872(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1238
	je	.L1109
.L1238:
	movss	884(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	876(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	888(%rsp), %xmm1
	mulss	880(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	868(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 884(%rsp)
	movaps	%xmm2, %xmm1
.L949:
	cmpl	$2, %ebx
	je	.L944
	movss	892(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L952
	movss	904(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1240
	je	.L1110
.L1240:
	movss	916(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	908(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	912(%rsp), %xmm1
	mulss	920(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	900(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 916(%rsp)
	movaps	%xmm2, %xmm1
.L952:
	cmpl	$3, %ebx
	je	.L944
	movss	924(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L955
	movss	936(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1242
	je	.L1111
.L1242:
	movss	948(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	940(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	952(%rsp), %xmm1
	mulss	944(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	932(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 948(%rsp)
	movaps	%xmm2, %xmm1
.L955:
	cmpl	$4, %ebx
	je	.L944
	movss	956(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L958
	movss	968(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1244
	je	.L1112
.L1244:
	movss	980(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	972(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	976(%rsp), %xmm1
	mulss	984(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	964(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 980(%rsp)
	movaps	%xmm2, %xmm1
.L958:
	cmpl	$5, %ebx
	je	.L944
	movss	988(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L961
	movss	1000(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1246
	je	.L1113
.L1246:
	movss	1012(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1004(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1008(%rsp), %xmm1
	mulss	1016(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	996(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1012(%rsp)
	movaps	%xmm2, %xmm1
.L961:
	cmpl	$6, %ebx
	je	.L944
	movss	1020(%rsp), %xmm2
	comiss	%xmm7, %xmm2
	jbe	.L964
	movss	1032(%rsp), %xmm2
	ucomiss	%xmm7, %xmm2
	jp	.L1248
	je	.L1114
.L1248:
	movss	1044(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1036(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1040(%rsp), %xmm1
	mulss	1048(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1028(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1044(%rsp)
	movaps	%xmm2, %xmm1
.L964:
	cmpl	$7, %ebx
	je	.L944
	movss	1052(%rsp), %xmm3
	pxor	%xmm2, %xmm2
	comiss	%xmm2, %xmm3
	jbe	.L967
	movss	1064(%rsp), %xmm3
	ucomiss	%xmm2, %xmm3
	jp	.L1250
	je	.L1115
.L1250:
	movss	1076(%rsp), %xmm2
	mulss	%xmm3, %xmm1
	movss	1068(%rsp), %xmm3
	mulss	%xmm2, %xmm3
	subss	%xmm3, %xmm1
	movss	1072(%rsp), %xmm3
	mulss	1080(%rsp), %xmm3
	subss	%xmm3, %xmm1
	movaps	%xmm1, %xmm3
	mulss	1060(%rsp), %xmm1
	unpcklps	%xmm2, %xmm3
	movlps	%xmm3, 1076(%rsp)
.L967:
	cmpl	$8, %ebx
	je	.L944
	movss	1084(%rsp), %xmm2
	pxor	%xmm3, %xmm3
	comiss	%xmm3, %xmm2
	jbe	.L970
	movss	1096(%rsp), %xmm2
	ucomiss	%xmm3, %xmm2
	jp	.L1252
	je	.L1116
.L1252:
	movss	1108(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1100(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1104(%rsp), %xmm1
	mulss	1112(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1092(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1108(%rsp)
	movaps	%xmm2, %xmm1
.L970:
	cmpl	$9, %ebx
	je	.L944
	movss	1116(%rsp), %xmm2
	pxor	%xmm3, %xmm3
	comiss	%xmm3, %xmm2
	jbe	.L944
	movss	1128(%rsp), %xmm2
	ucomiss	%xmm3, %xmm2
	jp	.L1254
	je	.L1117
.L1254:
	movss	1140(%rsp), %xmm3
	mulss	%xmm1, %xmm2
	movss	1132(%rsp), %xmm1
	mulss	%xmm3, %xmm1
	subss	%xmm1, %xmm2
	movss	1144(%rsp), %xmm1
	mulss	1136(%rsp), %xmm1
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	mulss	1124(%rsp), %xmm2
	unpcklps	%xmm3, %xmm1
	movlps	%xmm1, 1140(%rsp)
	movaps	%xmm2, %xmm1
.L944:
	mulss	.LC60(%rip), %xmm0
	addss	%xmm1, %xmm0
	jmp	.L943
.L1644:
	movss	%xmm6, 132(%rsp)
	jmp	.L845
.L1740:
	cmpl	$1, %ebx
	je	.L1100
	movq	.LC205(%rip), %rax
	pxor	%xmm3, %xmm3
	movaps	%xmm3, %xmm2
	movl	%ebx, %edx
	movq	544(%rsp), %xmm4
	shrl	%edx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	496(%rsp), %xmm0
	cmpl	$1, %edx
	movq	%r8, 844(%rsp)
	movq	%xmm4, %xmm5
	movq	%r9, 876(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	448(%rsp), %xmm5
	movss	%xmm4, 192(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 868(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 828(%rsp)
	movss	192(%rsp), %xmm2
	movlps	%xmm5, 860(%rsp)
	movlps	%xmm2, 836(%rsp)
	je	.L853
	movq	552(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%ebp, %ebp
	xorl	%ecx, %ecx
	movq	504(%rsp), %xmm0
	cmpl	$2, %edx
	movq	%rbp, 908(%rsp)
	movq	%xmm4, %xmm5
	movq	%rcx, 940(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	456(%rsp), %xmm5
	movss	%xmm4, 192(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 932(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 892(%rsp)
	movss	192(%rsp), %xmm2
	movlps	%xmm5, 924(%rsp)
	movlps	%xmm2, 900(%rsp)
	je	.L853
	movq	560(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%esi, %esi
	xorl	%edi, %edi
	movq	512(%rsp), %xmm0
	cmpl	$3, %edx
	movq	%rsi, 972(%rsp)
	movq	%xmm4, %xmm5
	movq	%rdi, 1004(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	464(%rsp), %xmm5
	movss	%xmm4, 192(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 996(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 956(%rsp)
	movss	192(%rsp), %xmm2
	movlps	%xmm5, 988(%rsp)
	movlps	%xmm2, 964(%rsp)
	je	.L853
	movq	568(%rsp), %xmm4
	movaps	%xmm3, %xmm2
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	movq	520(%rsp), %xmm0
	cmpl	$4, %edx
	movq	%r10, 1036(%rsp)
	movq	%xmm4, %xmm5
	movq	%r11, 1068(%rsp)
	cmpltps	%xmm5, %xmm2
	movq	%rax, %xmm5
	andps	%xmm2, %xmm4
	andnps	%xmm5, %xmm2
	orps	%xmm2, %xmm4
	movq	472(%rsp), %xmm5
	movss	%xmm4, 192(%rsp)
	psrlq	$32, %xmm4
	movaps	%xmm5, %xmm2
	movlps	%xmm4, 1060(%rsp)
	unpcklps	%xmm0, %xmm5
	shufps	$78, %xmm5, %xmm5
	unpcklps	%xmm0, %xmm2
	movlps	%xmm2, 1020(%rsp)
	movss	192(%rsp), %xmm2
	movlps	%xmm5, 1052(%rsp)
	movlps	%xmm2, 1028(%rsp)
	je	.L853
	movq	576(%rsp), %xmm2
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	movq	%r8, 1100(%rsp)
	movq	%xmm2, %xmm4
	movq	%r9, 1132(%rsp)
	cmpltps	%xmm4, %xmm3
	movq	%rax, %xmm4
	andps	%xmm3, %xmm2
	andnps	%xmm4, %xmm3
	orps	%xmm2, %xmm3
	movq	480(%rsp), %xmm2
	movq	528(%rsp), %xmm4
	movss	%xmm3, 192(%rsp)
	psrlq	$32, %xmm3
	movaps	%xmm2, %xmm5
	movlps	%xmm3, 1124(%rsp)
	unpcklps	%xmm4, %xmm5
	movlps	%xmm5, 1084(%rsp)
	unpcklps	%xmm4, %xmm2
	movss	192(%rsp), %xmm5
	shufps	$78, %xmm2, %xmm2
	movlps	%xmm2, 1116(%rsp)
	movlps	%xmm5, 1092(%rsp)
.L853:
	movl	%ebx, %eax
	andl	$-2, %eax
	testb	$1, %bl
	je	.L849
.L852:
	cltq
	movss	544(%rsp,%rax,4), %xmm2
	comiss	%xmm7, %xmm2
	ja	.L855
	movaps	%xmm6, %xmm2
.L855:
	movq	64(%rsp), %rsi
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	movss	496(%rsp,%rax,4), %xmm4
	salq	$5, %rdx
	movss	448(%rsp,%rax,4), %xmm3
	unpcklps	%xmm4, %xmm3
	movlps	%xmm3, 28(%rsi,%rdx)
	movss	%xmm2, 836(%rsp,%rdx)
	movl	$0x00000000, 840(%rsp,%rdx)
	movq	%rcx, 44(%rsi,%rdx)
	jmp	.L849
.L1099:
	movaps	%xmm2, %xmm1
	jmp	.L847
.L1750:
	movl	72(%rsp), %edi
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2ssl	184(%rsp), %xmm2
	movl	%edi, %eax
	subl	%r12d, %eax
	cvtsi2ssl	%eax, %xmm1
	movq	120(%rsp), %rax
	divss	%xmm2, %xmm1
	mulss	%xmm0, %xmm1
	movss	%xmm1, (%rax,%r12,4)
	addq	$1, %r12
	cmpl	%r12d, %edi
	jg	.L978
	movl	296(%rsp), %ebp
	movq	%rax, %rsi
.L979:
	testl	%ebp, %ebp
	jne	.L1014
.L983:
	movss	.LC43(%rip), %xmm2
	xorl	%eax, %eax
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L993:
	movss	(%rsi,%rax,4), %xmm1
	movss	.LC99(%rip), %xmm5
	comiss	%xmm1, %xmm5
	ja	.L990
	movaps	%xmm2, %xmm0
	movaps	%xmm2, %xmm3
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm3
	andnps	%xmm1, %xmm0
	orps	%xmm3, %xmm0
	movss	%xmm0, (%rsi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, 72(%rsp)
	jg	.L993
.L992:
	movq	%r13, %rcx
	call	free
	movq	272(%rsp), %rcx
	call	free
	movq	280(%rsp), %rcx
	call	free
	cmpl	$0, 2380(%rsp)
	jne	.L1755
	movl	2368(%rsp), %eax
	cmpl	$2, %eax
	je	.L996
	ja	.L1013
.L1675:
	testl	%eax, %eax
	je	.L1756
	leaq	.LC216(%rip), %rdx
	movl	812(%rsp), %ebp
	leaq	1312(%rsp), %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1677
	movl	72(%rsp), %r15d
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$1179011410, 544(%rsp)
	call	fwrite
	movq	%rbx, %rcx
	leal	0(,%r15,4), %r12d
	leal	52(%r12), %edx
	call	w32
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$1163280727, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$544501094, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$18, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$3, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$1, 544(%rsp)
	call	fwrite
	movl	%ebp, %edx
	movq	%rbx, %rcx
	call	w32
	leal	0(,%rbp,4), %edx
	movq	%rbx, %rcx
	call	w32
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$4, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$32, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$0, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$1952670054, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$4, 544(%rsp)
	call	fwrite
	movl	%r15d, %edx
	movq	%rbx, %rcx
	call	w32
	leaq	544(%rsp), %rcx
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1635017060, 544(%rsp)
	movl	$1, %edx
	call	fwrite
	movl	%r12d, %edx
	movq	%rbx, %rcx
	call	w32
	jmp	.L1655
	.p2align 4,,10
	.p2align 3
.L990:
	movl	$0xbf800000, (%rsi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, 72(%rsp)
	jg	.L993
	jmp	.L992
.L889:
	movss	248(%rsp), %xmm0
	movss	252(%rsp), %xmm5
	mulss	%xmm2, %xmm0
	addss	224(%rsp), %xmm0
	mulss	%xmm7, %xmm2
	mulss	%xmm0, %xmm5
	movaps	%xmm2, %xmm4
	subss	%xmm5, %xmm4
	addss	204(%rsp), %xmm4
	movss	%xmm4, 224(%rsp)
	movss	264(%rsp), %xmm4
	mulss	%xmm0, %xmm4
	subss	%xmm4, %xmm2
	movss	%xmm2, 204(%rsp)
	jmp	.L890
.L1739:
	movslq	1280(%rsp), %rax
	movss	0(%r13,%rax,4), %xmm0
	movq	%rax, %rcx
	comiss	%xmm2, %xmm0
	jbe	.L814
	subl	$1, %ecx
	js	.L814
	xorl	%r8d, %r8d
	jmp	.L821
	.p2align 6
.L1757:
	leal	-1(%rax), %ecx
.L818:
	cmpl	%r8d, %ecx
	jl	.L814
.L821:
	leal	(%r8,%rcx), %edx
	movl	%edx, %eax
	shrl	$31, %eax
	addl	%edx, %eax
	sarl	%eax
	movslq	%eax, %rdi
	movss	0(%r13,%rdi,4), %xmm0
	comiss	%xmm2, %xmm0
	ja	.L1757
	comiss	4(%r13,%rdi,4), %xmm2
	jb	.L1641
	leal	1(%rax), %r8d
	jmp	.L818
.L1651:
	pxor	%xmm2, %xmm2
	jmp	.L893
.L1657:
	movl	296(%rsp), %ebp
	movq	120(%rsp), %rsi
	jmp	.L979
.L1738:
	cmpl	$1, 76(%rsp)
	je	.L1758
	movss	4(%r15), %xmm1
	jmp	.L779
.L814:
	testl	%ebx, %ebx
	jle	.L838
	cmpl	$2, 268(%rsp)
	jbe	.L1096
	movl	%ebx, %eax
	movss	.LC96(%rip), %xmm2
	movss	.LC61(%rip), %xmm1
	shrl	$2, %eax
	movss	.LC43(%rip), %xmm0
	subl	$1, %eax
	shufps	$0, %xmm2, %xmm2
	movaps	%xmm2, 448(%rsp)
	shufps	$0, %xmm1, %xmm1
	movaps	%xmm1, 496(%rsp)
	shufps	$0, %xmm0, %xmm0
	movaps	%xmm0, 544(%rsp)
	jne	.L1759
.L835:
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L838
.L834:
	movss	.LC96(%rip), %xmm1
	cltq
	movss	.LC61(%rip), %xmm0
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
.L837:
	movss	%xmm1, 0(%rbp,%rax,4)
	movss	%xmm0, (%rdi,%rax,4)
	movss	%xmm6, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L837
.L838:
	pxor	%xmm13, %xmm13
	movaps	%xmm6, %xmm14
	movaps	%xmm13, %xmm12
	movl	$0x00000000, 112(%rsp)
	movaps	%xmm13, %xmm1
	jmp	.L782
.L1742:
	movss	.LC207(%rip), %xmm2
	pxor	%xmm3, %xmm3
	comiss	%xmm1, %xmm2
	jbe	.L877
	divss	%xmm2, %xmm1
	movaps	%xmm6, %xmm3
	subss	%xmm1, %xmm3
	jmp	.L877
.L1720:
	movss	.LC207(%rip), %xmm2
	pxor	%xmm3, %xmm3
	comiss	%xmm1, %xmm2
	jbe	.L657
	divss	%xmm2, %xmm1
	movaps	%xmm6, %xmm3
	subss	%xmm1, %xmm3
	jmp	.L657
.L1715:
	movss	832(%rsp), %xmm0
	movss	%xmm0, 496(%rsp)
	jmp	.L543
.L1736:
	movss	832(%rsp), %xmm0
	movss	%xmm0, 496(%rsp)
	jmp	.L762
.L1632:
	movaps	%xmm6, %xmm3
	subss	%xmm2, %xmm1
	divss	.LC209(%rip), %xmm1
	subss	%xmm1, %xmm3
	jmp	.L661
.L1648:
	movaps	%xmm6, %xmm3
	subss	%xmm2, %xmm1
	divss	.LC209(%rip), %xmm1
	subss	%xmm1, %xmm3
	jmp	.L881
.L1743:
	pxor	%xmm2, %xmm2
	jmp	.L897
.L1108:
	pxor	%xmm1, %xmm1
	jmp	.L945
.L1721:
	pxor	%xmm2, %xmm2
	jmp	.L709
.L1069:
	pxor	%xmm1, %xmm1
	jmp	.L673
.L1716:
	movss	832(%rsp), %xmm0
	movss	%xmm0, 496(%rsp)
	movss	864(%rsp), %xmm0
	movss	%xmm0, 500(%rsp)
	jmp	.L543
.L1737:
	movss	832(%rsp), %xmm0
	movss	%xmm0, 496(%rsp)
	movss	864(%rsp), %xmm0
	movss	%xmm0, 500(%rsp)
	jmp	.L762
.L519:
	movl	1280(%rsp), %ebx
	testl	%ebx, %ebx
	jle	.L1044
	leal	1(%rbx), %ecx
	movslq	%ebx, %rbp
	imulq	$40, %rbp, %rbp
	movslq	%ecx, %rcx
	salq	$2, %rcx
	call	malloc
	movq	%rax, %r13
	movq	%rbp, %rcx
	call	malloc
	movq	%rbp, %rcx
	movq	%rax, 272(%rsp)
	call	malloc
	movq	1272(%rsp), %rdx
	movl	$0x00000000, 0(%r13)
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
.L525:
	imulq	$8100, %rax, %rcx
	movss	16(%rdx,%rcx), %xmm0
	addss	0(%r13,%rax,4), %xmm0
	movss	%xmm0, 4(%r13,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L525
	movq	64(%rsp), %rdx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	movq	272(%rsp), %rcx
	movq	280(%rsp), %r8
	jmp	.L526
.L529:
	movss	28(%rdx), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L527
	movss	.LC96(%rip), %xmm0
.L527:
	movss	%xmm0, (%rcx,%rax,4)
	movss	32(%rdx), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L528
	movss	.LC61(%rip), %xmm0
.L528:
	movss	%xmm0, (%r8,%rax,4)
	addq	$32, %rdx
	addq	$1, %rax
.L526:
	cmpl	%eax, %edi
	jg	.L529
	movq	272(%rsp), %rax
	leal	-1(%rbx), %r12d
	movq	%r13, 48(%rsp)
	xorl	%ebx, %ebx
	imulq	$8100, %r12, %r12
	movq	%rsi, 56(%rsp)
	leaq	40(%rax), %rbp
	movq	280(%rsp), %rax
	leaq	40(%rax), %rdi
	jmp	.L530
.L1761:
	movl	FORMANTS(%rip), %r14d
	testl	%r14d, %r14d
	jle	.L1661
	leaq	.LC187(%rip), %rdx
	movq	%rsi, %rcx
	call	strcmp
	movq	1272(%rsp), %r9
	testl	%eax, %eax
	leaq	(%r9,%rbx), %rsi
	je	.L533
	leaq	280(%rsi), %rdx
	movq	%rbp, %rcx
	leaq	0(,%r14,4), %r8
	call	memcpy
	leaq	320(%rsi), %rdx
	movq	%rdi, %rcx
	leaq	0(,%r14,4), %r8
	call	memcpy
	leaq	8100(%rbx), %rsi
.L534:
	addq	$40, %rbp
	addq	$40, %rdi
	movq	%rsi, %rbx
.L530:
	cmpq	%rbx, %r12
	je	.L1760
	movq	1272(%rsp), %rsi
	leaq	.LC186(%rip), %rdx
	addq	%rbx, %rsi
	movq	%rsi, %rcx
	call	*__imp__stricmp(%rip)
	testl	%eax, %eax
	jne	.L1761
	movl	FORMANTS(%rip), %r14d
	testl	%r14d, %r14d
	jle	.L1661
	movq	1272(%rsp), %r13
	leaq	8100(%rbx), %rsi
	addq	%rsi, %r13
.L1016:
	leaq	280(%r13), %rdx
	movl	%r14d, %ebx
	movq	%rbp, %rcx
	leaq	0(,%rbx,4), %r8
	call	memcpy
	leaq	320(%r13), %rdx
	movq	%rdi, %rcx
	leaq	0(,%rbx,4), %r8
	call	memcpy
	jmp	.L534
.L1711:
	movl	1280(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L507
	movq	1272(%rsp), %r9
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
.L508:
	imulq	$8100, %rax, %rdx
	addq	$1, %rax
	cmpl	%eax, %r8d
	addss	16(%r9,%rdx), %xmm1
	jg	.L508
	movss	.LC51(%rip), %xmm6
	divss	%xmm6, %xmm1
	addss	.LC182(%rip), %xmm1
	movaps	%xmm1, %xmm2
	maxss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	jmp	.L507
.L1713:
	cmpl	$0, 1280(%rsp)
	jle	.L536
	movq	1272(%rsp), %rax
	movss	8084(%rax), %xmm11
	movss	8088(%rax), %xmm9
	movss	8092(%rax), %xmm10
	jmp	.L537
.L1710:
	leaq	.LC114(%rip), %r8
	leaq	.LC115(%rip), %rdx
	leaq	.LC167(%rip), %rcx
	call	printf
	movl	800(%rsp), %eax
	testl	%eax, %eax
	jne	.L1762
	leaq	.LC86(%rip), %rdx
.L500:
	leaq	.LC168(%rip), %rcx
	call	printf
	cmpl	$0, 804(%rsp)
	jne	.L1040
	leaq	.LC89(%rip), %rdx
.L501:
	leaq	.LC169(%rip), %rcx
	call	printf
	movl	808(%rsp), %eax
	testl	%eax, %eax
	je	.L1041
	leaq	.LC92(%rip), %rdx
	subl	$1, %eax
	jne	.L502
	leaq	.LC91(%rip), %rdx
.L502:
	leaq	.LC170(%rip), %rcx
	pxor	%xmm6, %xmm6
	xorl	%ebx, %ebx
	call	printf
	movl	812(%rsp), %edx
	leaq	.LC171(%rip), %rcx
	call	printf
	leaq	.LC172(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	816(%rsp), %xmm1
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC173(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	820(%rsp), %xmm1
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC174(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	1196(%rsp), %xmm6
	cvtss2sd	1188(%rsp), %xmm1
	movq	%xmm6, %r9
	movq	%xmm1, %rdx
	pxor	%xmm6, %xmm6
	cvtss2sd	1192(%rsp), %xmm6
	movq	%r9, %xmm3
	movq	%xmm6, %r8
	movapd	%xmm6, %xmm2
	call	printf
	pxor	%xmm6, %xmm6
	leaq	.LC175(%rip), %rcx
	cvtss2sd	1204(%rsp), %xmm6
	pxor	%xmm1, %xmm1
	movq	%xmm6, %r8
	movapd	%xmm6, %xmm2
	cvtss2sd	1200(%rsp), %xmm1
	movq	%xmm1, %rdx
	pxor	%xmm6, %xmm6
	call	printf
	leaq	.LC176(%rip), %rcx
	pxor	%xmm1, %xmm1
	cvtss2sd	1212(%rsp), %xmm6
	cvtss2sd	1208(%rsp), %xmm1
	movq	%xmm6, %r8
	movapd	%xmm6, %xmm2
	movq	%xmm1, %rdx
	call	printf
	leaq	.LC177(%rip), %rcx
	call	puts
	movq	64(%rsp), %rdi
	movq	%rdi, %rsi
	jmp	.L503
.L504:
	addq	$32, %rsi
	pxor	%xmm6, %xmm6
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	cvtss2sd	(%rsi), %xmm6
	movq	%xmm6, %r9
	cvtss2sd	344(%rdi,%rbx,4), %xmm0
	pxor	%xmm6, %xmm6
	movq	%r9, %xmm3
	cvtss2sd	-4(%rsi), %xmm6
	movsd	%xmm0, 32(%rsp)
	movq	%xmm6, %r8
	leaq	.LC178(%rip), %rcx
	movapd	%xmm6, %xmm2
	call	printf
.L503:
	addq	$1, %rbx
	leal	-1(%rbx), %eax
	cmpl	%eax, FORMANTS(%rip)
	jg	.L504
	leaq	1312(%rsp), %rdx
	leaq	.LC179(%rip), %rcx
	call	printf
	leaq	.LC180(%rip), %rcx
	call	puts
	cmpl	$0, 2380(%rsp)
	je	.L499
	leaq	.LC181(%rip), %rcx
	call	puts
	jmp	.L499
.L1714:
	testl	%ebp, %ebp
	je	.L992
.L1014:
	movl	72(%rsp), %edx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.L984
	.p2align 5
.L985:
	movss	(%rsi,%rax,4), %xmm0
	andps	.LC212(%rip), %xmm0
	maxss	%xmm1, %xmm0
	addq	$1, %rax
	movaps	%xmm0, %xmm1
.L984:
	cmpl	%eax, %edx
	jg	.L985
	comiss	.LC213(%rip), %xmm1
	jbe	.L986
	movss	.LC214(%rip), %xmm2
	xorl	%eax, %eax
	movl	72(%rsp), %edx
	divss	%xmm1, %xmm2
	jmp	.L988
	.p2align 5
.L989:
	movss	(%rsi,%rax,4), %xmm0
	mulss	%xmm2, %xmm0
	movss	%xmm0, (%rsi,%rax,4)
	addq	$1, %rax
.L988:
	cmpl	%eax, %edx
	jg	.L989
.L986:
	cmpl	$0, 228(%rsp)
	jg	.L983
	jmp	.L992
.L1744:
	pxor	%xmm3, %xmm3
	jmp	.L903
.L1109:
	pxor	%xmm1, %xmm1
	jmp	.L949
.L1070:
	pxor	%xmm1, %xmm1
	jmp	.L677
.L1722:
	pxor	%xmm3, %xmm3
	jmp	.L715
.L1656:
	movl	320(%rsp), %edi
	movl	308(%rsp), %r14d
	movl	192(%rsp), %r11d
	movl	324(%rsp), %ebp
	movq	328(%rsp), %rcx
	movq	184(%rsp), %rsi
.L758:
	cmpl	%edi, 72(%rsp)
	jg	.L538
	jmp	.L979
.L1755:
	movl	72(%rsp), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ssl	812(%rsp), %xmm1
	leaq	.LC215(%rip), %rcx
	pxor	%xmm6, %xmm6
	cvtsi2ssl	%edx, %xmm0
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm6
	movq	%xmm6, %r8
	movapd	%xmm6, %xmm2
	call	printf
	movl	2368(%rsp), %eax
	cmpl	$2, %eax
	je	.L996
	jbe	.L1675
	cmpl	$3, %eax
	jne	.L1001
.L1000:
	leaq	1312(%rsp), %rcx
	leaq	.LC216(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1676
.L1655:
	movq	312(%rsp), %r8
	movq	%rbx, %r9
	movl	$4, %edx
	movq	%rsi, %rcx
	call	fwrite
.L1678:
	movq	%rbx, %rcx
	call	fclose
.L1001:
	cmpl	$0, 2380(%rsp)
	je	.L1012
	leaq	1312(%rsp), %rdx
	leaq	.LC234(%rip), %rcx
	call	printf
.L1012:
	movq	%rsi, %rcx
	call	free
	movq	1248(%rsp), %rcx
	call	free
	movq	1272(%rsp), %rcx
	call	free
	movq	1232(%rsp), %rcx
	call	free
	jmp	.L322
.L1071:
	pxor	%xmm1, %xmm1
	jmp	.L680
.L1110:
	pxor	%xmm1, %xmm1
	jmp	.L952
.L1745:
	pxor	%xmm3, %xmm3
	jmp	.L908
.L1723:
	pxor	%xmm3, %xmm3
	jmp	.L720
.L1704:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movl	$10, %r9d
	movl	%ebx, %r8d
	leaq	.LC165(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L564:
	testl	%ebx, %ebx
	jle	.L1763
	movl	144(%rdx), %r10d
	movq	%rdx, %r9
.L573:
	movq	216(%rsp), %rsi
	leaq	4(%r9), %rdx
	movss	%xmm2, 160(%rsp)
	leaq	448(%rsp), %rbp
	movl	%r10d, 120(%rsp)
	movq	%rbp, %rcx
	movq	%r9, 112(%rsp)
	movq	%rsi, %r8
	call	memcpy
	movq	112(%rsp), %r9
	leaq	496(%rsp), %rcx
	movq	%rsi, %r8
	leaq	44(%r9), %rdx
	call	memcpy
	movq	112(%rsp), %r9
	xorl	%eax, %eax
	movl	120(%rsp), %r10d
	leaq	544(%rsp), %rcx
	movss	160(%rsp), %xmm2
.L588:
	testl	%r10d, %r10d
	movaps	%xmm6, %xmm0
	je	.L587
	movss	104(%r9,%rax,4), %xmm0
.L587:
	movss	%xmm0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L588
	movss	92(%r9), %xmm4
	movss	84(%r9), %xmm13
	movss	%xmm4, 112(%rsp)
	movss	100(%r9), %xmm4
	movss	88(%r9), %xmm12
	movss	96(%r9), %xmm1
	movss	%xmm4, 120(%rsp)
.L571:
	testq	%r15, %r15
	je	.L563
	movl	1240(%rsp), %edx
	testl	%edx, %edx
	jle	.L563
.L1683:
	movss	(%r15), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1667
.L1628:
	movq	%r15, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm1
	jmp	.L563
.L783:
	testl	%ebx, %ebx
	jle	.L1764
	movl	144(%rdx), %r10d
	movq	%rdx, %r9
.L1019:
	movq	160(%rsp), %rsi
	leaq	4(%r9), %rdx
	movss	%xmm2, 192(%rsp)
	leaq	448(%rsp), %rbp
	movl	%r10d, 132(%rsp)
	movq	%rbp, %rcx
	movq	%r9, 112(%rsp)
	movq	%rsi, %r8
	call	memcpy
	movq	112(%rsp), %r9
	leaq	496(%rsp), %rcx
	movq	%rsi, %r8
	leaq	44(%r9), %rdx
	call	memcpy
	movl	132(%rsp), %r10d
	xorl	%eax, %eax
	movq	112(%rsp), %r9
	leaq	544(%rsp), %rcx
	movss	192(%rsp), %xmm2
	jmp	.L796
	.p2align 5
.L1766:
	movaps	%xmm6, %xmm0
.L798:
	movss	%xmm0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L1765
.L796:
	testl	%r10d, %r10d
	je	.L1766
	movss	104(%r9,%rax,4), %xmm0
	jmp	.L798
.L662:
	movl	g_noise_state(%rip), %edx
	pxor	%xmm3, %xmm3
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm3
	movl	%eax, g_noise_state(%rip)
	mulss	.LC203(%rip), %xmm3
	mulss	.LC200(%rip), %xmm3
	jmp	.L657
.L882:
	movl	g_noise_state(%rip), %edx
	pxor	%xmm3, %xmm3
	movl	%edx, %eax
	sall	$13, %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	shrl	$17, %edx
	xorl	%eax, %edx
	movl	%edx, %eax
	sall	$5, %eax
	xorl	%edx, %eax
	cvtsi2ssl	%eax, %xmm3
	movl	%eax, g_noise_state(%rip)
	mulss	.LC203(%rip), %xmm3
	mulss	.LC200(%rip), %xmm3
	jmp	.L877
.L1724:
	pxor	%xmm3, %xmm3
	jmp	.L725
.L1072:
	pxor	%xmm1, %xmm1
	jmp	.L683
.L1111:
	pxor	%xmm1, %xmm1
	jmp	.L955
.L1746:
	pxor	%xmm3, %xmm3
	jmp	.L913
.L1700:
	movss	40(%rax), %xmm0
	movss	%xmm0, 832(%rsp)
	jmp	.L447
.L1759:
	movaps	%xmm2, 464(%rsp)
	movaps	%xmm1, 512(%rsp)
	movaps	%xmm0, 560(%rsp)
	jmp	.L835
.L1735:
	movaps	%xmm2, 464(%rsp)
	movaps	%xmm1, 512(%rsp)
	movaps	%xmm0, 560(%rsp)
	jmp	.L614
.L1705:
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1176(%rsp)
	jmp	.L483
.L1701:
	movss	44(%rax), %xmm0
	movss	%xmm0, 864(%rsp)
	jmp	.L450
.L1706:
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1180(%rsp)
	jmp	.L485
.L1697:
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC89(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L357
	xorl	%edx, %edx
	movl	%edx, 804(%rsp)
	jmp	.L332
.L1702:
	movss	48(%rax), %xmm0
	movss	%xmm0, 896(%rsp)
	jmp	.L452
.L1698:
	movl	FORMANTS(%rip), %ebx
	jmp	.L438
.L1707:
	movss	.LC43(%rip), %xmm0
	movss	%xmm0, 1184(%rsp)
	jmp	.L487
.L1762:
	leaq	.LC88(%rip), %rdx
	subl	$1, %eax
	jne	.L500
	leaq	.LC87(%rip), %rdx
	jmp	.L500
.L1699:
	leaq	g_preset_natural(%rip), %rax
	jmp	.L435
.L574:
	movaps	%xmm4, %xmm5
	xorl	%eax, %eax
	movss	%xmm2, 112(%rsp)
	pxor	%xmm12, %xmm12
	divss	%xmm3, %xmm5
	movss	%xmm3, 120(%rsp)
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	jmp	.L586
.L1767:
	movaps	%xmm0, %xmm1
	mulss	%xmm12, %xmm1
	addss	%xmm1, %xmm4
	pxor	%xmm1, %xmm1
.L585:
	subss	%xmm13, %xmm3
	testl	%r8d, %r8d
	movss	%xmm4, 0(%rbp,%rax,4)
	movss	104(%r9,%rax,4), %xmm4
	movaps	%xmm3, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm13, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	movaps	%xmm6, %xmm0
	je	.L584
	movss	104(%rdx,%rax,4), %xmm0
.L584:
	subss	%xmm4, %xmm0
	mulss	%xmm1, %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L1679
.L586:
	comiss	%xmm5, %xmm12
	movss	4(%r9,%rax,4), %xmm4
	movss	4(%rdx,%rax,4), %xmm0
	movss	44(%r9,%rax,4), %xmm13
	subss	%xmm4, %xmm0
	movss	44(%rdx,%rax,4), %xmm3
	ja	.L1767
	movaps	%xmm6, %xmm1
	movaps	%xmm6, %xmm2
	cmpltss	%xmm5, %xmm1
	andps	%xmm1, %xmm2
	andnps	%xmm5, %xmm1
	orps	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	addss	%xmm0, %xmm4
	jmp	.L585
.L1752:
	movaps	%xmm3, %xmm4
	xorl	%eax, %eax
	movss	%xmm2, 112(%rsp)
	pxor	%xmm12, %xmm12
	divss	%xmm0, %xmm4
	movss	%xmm0, 132(%rsp)
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	jmp	.L803
.L1769:
	mulss	%xmm12, %xmm1
	testl	%r8d, %r8d
	addss	%xmm5, %xmm1
	movss	%xmm1, 0(%rbp,%rax,4)
	movaps	%xmm0, %xmm1
	subss	%xmm14, %xmm1
	mulss	%xmm12, %xmm1
	addss	%xmm14, %xmm1
	movss	%xmm1, (%rdi,%rax,4)
	jne	.L802
	movaps	%xmm6, %xmm1
	pxor	%xmm5, %xmm5
.L805:
	subss	%xmm6, %xmm1
	mulss	%xmm5, %xmm1
	addss	%xmm6, %xmm1
	movss	%xmm1, (%rcx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jle	.L1768
.L803:
	comiss	%xmm4, %xmm12
	movss	4(%r9,%rax,4), %xmm5
	movss	4(%rdx,%rax,4), %xmm1
	movss	44(%r9,%rax,4), %xmm14
	subss	%xmm5, %xmm1
	movss	44(%rdx,%rax,4), %xmm0
	ja	.L1769
	movaps	%xmm6, %xmm13
	movaps	%xmm6, %xmm2
	testl	%r8d, %r8d
	cmpltss	%xmm4, %xmm13
	andps	%xmm13, %xmm2
	andnps	%xmm4, %xmm13
	orps	%xmm2, %xmm13
	mulss	%xmm13, %xmm1
	addss	%xmm5, %xmm1
	movss	%xmm1, 0(%rbp,%rax,4)
	movaps	%xmm0, %xmm1
	subss	%xmm14, %xmm1
	mulss	%xmm13, %xmm1
	addss	%xmm14, %xmm1
	movss	%xmm1, (%rdi,%rax,4)
	movaps	%xmm6, %xmm1
	je	.L806
	movss	104(%rdx,%rax,4), %xmm1
.L806:
	movaps	%xmm6, %xmm5
	movaps	%xmm6, %xmm13
	cmpltss	%xmm4, %xmm5
	andps	%xmm5, %xmm13
	andnps	%xmm4, %xmm5
	orps	%xmm13, %xmm5
	jmp	.L805
.L1703:
	movss	52(%rax), %xmm0
	movss	%xmm0, 928(%rsp)
	jmp	.L454
.L1117:
	pxor	%xmm1, %xmm1
	jmp	.L944
.L1107:
	pxor	%xmm1, %xmm1
	jmp	.L941
.L1080:
	pxor	%xmm1, %xmm1
	jmp	.L753
.L1078:
	pxor	%xmm1, %xmm1
	jmp	.L672
.L1763:
	movaps	%xmm0, %xmm3
	movq	%rdx, %r9
.L1023:
	movss	92(%r9), %xmm4
	comiss	%xmm3, %xmm0
	movss	84(%r9), %xmm13
	movss	%xmm4, 112(%rsp)
	movss	100(%r9), %xmm4
	movss	88(%r9), %xmm12
	movss	96(%r9), %xmm1
	movss	%xmm4, 120(%rsp)
	jnb	.L571
	movaps	%xmm2, %xmm4
	subss	%xmm0, %xmm3
	subss	%xmm0, %xmm4
	movd	%xmm4, %r10d
.L572:
	movd	%r10d, %xmm0
	movss	84(%rdx), %xmm4
	divss	%xmm3, %xmm0
	pxor	%xmm3, %xmm3
	comiss	%xmm0, %xmm3
	ja	.L590
	movaps	%xmm6, %xmm3
	movaps	%xmm6, %xmm5
	cmpltss	%xmm0, %xmm3
	andps	%xmm3, %xmm5
	andnps	%xmm0, %xmm3
	orps	%xmm5, %xmm3
.L590:
	subss	%xmm13, %xmm4
	movaps	%xmm4, %xmm0
	movss	112(%rsp), %xmm4
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm13
	movss	88(%rdx), %xmm0
	subss	%xmm12, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm12
	movss	92(%rdx), %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	120(%rsp), %xmm4
	movss	%xmm0, 112(%rsp)
	movss	96(%rdx), %xmm0
	subss	%xmm1, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm1
	movss	100(%rdx), %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, 120(%rsp)
	jmp	.L571
.L1764:
	movaps	%xmm4, %xmm0
	movq	%rdx, %r9
.L1021:
	comiss	%xmm0, %xmm4
	movss	92(%r9), %xmm5
	movss	84(%r9), %xmm12
	movss	88(%r9), %xmm13
	movss	%xmm5, 112(%rsp)
	movss	96(%r9), %xmm1
	movss	100(%r9), %xmm14
	jnb	.L790
	movaps	%xmm2, %xmm3
	subss	%xmm4, %xmm0
	subss	%xmm4, %xmm3
.L1018:
	movaps	%xmm3, %xmm4
	movss	84(%rdx), %xmm5
	divss	%xmm0, %xmm4
	pxor	%xmm0, %xmm0
	comiss	%xmm4, %xmm0
	ja	.L791
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm3
	cmpltss	%xmm4, %xmm0
	andps	%xmm0, %xmm3
	andnps	%xmm4, %xmm0
	orps	%xmm3, %xmm0
.L791:
	subss	%xmm12, %xmm5
	movaps	%xmm5, %xmm3
	movss	112(%rsp), %xmm5
	mulss	%xmm0, %xmm3
	addss	%xmm3, %xmm12
	movss	88(%rdx), %xmm3
	subss	%xmm13, %xmm3
	mulss	%xmm0, %xmm3
	addss	%xmm3, %xmm13
	movss	92(%rdx), %xmm3
	subss	%xmm5, %xmm3
	mulss	%xmm0, %xmm3
	addss	%xmm5, %xmm3
	movss	%xmm3, 112(%rsp)
	movss	96(%rdx), %xmm3
	subss	%xmm1, %xmm3
	mulss	%xmm0, %xmm3
	addss	%xmm3, %xmm1
	movss	100(%rdx), %xmm3
	subss	%xmm14, %xmm3
	mulss	%xmm3, %xmm0
	addss	%xmm0, %xmm14
.L790:
	testq	%r15, %r15
	je	.L782
	movl	1240(%rsp), %edx
	testl	%edx, %edx
	jle	.L782
.L1687:
	movss	(%r15), %xmm0
	comiss	%xmm2, %xmm0
	jnb	.L1672
.L1643:
	movq	%r15, %rcx
	call	contour_f0.part.0
	movaps	%xmm0, %xmm1
	jmp	.L782
.L996:
	leaq	1312(%rsp), %rcx
	leaq	.LC216(%rip), %rdx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rdi
	je	.L1676
	movl	72(%rsp), %ebp
	xorl	%ebx, %ebx
	movss	.LC43(%rip), %xmm7
	movss	.LC226(%rip), %xmm6
	jmp	.L1009
.L1011:
	movss	(%rsi,%rbx,4), %xmm1
	movss	.LC99(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L1010
	movaps	%xmm7, %xmm0
	movaps	%xmm7, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L1010:
	mulss	%xmm6, %xmm0
	movq	%rdi, %r9
	movl	$2, %r8d
	leaq	544(%rsp), %rcx
	movl	$1, %edx
	addq	$1, %rbx
	cvttss2sil	%xmm0, %eax
	movw	%ax, 544(%rsp)
	call	fwrite
.L1009:
	cmpl	%ebx, %ebp
	jg	.L1011
	movq	%rdi, %rcx
	call	fclose
	jmp	.L1001
.L809:
	movss	104(%rdx,%rax,4), %xmm1
	jmp	.L811
.L1679:
	movss	92(%r9), %xmm4
	movss	112(%rsp), %xmm2
	movss	%xmm4, 112(%rsp)
	movss	100(%r9), %xmm4
	movss	120(%rsp), %xmm3
	movss	84(%r9), %xmm13
	movss	%xmm4, 120(%rsp)
	movss	88(%r9), %xmm12
	movss	96(%r9), %xmm1
	jmp	.L572
.L1054:
	movaps	%xmm6, %xmm0
	pxor	%xmm1, %xmm1
	jmp	.L578
.L802:
	movss	104(%rdx,%rax,4), %xmm1
	pxor	%xmm5, %xmm5
	jmp	.L805
.L1641:
	addl	$1, %edx
	jl	.L814
	imulq	$8100, %rdi, %rsi
	movaps	%xmm2, %xmm1
	movaps	%xmm6, %xmm0
	movss	%xmm2, 132(%rsp)
	addq	1272(%rsp), %rsi
	subss	0(%r13,%rdi,4), %xmm1
	movss	16(%rsi), %xmm3
	movaps	%xmm1, %xmm5
	movq	%rsi, %rcx
	cmpltss	%xmm3, %xmm0
	andps	%xmm0, %xmm3
	andnps	%xmm6, %xmm0
	orps	%xmm3, %xmm0
	divss	%xmm0, %xmm5
	call	phon_pitch
	pxor	%xmm3, %xmm3
	movss	136(%rsp), %xmm12
	movss	8092(%rsi), %xmm4
	movaps	%xmm0, %xmm1
	movss	8084(%rsi), %xmm0
	movl	8096(%rsi), %eax
	movss	%xmm4, 112(%rsp)
	movss	8088(%rsi), %xmm13
	mulss	%xmm0, %xmm12
	movss	132(%rsp), %xmm2
	comiss	%xmm5, %xmm3
	ja	.L822
	movaps	%xmm6, %xmm3
	xorl	%ebp, %ebp
	movaps	%xmm6, %xmm4
	cmpltss	%xmm5, %xmm3
	testl	%eax, %eax
	movl	%ebp, 156(%rsp)
	andps	%xmm3, %xmm4
	andnps	%xmm5, %xmm3
	orps	%xmm4, %xmm3
	jle	.L823
	movss	.LC196(%rip), %xmm5
	comiss	%xmm3, %xmm5
	ja	.L824
	movss	.LC197(%rip), %xmm4
	comiss	%xmm3, %xmm4
	jbe	.L1642
	movaps	%xmm3, %xmm0
	pxor	%xmm13, %xmm13
	movaps	%xmm13, %xmm12
	movss	%xmm2, 192(%rsp)
	movss	%xmm3, 132(%rsp)
	subss	%xmm5, %xmm0
	divss	.LC198(%rip), %xmm0
	mulss	.LC189(%rip), %xmm0
	call	sinf
	mulss	.LC199(%rip), %xmm0
	movaps	%xmm13, %xmm1
	movl	$1, 156(%rsp)
	movss	132(%rsp), %xmm3
	movss	192(%rsp), %xmm2
	movss	%xmm0, 112(%rsp)
.L823:
	testl	%ebx, %ebx
	jle	.L832
	imulq	$40, %rdi, %rdx
	movq	272(%rsp), %rax
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	leaq	(%rax,%rdx), %r9
	addq	280(%rsp), %rdx
	xorl	%eax, %eax
.L831:
	movss	(%r9,%rax,4), %xmm4
	movss	280(%rsi,%rax,4), %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	(%rdx,%rax,4), %xmm4
	movss	%xmm0, 0(%rbp,%rax,4)
	movss	320(%rsi,%rax,4), %xmm0
	movss	%xmm6, (%rcx,%rax,4)
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L831
.L832:
	testq	%r15, %r15
	je	.L1093
	movl	1240(%rsp), %edx
	movaps	%xmm6, %xmm14
	testl	%edx, %edx
	jg	.L1687
	jmp	.L782
.L1073:
	pxor	%xmm1, %xmm1
	jmp	.L686
.L1112:
	pxor	%xmm1, %xmm1
	jmp	.L958
.L1625:
	addl	$1, %edx
	jl	.L592
	imulq	$8100, %rdi, %r8
	movaps	%xmm2, %xmm1
	movaps	%xmm6, %xmm0
	movss	%xmm2, 120(%rsp)
	addq	1272(%rsp), %r8
	subss	0(%r13,%rdi,4), %xmm1
	movss	16(%r8), %xmm3
	movaps	%xmm1, %xmm5
	movq	%r8, %rcx
	movq	%r8, 112(%rsp)
	cmpltss	%xmm3, %xmm0
	andps	%xmm0, %xmm3
	andnps	%xmm6, %xmm0
	orps	%xmm3, %xmm0
	divss	%xmm0, %xmm5
	call	phon_pitch
	pxor	%xmm3, %xmm3
	movq	%rcx, %r8
	movss	136(%rsp), %xmm13
	movss	8092(%rcx), %xmm4
	movaps	%xmm0, %xmm1
	movss	8084(%rcx), %xmm0
	movl	8096(%rcx), %eax
	movss	%xmm4, 112(%rsp)
	mulss	%xmm0, %xmm13
	movss	120(%rsp), %xmm2
	movss	8088(%rcx), %xmm12
	comiss	%xmm5, %xmm3
	ja	.L600
	movaps	%xmm6, %xmm3
	xorl	%edx, %edx
	movaps	%xmm6, %xmm4
	cmpltss	%xmm5, %xmm3
	testl	%eax, %eax
	movl	%edx, 156(%rsp)
	andps	%xmm3, %xmm4
	andnps	%xmm5, %xmm3
	orps	%xmm4, %xmm3
	jle	.L601
	movss	.LC196(%rip), %xmm4
	comiss	%xmm3, %xmm4
	ja	.L1015
	movss	.LC197(%rip), %xmm5
	comiss	%xmm3, %xmm5
	jbe	.L1627
	movaps	%xmm3, %xmm0
	movss	%xmm3, 120(%rsp)
	pxor	%xmm12, %xmm12
	movaps	%xmm12, %xmm13
	subss	%xmm4, %xmm0
	divss	.LC198(%rip), %xmm0
	mulss	.LC189(%rip), %xmm0
	movss	%xmm2, 160(%rsp)
	movq	%rcx, 256(%rsp)
	call	sinf
	movss	120(%rsp), %xmm3
	movaps	%xmm12, %xmm1
	movl	$1, 156(%rsp)
	mulss	.LC199(%rip), %xmm0
	movq	256(%rsp), %r8
	movss	160(%rsp), %xmm2
	movss	%xmm0, 112(%rsp)
.L601:
	testl	%ebx, %ebx
	jle	.L610
	imulq	$40, %rdi, %rdx
	movq	272(%rsp), %rax
	leaq	544(%rsp), %rcx
	leaq	448(%rsp), %rbp
	leaq	496(%rsp), %rdi
	leaq	(%rax,%rdx), %r9
	addq	280(%rsp), %rdx
	xorl	%eax, %eax
.L609:
	movss	(%r9,%rax,4), %xmm4
	movss	280(%r8,%rax,4), %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	(%rdx,%rax,4), %xmm4
	movss	%xmm0, 0(%rbp,%rax,4)
	movss	320(%r8,%rax,4), %xmm0
	movss	%xmm6, (%rcx,%rax,4)
	subss	%xmm4, %xmm0
	mulss	%xmm3, %xmm0
	addss	%xmm4, %xmm0
	movss	%xmm0, (%rdi,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L609
.L610:
	testq	%r15, %r15
	je	.L1665
	movl	1240(%rsp), %edx
	movss	%xmm6, 120(%rsp)
	testl	%edx, %edx
	jg	.L1683
	jmp	.L563
.L1747:
	pxor	%xmm3, %xmm3
	jmp	.L918
.L1725:
	pxor	%xmm3, %xmm3
	jmp	.L730
.L780:
	movl	1256(%rsp), %eax
	testl	%eax, %eax
	jne	.L1670
	movss	140(%rsp), %xmm4
	movaps	%xmm6, %xmm14
	movss	136(%rsp), %xmm12
	movss	144(%rsp), %xmm13
	movss	%xmm4, 112(%rsp)
	jmp	.L1643
.L1105:
	pxor	%xmm2, %xmm2
	jmp	.L892
.L560:
	movslq	1256(%rsp), %rcx
	testl	%ecx, %ecx
	jne	.L1663
	movss	140(%rsp), %xmm4
	movss	%xmm6, 120(%rsp)
	movss	144(%rsp), %xmm12
	movss	136(%rsp), %xmm13
	movss	%xmm4, 112(%rsp)
	jmp	.L1628
.L1708:
	leaq	1248(%rsp), %rdx
	leaq	1824(%rsp), %rcx
	call	spec_parse
	addl	$1, %eax
	je	.L330
	movl	1260(%rsp), %eax
	cmpl	$22050, %eax
	je	.L491
	movl	%eax, 812(%rsp)
.L491:
	movl	1264(%rsp), %eax
	testl	%eax, %eax
	je	.L492
	movl	%eax, 804(%rsp)
.L492:
	movss	.LC51(%rip), %xmm6
	movss	1268(%rsp), %xmm0
	divss	%xmm6, %xmm0
	addss	.LC84(%rip), %xmm0
	comiss	816(%rsp), %xmm0
	jbe	.L494
	movss	%xmm0, 816(%rsp)
	jmp	.L494
.L1726:
	pxor	%xmm3, %xmm3
	jmp	.L735
.L1113:
	pxor	%xmm1, %xmm1
	jmp	.L961
.L1748:
	pxor	%xmm3, %xmm3
	jmp	.L923
.L1074:
	pxor	%xmm1, %xmm1
	jmp	.L689
.L1013:
	cmpl	$3, %eax
	je	.L1000
	jmp	.L1012
.L1756:
	leaq	.LC216(%rip), %rdx
	movl	812(%rsp), %ebp
	leaq	1312(%rsp), %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.L1677
	movq	%rax, %r9
	movl	$4, %r8d
	movl	$1, %edx
	movl	$1179011410, 544(%rsp)
	leaq	544(%rsp), %rcx
	call	fwrite
	movl	72(%rsp), %r15d
	movq	%rbx, %rcx
	leal	36(%r15,%r15), %edx
	movl	%r15d, %r12d
	call	w32
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$1163280727, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$544501094, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$16, 544(%rsp)
	call	fwrite
	movzwl	.LC222(%rip), %r13d
	movq	%rbx, %r9
	movl	$2, %r8d
	leaq	544(%rsp), %rcx
	movl	$1, %edx
	movw	%r13w, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	%r13w, 544(%rsp)
	call	fwrite
	movl	%ebp, %edx
	movq	%rbx, %rcx
	call	w32
	leal	(%rbp,%rbp), %edx
	movq	%rbx, %rcx
	xorl	%ebp, %ebp
	call	w32
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$2, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movw	$16, 544(%rsp)
	call	fwrite
	movq	%rbx, %r9
	movl	$4, %r8d
	movl	$1, %edx
	leaq	544(%rsp), %rcx
	movl	$1635017060, 544(%rsp)
	call	fwrite
	leal	(%r15,%r15), %edx
	movq	%rbx, %rcx
	call	w32
	movss	.LC43(%rip), %xmm7
	movss	.LC226(%rip), %xmm6
	jmp	.L1004
.L1006:
	movss	(%rsi,%rbp,4), %xmm1
	movss	.LC99(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L1005
	movaps	%xmm7, %xmm0
	movaps	%xmm7, %xmm2
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L1005:
	mulss	%xmm6, %xmm0
	movq	%rbx, %r9
	movl	$2, %r8d
	movl	$1, %edx
	addq	$1, %rbp
	leaq	544(%rsp), %rcx
	cvttss2sil	%xmm0, %eax
	movw	%ax, 544(%rsp)
	call	fwrite
.L1004:
	cmpl	%ebp, %r12d
	jg	.L1006
	jmp	.L1678
.L1727:
	pxor	%xmm3, %xmm3
	jmp	.L740
.L1114:
	pxor	%xmm1, %xmm1
	jmp	.L964
.L1749:
	pxor	%xmm3, %xmm3
	jmp	.L928
.L1075:
	pxor	%xmm1, %xmm1
	jmp	.L692
.L1709:
	leaq	1272(%rsp), %rdx
	leaq	1824(%rsp), %rcx
	call	phoneme_parse
	addl	$1, %eax
	je	.L330
	movl	1284(%rsp), %eax
	cmpl	$22050, %eax
	je	.L497
	movl	%eax, 812(%rsp)
.L497:
	movl	1288(%rsp), %eax
	testl	%eax, %eax
	je	.L494
	movl	%eax, 804(%rsp)
	jmp	.L494
.L1035:
	leaq	g_preset_whisper(%rip), %rax
	jmp	.L435
.L1765:
	movss	92(%r9), %xmm4
	movss	84(%r9), %xmm12
	movss	88(%r9), %xmm13
	movss	%xmm4, 112(%rsp)
	movss	96(%r9), %xmm1
	movss	100(%r9), %xmm14
	jmp	.L790
.L1086:
	movss	140(%rsp), %xmm4
	movaps	%xmm6, %xmm14
	movss	144(%rsp), %xmm13
	movss	136(%rsp), %xmm12
	movss	%xmm4, 112(%rsp)
	jmp	.L782
.L1051:
	movss	140(%rsp), %xmm4
	movss	%xmm6, 120(%rsp)
	movss	144(%rsp), %xmm12
	movss	136(%rsp), %xmm13
	movss	%xmm4, 112(%rsp)
	jmp	.L563
.L1041:
	leaq	.LC90(%rip), %rdx
	jmp	.L502
.L1040:
	leaq	.LC49(%rip), %rdx
	jmp	.L501
.L1728:
	pxor	%xmm3, %xmm3
	jmp	.L745
.L1076:
	pxor	%xmm1, %xmm1
	jmp	.L695
.L1115:
	pxor	%xmm1, %xmm1
	jmp	.L967
.L1753:
	movss	112(%rsp), %xmm0
	movd	%esi, %xmm3
.L804:
	movss	92(%r9), %xmm4
	movss	84(%r9), %xmm12
	movss	88(%r9), %xmm13
	movss	%xmm4, 112(%rsp)
	movss	96(%r9), %xmm1
	movss	100(%r9), %xmm14
	jmp	.L1018
.L1768:
	movss	112(%rsp), %xmm2
	movss	132(%rsp), %xmm0
	jmp	.L804
.L1065:
	xorl	%eax, %eax
	jmp	.L645
.L1100:
	xorl	%eax, %eax
	jmp	.L852
.L1734:
	movslq	1256(%rsp), %rcx
	testl	%ecx, %ecx
	jne	.L1663
	movss	140(%rsp), %xmm4
	movss	%xmm6, 120(%rsp)
	movss	144(%rsp), %xmm12
	movss	136(%rsp), %xmm13
	movss	%xmm4, 112(%rsp)
.L1667:
	movss	4(%r15), %xmm1
	jmp	.L563
.L1758:
	movl	1256(%rsp), %eax
	testl	%eax, %eax
	jne	.L1670
	movss	140(%rsp), %xmm4
	movaps	%xmm6, %xmm14
	movss	136(%rsp), %xmm12
	movss	144(%rsp), %xmm13
	movss	%xmm4, 112(%rsp)
.L1672:
	movss	4(%r15), %xmm1
	jmp	.L782
.L1760:
	movq	48(%rsp), %r13
	movq	56(%rsp), %rsi
	jmp	.L520
.L1077:
	pxor	%xmm1, %xmm1
	jmp	.L698
.L1116:
	pxor	%xmm1, %xmm1
	jmp	.L970
.L1729:
	pxor	%xmm3, %xmm3
	jmp	.L750
.L1661:
	leaq	8100(%rbx), %rsi
	jmp	.L534
.L1712:
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	call	*%rbx
	movl	72(%rsp), %r8d
	leaq	.LC183(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$2, %ecx
	call	*%rbx
	movl	$24, %r8d
	movl	$1, %edx
	leaq	.LC184(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	jmp	.L330
.L822:
	testl	%eax, %eax
	pxor	%xmm3, %xmm3
	jle	.L1671
.L824:
	cmpl	$2, %eax
	movl	$0x00000000, 112(%rsp)
	pxor	%xmm13, %xmm13
	je	.L1092
	xorl	%r11d, %r11d
	movaps	%xmm13, %xmm12
	movaps	%xmm13, %xmm1
	movl	%r11d, 156(%rsp)
	jmp	.L823
.L600:
	testl	%eax, %eax
	pxor	%xmm3, %xmm3
	jle	.L1664
.L1015:
	cmpl	$2, %eax
	movl	$0x00000000, 112(%rsp)
	pxor	%xmm12, %xmm12
	je	.L1059
	xorl	%eax, %eax
	movaps	%xmm12, %xmm13
	movaps	%xmm12, %xmm1
	movl	%eax, 156(%rsp)
	jmp	.L601
.L1043:
	xorl	%eax, %eax
	jmp	.L521
.L360:
	leaq	.LC132(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L363
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC90(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L365
	xorl	%eax, %eax
	movl	%eax, 808(%rsp)
	jmp	.L332
.L357:
	leaq	.LC49(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L359
	movl	$1, 804(%rsp)
	jmp	.L332
.L1059:
	movss	.LC97(%rip), %xmm13
.L1664:
	xorl	%eax, %eax
	movl	%eax, 156(%rsp)
	jmp	.L601
.L1093:
	movaps	%xmm6, %xmm14
	jmp	.L782
.L1092:
	movss	.LC97(%rip), %xmm12
.L1671:
	xorl	%r10d, %r10d
	movl	%r10d, 156(%rsp)
	jmp	.L823
.L1061:
	xorl	%eax, %eax
	jmp	.L613
.L1096:
	xorl	%eax, %eax
	jmp	.L834
.L1037:
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	jmp	.L439
.L1731:
	leal	1(%r9), %eax
	jmp	.L565
.L1751:
	leal	1(%rax), %ecx
	jmp	.L784
.L363:
	leaq	.LC133(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L368
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L370
	movss	.LC43(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L370:
	movss	%xmm0, 1188(%rsp)
	jmp	.L332
.L1642:
	movaps	%xmm3, %xmm5
	subl	$1, %eax
	subss	%xmm4, %xmm5
	movaps	%xmm5, %xmm4
	divss	.LC200(%rip), %xmm4
	je	.L1770
	mulss	%xmm4, %xmm0
	movl	$0x00000000, 112(%rsp)
	movaps	%xmm0, %xmm12
	movaps	%xmm6, %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm0, %xmm13
	jmp	.L823
.L1627:
	movaps	%xmm3, %xmm4
	subl	$1, %eax
	subss	%xmm5, %xmm4
	divss	.LC200(%rip), %xmm4
	je	.L1771
	mulss	%xmm4, %xmm0
	movl	$0x00000000, 112(%rsp)
	movaps	%xmm0, %xmm13
	movaps	%xmm6, %xmm0
	subss	%xmm4, %xmm0
	mulss	%xmm0, %xmm12
	jmp	.L601
.L365:
	leaq	.LC91(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L366
	movl	$1, 808(%rsp)
	jmp	.L332
.L368:
	leaq	.LC134(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L371
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L373
	movss	.LC43(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L373:
	movss	%xmm0, 1192(%rsp)
	jmp	.L332
.L1770:
	mulss	%xmm4, %xmm13
	movl	$0x00000000, 112(%rsp)
	pxor	%xmm12, %xmm12
	jmp	.L823
.L1771:
	mulss	%xmm4, %xmm12
	movl	$0x00000000, 112(%rsp)
	pxor	%xmm13, %xmm13
	jmp	.L601
.L371:
	leaq	.LC135(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L374
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L376
	movss	.LC43(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L376:
	movss	%xmm0, 1196(%rsp)
	jmp	.L332
.L366:
	leaq	.LC92(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L367
	movl	$2, 808(%rsp)
	jmp	.L332
.L374:
	leaq	.LC136(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L377
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L379
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L379:
	movss	%xmm0, 1200(%rsp)
	jmp	.L332
.L377:
	leaq	.LC138(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L380
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	movss	.LC85(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L382
	movss	.LC139(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L382:
	movss	%xmm0, 1204(%rsp)
	jmp	.L332
.L1676:
	movq	__imp___acrt_iob_func(%rip), %rbx
.L1003:
	movl	$2, %ecx
	call	*%rbx
	movl	$30, %r8d
	movl	$1, %edx
	leaq	.LC233(%rip), %rcx
	movq	%rax, %r9
	call	fwrite
	movq	%rsi, %rcx
	call	free
	jmp	.L330
.L343:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC123(%rip), %rdx
	movq	%rbp, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L367:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC123(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L380:
	leaq	.LC140(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L383
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L385
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L385:
	movss	%xmm0, 1208(%rsp)
	jmp	.L332
.L383:
	leaq	.LC141(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L386
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	pxor	%xmm1, %xmm1
	cvtsd2ss	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	ja	.L388
	movss	.LC137(%rip), %xmm2
	movaps	%xmm2, %xmm0
	cmpltss	%xmm1, %xmm0
	andps	%xmm0, %xmm2
	andnps	%xmm1, %xmm0
	orps	%xmm2, %xmm0
.L388:
	movss	%xmm0, 1212(%rsp)
	jmp	.L332
.L386:
	leaq	.LC142(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L389
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %r13
	leaq	.LC44(%rip), %rdx
	movq	%r13, %rcx
	call	fopen
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L1772
	movl	$65536, %ecx
	call	malloc
	movq	%rax, 1232(%rsp)
	xorl	%eax, %eax
	movl	%eax, 1240(%rsp)
.L392:
	leaq	544(%rsp), %rcx
	movq	%r12, %r8
	movl	$256, %edx
	call	fgets
	testq	%rax, %rax
	je	.L397
	cmpl	$8191, 1240(%rsp)
	jg	.L397
	leaq	544(%rsp), %rcx
	jmp	.L398
.L393:
	addq	$1, %rcx
.L398:
	movzbl	(%rcx), %eax
	cmpb	$32, %al
	je	.L393
	cmpb	$9, %al
	je	.L393
	subl	$10, %eax
	cmpb	$25, %al
	ja	.L394
	movl	$33554441, %edx
	btq	%rax, %rdx
	jc	.L392
.L394:
	leaq	348(%rsp), %r9
	leaq	344(%rsp), %r8
	leaq	.LC144(%rip), %rdx
	call	sscanf
	cmpl	$2, %eax
	jne	.L392
	movslq	1240(%rsp), %rcx
	movq	1232(%rsp), %rdx
	movss	348(%rsp), %xmm1
	movss	344(%rsp), %xmm0
	movq	%rcx, %rax
	addl	$1, %eax
	unpcklps	%xmm1, %xmm0
	movlps	%xmm0, (%rdx,%rcx,8)
	movl	%eax, 1240(%rsp)
	jmp	.L392
.L1772:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC143(%rip), %rdx
	movq	%r13, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L389:
	leaq	.LC145(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L399
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movl	$1, 448(%rsp,%rax,4)
	movq	%rax, %rdx
	salq	$5, %rdx
	movss	%xmm0, 828(%rsp,%rdx)
	jmp	.L332
.L397:
	movq	%r12, %rcx
	call	fclose
	jmp	.L332
.L533:
	leaq	8100(%rbx), %rsi
	leaq	(%r9,%rsi), %r13
	jmp	.L1016
.L359:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC130(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
.L1677:
	call	*__imp__errno(%rip)
	movl	(%rax), %ecx
	call	strerror
	movq	__imp___acrt_iob_func(%rip), %rbx
	movl	$2, %ecx
	movq	%rax, %rbp
	call	*%rbx
	leaq	1312(%rsp), %r8
	movq	%rbp, %r9
	leaq	.LC217(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L1003
.L399:
	leaq	.LC146(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L401
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movl	$1, 496(%rsp,%rax,4)
	movq	%rax, %rdx
	salq	$5, %rdx
	movss	%xmm0, 832(%rsp,%rdx)
	jmp	.L332
.L401:
	leaq	.LC147(%rip), %rdx
	movq	%r12, %rcx
	call	match_fi_arg
	testl	%eax, %eax
	movl	%eax, %r15d
	je	.L403
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	leal	-1(%r15), %eax
	cltq
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1148(%rsp,%rax,4)
	jmp	.L332
.L403:
	leaq	.LC148(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1773
	leaq	.LC149(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L409
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvttsd2sil	%xmm0, %eax
	movl	%eax, FORMANTS(%rip)
	jmp	.L332
.L1773:
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	movl	FORMANTS(%rip), %edx
	movl	$5, %eax
	cvtsd2ss	%xmm0, %xmm0
	jmp	.L407
.L408:
	movq	%rax, %rcx
	addq	$1, %rax
	salq	$5, %rcx
	movss	%xmm0, 832(%rsp,%rcx)
.L407:
	cmpl	%eax, %edx
	jg	.L408
	jmp	.L332
.L409:
	leaq	.LC150(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L411
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1216(%rsp)
	jmp	.L332
.L411:
	leaq	.LC151(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L413
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1220(%rsp)
	jmp	.L332
.L413:
	leaq	.LC152(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L415
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rcx
	call	atof
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1224(%rsp)
	jmp	.L332
.L415:
	leaq	.LC153(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L417
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %rdx
	leaq	1312(%rsp), %rcx
	movl	$511, %r8d
	call	strncpy
	jmp	.L332
.L417:
	leaq	.LC154(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L419
	cmpl	%ebx, %esi
	jle	.L1659
	movq	8(%rdi,%r14,8), %r12
	leaq	.LC155(%rip), %rdx
	movq	__imp__stricmp(%rip), %r13
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L421
	xorl	%eax, %eax
	movl	%eax, 2368(%rsp)
	jmp	.L332
.L419:
	leaq	.LC160(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1774
	leaq	.LC161(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1775
	leaq	.LC162(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1776
	leaq	.LC163(%rip), %rdx
	movq	%r12, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L1777
	cmpb	$45, (%r12)
	je	.L430
	leaq	1312(%rsp), %rcx
	movl	$511, %r8d
	movq	%r12, %rdx
	call	strncpy
.L426:
	movl	%r13d, %ebx
	jmp	.L332
.L421:
	leaq	.LC156(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L422
	movl	$1, 2368(%rsp)
	jmp	.L332
.L430:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC164(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L426
.L422:
	leaq	.LC157(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L423
	movl	$2, 2368(%rsp)
	jmp	.L332
.L1777:
	movl	$1, 2380(%rsp)
	jmp	.L426
.L1775:
	xorl	%eax, %eax
	movl	%eax, 2372(%rsp)
	jmp	.L426
.L1774:
	movl	$1, 2372(%rsp)
	jmp	.L426
.L1776:
	xorl	%eax, %eax
	movl	%eax, 2376(%rsp)
	jmp	.L426
.L423:
	leaq	.LC158(%rip), %rdx
	movq	%r12, %rcx
	call	*%r13
	testl	%eax, %eax
	jne	.L424
	movl	$3, 2368(%rsp)
	jmp	.L332
.L424:
	movl	$2, %ecx
	call	*__imp___acrt_iob_func(%rip)
	leaq	.LC159(%rip), %rdx
	movq	%r12, %r8
	movq	%rax, %rcx
	call	fprintf
	jmp	.L330
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
g_preset_whisper:
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
