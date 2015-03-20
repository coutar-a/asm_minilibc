	global strcspn:function

	;;strcspn

strcspn:
	mov 	r12, rdi
	xor	rax, rax
	xor	rcx, rcx

loop_strcspn:
	mov	al, [r12]
	cmp	al, 0x0
	je	end_strcspn
	mov 	r13, rsi
	jmp	check_char
back_spn:
	inc	r12
	inc	ecx
	jmp	loop_strcspn

check_char:
	mov	bl, [r13]
	cmp	bl, 0x0
	je	back_spn
	cmp	bl, al
	je	end_strcspn
	inc	r13
	jmp	check_char

end_strcspn:
	mov	eax, ecx
	ret
