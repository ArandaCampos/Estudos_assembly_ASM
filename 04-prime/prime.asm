; x86 (Intel/ AMD - 32/64 bits)

section .rdata
    SYS_EXIT    equ 0x1
    SYS_CALL    equ 0x80
    EXIT        equ 0x0

section .data
    N           equ 0x61    ; 97 (base 10)

section .text

global _start


is_prime:               ; int is_prime(int n)
                        ; {
    mov ecx, 0x1        ;       counter = 1;
    cmp ebx, ecx        ;       if (n <= counter)
        jle .negative   ;           return 0;

.FOR:                   ;       for
                        ;       {
    inc ecx             ;           divisor++
    cmp ecx, ebx        ;           if (n == divisor)
        je .positive    ;               return 1;

    mov eax, ebx
    div ecx             ;       quociente = n / divisor; resto = n % divisor

    cmp edx, 0          ;       if (resto == 0)
        je .negative    ;           return 0;

    xor edx, edx        ;       }
    jmp .FOR            ; }

.negative:
    mov eax, 0
    ret
.positive:
    mov eax, 1
    ret

_start:                 ; int main ()
                        ; {
    mov ebx, N          ;    n = 97;
    call is_prime       ;    is_prime(n);

    mov eax, SYS_EXIT   ;    return 0;
    mov ebx, EXIT       ; }
    int SYS_CALL
