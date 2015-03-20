
	global strpbrk:function
	;;strpbrk

strpbrk:
	mov r12, rdi 		; target buffer
	mov rbx, rsi		; byte targets buffer
	xor rax, rax		; init return

strpbrk_loop:
	mov al, [r12]
	cmp al, 0x0
	je strpbrk_failure
	jmp byte_check
	inc r12
	jmp strpbrk_loop

byte_check:
	cmp rbx, 0x0
	je strpbrk_loop
	cmp al, [rbx]
	je strpbrk_ret
	inc rbx
	jmp byte_check

strpbrk_ret:
	mov rax, r12
	ret

strpbrk_failure:
	mov rax, 0x0
	ret
