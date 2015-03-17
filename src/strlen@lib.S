	global strlen:function
	global strchr:function

	;; strlren

strlen:
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
	;mov es, eax
	mov rax, rbx
	ret			; retour

	;; strchr

strchr:
	mov r12, rdi
	mov ah, [rsi]

loop_chr:
	mov al, [r12]
	cmp al, 0x0
	jz end_chr_none
	cmp al, ah
	jz end_chr
	inc r12
	jmp loop_chr

end_chr:
	mov rax, r12
	ret
end_chr_none:
	mov rax, 0x0
	ret
