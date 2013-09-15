	.section	__TEXT,__text,regular,pure_instructions
	.globl	_euler2
	.align	4, 0x90
_euler2:                                ## @euler2
## BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-16(%rbp), %rdx
	movl	(%rdx), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	movl	%ecx, %r8d
	addl	%eax, %r8d
	andl	$-2, %r8d
	subl	%r8d, %ecx
	cmpl	$0, %ecx
	jne	LBB0_2
## BB#1:
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
LBB0_2:
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	addl	(%rax), %ecx
	cmpl	-28(%rbp), %ecx
	jge	LBB0_4
## BB#3:
	leaq	-32(%rbp), %rsi
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	addl	(%rax), %ecx
	movl	%ecx, -32(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rdx
	movl	-28(%rbp), %ecx
	callq	_euler2
LBB0_4:
	addq	$32, %rsp
	popq	%rbp
	ret

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	leaq	-20(%rbp), %rax
	leaq	-24(%rbp), %rcx
	leaq	-28(%rbp), %rdx
	movl	$4000000, %r8d          ## imm = 0x3D0900
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	%rax, %rdi
	movq	%rcx, %rsi
	movl	%r8d, %ecx
	callq	_euler2
	leaq	L_.str(%rip), %rdi
	movl	-28(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$0, %ecx
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	ret

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "%d\n"


.subsections_via_symbols
