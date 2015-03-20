	global strstr:function
	;;strstr

strstr:
	mov r12, rdi 		; target
	mov rbx, rsi		; pattern
	xor r14, r14		; dec counter
	xor rax, rax		; init return

strstr_loop:
	mov al, [r12]
	mov ah, [rbx]
	cmp ah, al
	je strstr_jeff
	cmp al, 0x0
	je strstr_failure
	inc r12
	jmp strstr_loop

strstr_jeff:
	inc r12
	inc rbx
	inc r14
	mov al, [r12]
	mov ah, [rbx]
	cmp ah, 0x0
	je strstr_end
	cmp ah, al
	je strstr_jeff
	mov r14, 0x0
	jne strstr_loop

strstr_end:
	cmp r14, 0x0
	je strstr_ret
	dec r12
	dec r14
	jmp strstr_end

strstr_ret:
	mov rax, r12
	ret

strstr_failure:
	mov rax, 0x0
	ret
