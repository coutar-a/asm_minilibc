	global memset:function
	;;memset

memset:
	mov r12, rdi		; str sur r12
	mov ecx, esi		; char sur ecx
	mov r13, rdx		; n sur r13
	xor rbx, rbx		; xor de rbx pour servir de compteur

loop_memset:
	cmp rbx, r13
	je end_memset
	mov [r12], cl
	inc r12
	inc rbx
	jmp loop_memset

end_memset:
	ret
