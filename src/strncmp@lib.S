	global strncmp:function
	;;strncmp

strncmp:
	mov 	r12, rdi
	mov 	r13, rsi
	xor	r14, r14
	xor	rax, rax

loop_strncmp:
	mov	al, [r12]
	mov	bl, [r13]
	cmp	al, bl
	jne	end_strncmp
	cmp	r14, rdx
	je	end_strncmp
	cmp	al, 0x0
	je	end_strncmp_eq
	inc	r12
	inc	r13
	inc	r14
	jmp	loop_strncmp

end_strncmp:
	sub	eax, ebx 	; renvoie 1 ?
	ret

end_strncmp_eq:
	xor	eax, eax
	ret
