	global strcmp:function
	;;strcmp

strcmp:
	mov 	r12, rdi
	mov 	r13, rsi
	xor	rax, rax

loop_strcmp:
	mov	al, [r12]
	mov	bl, [r13]
	cmp	al, bl
	jne	end_strcmp
	cmp	al, 0x0
	je	end_strcmp_eq
	inc	r12
	inc	r13
	jmp	loop_strcmp

end_strcmp:
	sub	eax, ebx
	ret

end_strcmp_eq:
	xor	eax, eax
	ret
