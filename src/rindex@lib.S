	global rindex:function
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
