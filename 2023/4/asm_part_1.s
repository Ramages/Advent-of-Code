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
	.globl	main
	.type	main, @function
main:
.LFB7:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$512, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, -464(%rbp)
	movq	-464(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -456(%rbp)
	movl	$0, -500(%rbp)
	jmp	.L6
.L17:
	movl	$0, -496(%rbp)
	leaq	-272(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	addq	$2, %rax
	movq	%rax, -448(%rbp)
	movq	-448(%rbp), %rax
	movl	$124, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	subq	-448(%rbp), %rax
	subl	$1, %eax
	movl	%eax, %edx
	movq	-448(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	slice_string
	movq	%rax, -440(%rbp)
	movq	-440(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -480(%rbp)
	jmp	.L7
.L8:
	movq	-480(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	-496(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -432(%rbp,%rdx,4)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -480(%rbp)
	addl	$1, -496(%rbp)
.L7:
	cmpq	$0, -480(%rbp)
	jne	.L8
	movl	$0, -496(%rbp)
	movq	-448(%rbp), %rax
	movl	$124, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	addq	$2, %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -472(%rbp)
	jmp	.L9
.L10:
	movq	-472(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	-496(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -384(%rbp,%rdx,4)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -472(%rbp)
	addl	$1, -496(%rbp)
.L9:
	cmpq	$0, -472(%rbp)
	jne	.L10
	movl	$0, -492(%rbp)
	movl	$0, -488(%rbp)
	jmp	.L11
.L16:
	movl	$0, -484(%rbp)
	jmp	.L12
.L15:
	movl	-488(%rbp), %eax
	cltq
	movl	-432(%rbp,%rax,4), %edx
	movl	-484(%rbp), %eax
	cltq
	movl	-384(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jne	.L13
	cmpl	$0, -492(%rbp)
	jne	.L14
	addl	$1, -492(%rbp)
	jmp	.L13
.L14:
	sall	-492(%rbp)
.L13:
	addl	$1, -484(%rbp)
.L12:
	cmpl	$24, -484(%rbp)
	jle	.L15
	addl	$1, -488(%rbp)
.L11:
	cmpl	$9, -488(%rbp)
	jle	.L16
	movl	-492(%rbp), %eax
	addl	%eax, -500(%rbp)
.L6:
	movq	-456(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movl	$256, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L17
	movq	-456(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	-500(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L19
.L19:
	leave
	ret
