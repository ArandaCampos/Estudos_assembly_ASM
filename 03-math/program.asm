; Intel - x86 (32bits) - compatível com x86 (64 bits)

%include 'math.inc'

section .data
    SYS_EXIT  equ 0x1
    EXIT      equ 0x0

    l dd 0

section .text
global _start

_start:
    mov eax, 0x2                ; EAX = 2
    mov ebx, 0xf                ; EBX = 16
    call pow                    ; pow(EAX, EBX);

    mov [l], ebp                ; int l[];
    mov DWORD[l], 0x1           ; l[0] = 1;
    mov DWORD[l + 4], 0x2       ; l[1] = 2;
    mov DWORD[l + 8], 0x3       ; l[3] = 3;
    add ebx, l                  ; *EBX = l[0];
    mov ecx, 0x3                ; ECX = 3;
    call add_sequence           ; add_sequence(EBX, ECX)

    ; EXIT
    mov eax, SYS_EXIT
    mov ebx, EXIT
    int 0x80                    ; exit(0);
