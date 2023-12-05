	.type	slice_string, @function
slice_string:
.LFB6:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-32(%rbp), %eax
	subl	-28(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L3:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -16(%rbp)
.L2:
	movl	-16(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jle	.L3
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	ret

.LC0:
	.string	"input.txt"
.LC1:
	.string	"r"
.LC2:
	.string	" "
.LC3:
	.string	"Final sum: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$2240, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, -2192(%rbp)
	movq	-2192(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -2184(%rbp)
	movl	$0, -2240(%rbp)
	movl	$0, -2236(%rbp)
	jmp	.L6
.L16:
	movl	$0, -2232(%rbp)
	leaq	-272(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	addq	$2, %rax
	movq	%rax, -2176(%rbp)
	movq	-2176(%rbp), %rax
	movl	$124, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	subq	-2176(%rbp), %rax
	subl	$1, %eax
	movl	%eax, %edx
	movq	-2176(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	slice_string
	movq	%rax, -2168(%rbp)
	movq	-2168(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -2208(%rbp)
	jmp	.L7
.L8:
	movq	-2208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	-2232(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -2160(%rbp,%rdx,4)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -2208(%rbp)
	addl	$1, -2232(%rbp)
.L7:
	cmpq	$0, -2208(%rbp)
	jne	.L8
	movl	$0, -2232(%rbp)
	movq	-2176(%rbp), %rax
	movl	$124, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	addq	$2, %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -2200(%rbp)
	jmp	.L9
.L10:
	movq	-2200(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	-2232(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -2112(%rbp,%rdx,4)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -2200(%rbp)
	addl	$1, -2232(%rbp)
.L9:
	cmpq	$0, -2200(%rbp)
	jne	.L10
	movl	$0, -2228(%rbp)
	movl	$0, -2224(%rbp)
	jmp	.L11
.L15:
	movl	$0, -2220(%rbp)
	jmp	.L12
.L14:
	movl	-2224(%rbp), %eax
	cltq
	movl	-2160(%rbp,%rax,4), %edx
	movl	-2220(%rbp), %eax
	cltq
	movl	-2112(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L13
	addl	$1, -2228(%rbp)
.L13:
	addl	$1, -2220(%rbp)
.L12:
	cmpl	$24, -2220(%rbp)
	jle	.L14
	addl	$1, -2224(%rbp)
.L11:
	cmpl	$9, -2224(%rbp)
	jle	.L15
	movl	-2240(%rbp), %eax
	cltq
	movl	-2228(%rbp), %edx
	movl	%edx, -2000(%rbp,%rax,4)
	movl	-2240(%rbp), %eax
	cltq
	movl	$1, -1136(%rbp,%rax,4)
	addl	$1, -2240(%rbp)
.L6:
	movq	-2184(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L16
	movq	-2184(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, -2216(%rbp)
	jmp	.L17
.L21:
	movl	$1, -2212(%rbp)
	jmp	.L18
.L20:
	cmpl	$214, -2212(%rbp)
	jg	.L19
	movl	-2216(%rbp), %edx
	movl	-2212(%rbp), %eax
	addl	%edx, %eax
	cltq
	movl	-1136(%rbp,%rax,4), %ecx
	movl	-2216(%rbp), %eax
	cltq
	movl	-1136(%rbp,%rax,4), %edx
	movl	-2216(%rbp), %esi
	movl	-2212(%rbp), %eax
	addl	%esi, %eax
	addl	%ecx, %edx
	cltq
	movl	%edx, -1136(%rbp,%rax,4)
.L19:
	addl	$1, -2212(%rbp)
.L18:
	movl	-2216(%rbp), %eax
	cltq
	movl	-2000(%rbp,%rax,4), %eax
	cmpl	%eax, -2212(%rbp)
	jle	.L20
	movl	-2216(%rbp), %eax
	cltq
	movl	-1136(%rbp,%rax,4), %eax
	addl	%eax, -2236(%rbp)
	addl	$1, -2216(%rbp)
.L17:
	cmpl	$215, -2216(%rbp)
	jle	.L21
	movl	-2236(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	ret
