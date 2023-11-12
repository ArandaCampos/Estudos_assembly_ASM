; x86 (Intel/ AMD - 32/64 bits)

section .rdata
    SYS_EXIT    equ 0x1
    SYS_CALL    equ 0x80
    EXIT        equ 0x0

    F_1         equ 0x1
    F_2         equ 0x1
    N           equ 0xA

section .bss


section .text
global _start

fibonacci:              ; int fibonacci(int f_1, int f_2, int n) {
    cmp ecx, 0x2        ;       if (n <= 2)
        jle .lessthen2  ;           return lessthen2();
    sub ecx, 0x2        ;       n = n - 2;
.sequence:              ;       while (n > 0) {
    add ebx, eax        ;           f_1 = f_1 + f_2;
    mov edx, ebx        ;           aux = f_1;
    mov ebx, eax        ;           f_1 = f_2;
    mov eax, edx        ;           f_2 = aux;
    loop .sequence      ;       }

    ret                 ;       return F_2;
                        ; }

.lessthen2:             ; int lessthen2(int n) {
    cmp ecx, 0x0        ;       if (n <= 0)
        jle .notExist   ;           return notExit();
    ret                 ;       return 1;
                        ; }

.notExist:              ; int notExist (int n) {
    mov eax, 0          ;       return 0;
    ret                 ; }

_start:                 ; int main () {
    mov eax, F_2        ;       int f_2 = 1, f_1 = 1, n = 10;
    mov ebx, F_1        ;
    mov ecx, N          ;
    call fibonacci      ;       fibonacci(f_1, f_2, n);

    mov eax, SYS_EXIT   ;       return 0;
    mov ebx, EXIT       ; }
    int SYS_CALL

