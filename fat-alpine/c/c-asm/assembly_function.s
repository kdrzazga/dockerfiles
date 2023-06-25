.section .data
    message:    .asciz "Hello from assembly!\n"

.section .text
.globl assembly_function
assembly_function:
    mov $4, %eax           # System call number for write
    mov $1, %ebx           # File descriptor (stdout)
    mov $message, %ecx     # Pointer to the message
    mov $20, %edx          # Message length

    int $0x80              # Trigger the software interrupt

    ret
