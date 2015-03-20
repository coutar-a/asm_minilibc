	global strcasecmp:function

	;;strcasecmp

case_suppr_al:
	and	al, 11011111b
	cmp	al, 'A'
	jb	back_1
	cmp	al, 'Z'
	ja	back_1
	add	al, 32
	jmp	back_1

case_suppr_bl:
	and	bl, 11011111b
	cmp	bl, 'A'
	jb	back_2
	cmp	bl, 'Z'
	ja	back_2
	add	bl, 32
	jmp	back_2

strcasecmp:
	mov 	r12, rdi
	mov 	r13, rsi
	xor	rax, rax

loop_strcasecmp:
	mov	al, [r12]
	jmp	case_suppr_al
back_1:	mov	bl, [r13]
	jmp	case_suppr_bl
back_2	cmp	al, bl
	jne	end_strcasecmp
	cmp	al, 0x0
	je	end_strcasecmp_eq
	inc	r12
	inc	r13
	jmp	loop_strcasecmp

end_strcasecmp:
	sub	eax, ebx
	ret

end_strcasecmp_eq:
	xor	eax, eax
	ret
