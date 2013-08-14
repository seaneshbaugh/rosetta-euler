	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -24(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$1000, -24(%rbp)        ## imm = 0x3E8
	jge	LBB0_7
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$1431655766, %rcx, %rcx ## imm = 0x55555556
	movq	%rcx, %rdx
	shrq	$63, %rdx
	movl	%edx, %esi
	shrq	$32, %rcx
	movl	%ecx, %edi
	addl	%esi, %edi
	leal	(%rdi,%rdi,2), %esi
	subl	%esi, %eax
	cmpl	$0, %eax
	je	LBB0_4
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	imulq	$1717986919, %rcx, %rcx ## imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	movl	%edx, %esi
	sarq	$33, %rcx
	movl	%ecx, %edi
	addl	%esi, %edi
	leal	(%rdi,%rdi,4), %esi
	subl	%esi, %eax
	cmpl	$0, %eax
	jne	LBB0_5
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	movl	-20(%rbp), %ecx
	addl	%eax, %ecx
	movl	%ecx, -20(%rbp)
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_6
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB0_1
LBB0_7:
	leaq	L_.str(%rip), %rdi
	movl	-20(%rbp), %esi
	movb	$0, %al
	callq	_printf
	movl	$0, %esi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movl	%esi, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "%d\n"


.subsections_via_symbols
