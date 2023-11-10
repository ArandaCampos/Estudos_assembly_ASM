segment .text
pow:
    mov ecx, ebx
    mov ebx, eax
    dec ecx
.next:
    mul ebx
    loop .next
    ret

add_sequence:
    mov eax, [ebx]
    add ebx, 4
    dec ecx
.next_add:
    add eax, [ebx]
    add ebx, 4
    loop .next_add
    ret


