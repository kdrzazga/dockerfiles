section .data
    msg db 'CPU Registers:', 10
        db 'EAX = ', 0
        db 'EBX = ', 0
        db 'ECX = ', 0
        db 'EDX = ', 0
        db 'ESP = ', 0
        db 'EBP = ', 0
        db 'ESI = ', 0
        db 'EDI = ', 0
        db 'EIP = ', 0
        db 'FLAGS = ', 0
        db 'CPU Type/Name: ', 10
    end_msg equ $ - msg

section .text
    global _start

_start:
    ; Save flags to stack
    pushf

    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, end_msg
    int 0x80

    ; Print EAX
    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    ; Print EBX
    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    ; Print ECX
    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    ; Print EDX
    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    ; Print ESP
    mov eax, 1
    mov ebx, 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    mov esp_str, esp
    mov eax, 4
    mov ebx, 1
    mov ecx, esp
