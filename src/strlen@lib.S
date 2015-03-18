	global strlen:function
	global strchr:function

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

	;; strchr

strchr:
	mov r12, rdi		; stock str sur rdi
	mov ecx, esi		; on copie les 4 derniers octets de rsi (esi) sur ecx

loop_chr:
	mov al, [r12]		; on copie le byte courant sur al
	cmp al, 0x0		; comparaison à 0
	jz end_chr_none		; on a trouvé le null byte, retour
	cmp al, cl		; comparaison entre al et cl, dernier byte de ecx
	jz end_chr		; si égalité, on retourne le pointeur
	inc r12			; sinon on incrémente
	jmp loop_chr

end_chr:
	mov rax, r12
	ret
end_chr_none:
	mov rax, 0x0
	ret
