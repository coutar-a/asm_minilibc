	global memcpy:function
	;;memcpy

memcpy:
	mov r12, rdi
	mov r13, rsi
	xor rbx, rbx

loop_memcpy:
	cmp rbx, rdx
	je end_memcpy
	mov al, [r13]
	mov [r12], al
	inc r12
	inc r13
	inc rbx
	jmp loop_memcpy

end_memcpy:
	ret
