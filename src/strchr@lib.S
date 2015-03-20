	global strchr:function
	;; strchr

strchr:
	mov r12, rdi		; stock str de rdi sur r12
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
