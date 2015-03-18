

	extern _GLOBAL_OFFSET_TABLE_
	global strlen_jeff:function

%macro	get_GOT 0

	call %%getgot
%%getgot:
	pop rcx
	add rcx, _GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc

%endmacro

%macro	end_GOT 0
	call %%ungetgot
%%ungetgot:
	mov rcx, [rdx - 4]
	mov rcx, rdx
	pop rdx

%endmacro
strlen_jeff:
	mov r12, rdi		; stock str in esi
	xor rbx, rbx	   	; xor d'un registre l'initialise à 0

loop:
	mov al, [r12] 		; on copie le contenu mémoire à l'addresse de esi sur al (1 byte)
	cmp al, 0x0 		; comparaison à 0
	jz end			; si la comparaison est valide, jump à l'instruction end
	inc rbx			; sinon incrémente rbx (compteur) 
	inc r12			; et esi (pointeur sur string)
	jmp loop		; jump à loop

end:
	mov rax, rbx
	ret			; retour
