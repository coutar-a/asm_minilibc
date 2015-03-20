	global strlen:function

	;; strlren

strlen:
	mov r12, rdi		; stock str in rdi
	xor rbx, rbx	   	; xor d'un registre l'initialise à 0

loop:
	mov al, [r12] 		; on copie le contenu mémoire à l'addresse de r12 sur al (1 byte)
	cmp al, 0x0 		; comparaison à 0
	jz end			; si la comparaison est valide, jump à l'instruction end
	inc rbx			; sinon incrémente rbx (compteur)
	inc r12			; et r12 (pointeur sur string)
	jmp loop		; jump à loop

end:
	;mov es, eax
	mov rax, rbx
	ret			; retour
