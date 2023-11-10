section .data

    SYS_EXIT    equ 0x1
    EXIT        equ 0x0
    SYS_CALL    equ 0x80

    x equ 0x1                   ; 0x1

section .bss
    y resb 0x1                  ; *y = Espaço na mémoria (1 byte)

section .text

global _start

_start:
    mov ecx, x                  ;   ecx = 1
    ;mov ecx, [x]               ; * ecx = &1       // ERRADO
    ;add x, 0x2                 ; 0x1 = 0x1 + 0x2  // ERRADO

    mov ecx, y                  ; * ecx = &y

    mov DWORD[y], 0x1           ; *ecx[0] = 0x1
    mov DWORD[ecx], 0x2         ; *ecx[0] = 0x2
    mov DWORD[ecx + 1], 0x5     ; *ecx[1] = 0x5

    mov DWORD[ecx + 2], 0x100   ; Excede o tamanho
                                ; --+---+---+---+---+---+---+---+---+---+---+
                                ;   |   | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
                                ; --+---+---+---+---+---+---+---+---+---+---+
                                ;   ECX + 3 |           ECX + 2             |
                                ; ----------+-------------------------------+
                                ; *ecx[2] = 0x0 (1-8º bits)
                                ; *ecx[3] = 0x1 (  9º bit, excedente)

    mov DWORD[ecx + 4], 0x101   ; Excede o tamanho
                                ; --+---+---+---+---+---+---+---+---+---+---+
                                ;   |   | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
                                ; --+---+---+---+---+---+---+---+---+---+---+
                                ;   ECX + 5 |           ECX + 4             |
                                ; ----------+-------------------------------+
                                ; *ecx[4] = 0x1 (1-8º bit)
                                ; *ecx[5] = 0x1 (  9º bit, excendete)

    ;mov [y], 0x2               ; ERRO! Tamanho do operador não especificado (y)

    inc ecx                     ; * ecx = &ecx[1]
    mov ecx, [y]                ;   ecx = y = 0x2

    mov eax, SYS_EXIT           ; exit(0)
    mov ebx, EXIT
    int SYS_CALL
