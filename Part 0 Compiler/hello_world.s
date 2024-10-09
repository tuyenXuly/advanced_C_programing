	.file	"hello_world.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "value 1 = %d\12\0"
.LC1:
	.ascii "value 2 = %d\12\0"
.LC2:
	.ascii "My favorite number is : %d\12\0"
.LC3:
	.ascii "Hello World!!\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	movl	$3, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$4, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$7, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
