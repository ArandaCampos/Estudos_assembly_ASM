section .data

    SYS_EXIT  equ 60
    SYS_WRITE equ 1
    STD_OUT   equ 1
    EXIT      equ 0

    GREAT_MSG   db "X maior que Y", 0xa
    EQUA_MSG    db "X iqual que Y", 0xa
    LESS_MSG    db "X menor que Y", 0xa

    SIZE_G  equ 14
    SIZE_L  equ 14
    SIZE_E  equ 14
    N1       dd 4
    N2       dd 3

section .text
    global _start

    _start:

        mov eax, DWORD [N1]
        mov ebx, DWORD [N2]
        cmp eax, ebx
        je  equa
        jge great_n1

        mov rsi, LESS_MSG
        mov rdx, SIZE_L
        call print

        call exit

    equa:
        mov rsi, EQUA_MSG
        mov rdx, SIZE_E
        call print
        call exit
        ret

    great_n1:
        mov rsi, GREAT_MSG
        mov rdx, SIZE_G
        call print
        call exit
        ret

    exit:
        mov rax, SYS_EXIT
        mov rdi, EXIT
        syscall

    print:
        mov rax, SYS_WRITE
        mov rdi, STD_OUT
        syscall
        ret
