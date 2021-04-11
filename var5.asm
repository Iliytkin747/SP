
section	.data
    mas dw -12, 122, 43, -41, -75, -934, 5, 12, 27, 100
    sum dw  0
    del dd  0
    ost dw  0
    i db 10
section .text
global _start
_start:
main:
xor eax, eax
    xor ebx, ebx
    mov ecx, 10
    lea esi, [mas]
    mov bx,[esi]
lp:
    test bx,bx
    jns cnt
        not bx
        add bx,1
    cnt:
    add ax,bx
    add esi, 2
    mov bx,[esi]
    dec ecx
jnz lp
    xor edx,edx
    mov ecx, 0
    mov [del],ax
fin:
 cmp ax,10
    jb sml
    big:
        xor eax, eax
        xor ebx, ebx
        xor edx, edx
        mov ebx, 10
        mov eax,[del]
        div ebx
        mov [del], ax
        mov [ost], dx
        push dx
        mov bx, 10
        inc ecx
        cmp eax,10
        jg big
        add ax, '0'
        mov [sum], ax
        mov [i],cx
        mov  edx, 1
        mov  ecx, sum
        mov  ebx, 1
        mov  eax, 4
        int  0x80
        mov cx,[i]
        outp:
            pop ax
            add ax, '0'
            mov [sum], ax
            mov [i],cx
            mov  edx, 1
            mov  ecx, sum
            mov  ebx, 1
            mov  eax, 4
            int  0x80
            mov cx,[i]
            dec cx
            jnz outp
            mov ebx, 0
            mov  eax, 1     ; номер системного вызова (sys_exit)
            int  0x80 
    sml:
        add ax, '0'
        mov [sum], ax
        mov  edx, 1
        mov  ecx, sum
        mov  ebx, 1
        mov  eax, 4
	mov ebx, 0 ;выключаем программу с кодом 0
    	mov  eax, 1     ; номер системного вызова (sys_exit)
        int  0x80
