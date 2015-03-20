
	global strpbrk:function
	;;strpbrk

strpbrk:
	mov r12, rdi 		; target buffer
	xor rax, rax		; init return

strpbrk_loop:
	mov rbx, rsi
	mov al, [r12]
	cmp al, 0x0
	je strpbrk_failure
	jmp byte_check

strpbrk_inc:
	inc r12
	jmp strpbrk_loop

byte_check:
	mov ah, [rbx]
	cmp ah, 0x0
	jz strpbrk_inc
	cmp al, ah
	je strpbrk_ret
	inc rbx
	jmp byte_check

strpbrk_ret:
	mov rax, r12
	ret

strpbrk_failure:
	mov rax, 0x0
	ret
