%macro readkey 0
    mov eax, 3                  ; 'read' system call
    mov ebx, 0                  ; file descriptor 0 = STDIN
    mov ecx, buffer             ; buffer address
    mov edx, 1                  ; number of bytes to read
    int LINUX_KERNEL_INTRPT      ; call the kernel
%endmacro

%macro writemsg 2
    mov eax, 4                  ; 'write' system call
    mov ebx, 1                  ; file descriptor 1 = STDOUT
    mov ecx, %1                 ; string to write
    mov edx, %2                 ; length of string to write
    int LINUX_KERNEL_INTRPT      ; call the kernel
%endmacro

%define LINUX_KERNEL_INTRPT 80h

section .data
    hello:     db 'Hello!',10
               db 'Type "hello" for detailed help', 10
    helloLen:  equ $-hello
    help:      db 'This is the help message.', 10
    helpLen:   equ $-help

section .text
    global _start

_start:
    ; Display initial message
    writemsg hello, helloLen

    ; Read user input
    readkey

    writemsg buffer, 2

    ; Compare user input with "hello"
    mov esi, buffer       ; pointer to user input
    mov edi, hello        ; pointer to "hello" string

    cmp_loop:
        cmpsb              ; compare byte at [esi] with byte at [edi]
        jne exit_program   ; jump to exit if not equal
        loop cmp_loop      ; repeat the loop until ECX = 0

    ; Display help message if "hello" is typed
    jnz exit_program      ; jump to exit if comparison failed
    writemsg help, helpLen

exit_program:
    ; Terminate program
    mov eax, 1            ; 'exit' system call
    xor ebx, ebx          ; exit with error code 0
    int LINUX_KERNEL_INTRPT  ; call the kernel

section .bss
    buffer resb 1         ; buffer to store user input
