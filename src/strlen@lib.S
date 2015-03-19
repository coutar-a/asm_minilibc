	global strlen:function
	global strchr:function
	global memset:function
	global memcpy:function
	global strcmp:function
	global strncmp:function
	global memmove:function
	global rindex:function
	global strstr:function

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

	;;memcpy

memcpy:
	mov r12, rdi
	mov r13, rsi
	xor rbx, rbx

loop_memcpy:
	cmp rbx, rdx
	je end_memcpy
	mov al, [r13]
	mov [r12], al
	inc r12
	inc r13
	inc rbx
	jmp loop_memcpy

end_memcpy:
	ret

	;;strcmp

strcmp:
	mov 	r12, rdi
	mov 	r13, rsi
	xor	rax, rax

loop_strcmp:
	mov	al, [r12]
	mov	bl, [r13]
	cmp	al, bl
	jne	end_strcmp
	cmp	al, 0x0
	je	end_strcmp_eq
	inc	r12
	inc	r13
	jmp	loop_strcmp

end_strcmp:
	sub	eax, ebx
	ret

end_strcmp_eq:
	xor	eax, eax
	ret

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

		;; rindex

rindex:
	mov r12, rdi		; stock str de rdi sur r12
	mov ecx, esi		; on copie les 4 derniers octets de rsi (esi) sur ecx
	xor r13, r13		; compteur pour éviter de sortir de la chaine en décrémentant

rindex_find_end:
	mov al, [r12]
	cmp al, 0x0
	jz rindex_find_char
	inc r12
	inc r13
	jmp rindex_find_end

rindex_find_char:
	mov al, [r12]
	cmp al, cl
	jz rindex_end_chr
	cmp r13, 0x0
	jz rindex_chr_none
	dec r12
	dec r13
	jmp rindex_find_char

rindex_end_chr:
	mov rax, r12
	ret

rindex_chr_none:
	mov rax, 0x0
	ret

	;;strstr

strstr:
	mov r12, rdi 		; target
	mov rbx, rsi		; pattern
	xor r14, r14		; dec counter
	xor rax, rax		; init return

strstr_loop:
	mov al, [r12]
	mov ah, [rbx]
	cmp ah, al
	je strstr_jeff
	cmp al, 0x0
	je strstr_failure
	inc r12
	jmp strstr_loop

strstr_jeff:
	inc r12
	inc rbx
	inc r14
	mov al, [r12]
	mov ah, [rbx]
	cmp ah, 0x0
	je strstr_end
	cmp ah, al
	je strstr_jeff
	mov r14, 0x0
	jne strstr_loop

strstr_end:
	cmp r14, 0x0
	je strstr_ret
	dec r12
	dec r14
	jmp strstr_end

strstr_ret:
	mov rax, r12
	ret

strstr_failure:
	mov rax, 0x0
	ret
