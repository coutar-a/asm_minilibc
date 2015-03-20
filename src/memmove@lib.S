
	global memmove:function
	;;memmove - memmove copie le byte dans un buffer avant de réécrire sur dest
	;;  à priori c'est ce que fait notre memcpy avec al comme buffer
	;;demander à rémi : on refait memcpy sans buffer ou on garde tout comme tel ?

memmove:
	mov r12, rdi
	mov r13, rsi
	xor rbx, rbx

loop_memmove:
	cmp rbx, rdx
	je end_memmove
	mov al, [r13]
	mov [r12], al
	inc r12
	inc r13
	inc rbx
	jmp loop_memmove

end_memmove:
	ret
