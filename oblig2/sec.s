	.globl hms_to_sec
hms_to_sec:

	imulq $3600, %rdi   #ganger 3600 med rdi(timene)
	imulq $60, %rsi   #ganger 60 med %rsi (minuttene)
	movq %rdi, %rax   #flytter rdi(timene) til rax, siden hvis vi skal drive med å flytte registrene for mye fyller vi opp stacken unødvendig
	addq %rsi, %rax   #adderer rsi(minuttene) med rax (rdi(timene))
	addq %rdx, %rax   #aderer rdx(sekudene) med rax(rdi+rsi)
	ret


 	.globl	sec_to_h #dele på 3600, siden 1 time er lik 3600 sekunder
sec_to_h:

	 movq %rdi, %rax #flytter 1.param til rax
	 movq $3600, %r8
	 cqo
	 idivq %r8
	 ret


 .globl	sec_to_s
sec_to_s:

	 movq %rdi, %rax
	 movq $60, %r10
	 cqo
	 idivq %r10
	 movq %rdx, %rax
	 ret


 .globl	sec_to_m
sec_to_m:

	 movq %rdi, %rax
	 movq $60, %r8
	 cqo
	 idivq %r8
	 cqo
	 idivq %r8
	 movq %rdx, %rax
	 ret
