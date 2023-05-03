section .data
    os_msg     db  "Operating system: ", 0
    cpu_msg    db  "CPU: ", 0
    ram_msg    db  "RAM: ", 0
    newline    db  0Ah

section .text
    global _start

_start:
    ; Print the operating system information
    mov eax, 0x0F           ; Select the INT 0x15, AX=E820h BIOS call
    xor ebx, ebx            ; Start at address 0x00000000
    mov ecx, 0xFFFFFFFF     ; Search for all memory regions
    mov edx, 0x534D4150     ; "SMAP" signature for newer BIOSes
    mov esi, 0x8000         ; Start address of buffer to store results
    mov edi, esi            ; Store the buffer address in EDI for later use
    int 0x15                ; Call the BIOS to get memory map
    cmp eax, 0x534D4150     ; Check if BIOS returned the SMAP signature
    jne no_smap             ; Jump if not found
    add esi, 0x10           ; Skip the signature and size fields
    jmp print_os            ; Jump to the OS printing routine

no_smap:
    ; Print a message indicating that the SMAP signature was not found
    mov eax, 4              ; Select the SYS_WRITE function
    mov ebx, 1              ; Write to stdout
    mov ecx, os_msg         ; Load the address of the message to print
    mov edx, 18             ; Load the length of the message
    int 0x80                ; Call the kernel to print the message

print_os:
    ; Print the OS information
    mov eax, 4              ; Select the SYS_WRITE function
    mov ebx, 1              ; Write to stdout
    mov ecx, os_msg         ; Load the address of the message to print
    mov edx, 18             ; Load the length of the message
    int 0x80                ; Call the kernel to print the message
    mov eax, 0              ; Select the SYS_GETPID function
    int 0x80                ; Call the kernel to get the process ID
    add eax, '0'            ; Convert the process ID to ASCII
    mov [os_msg+18], al     ; Store the ASCII character in the message buffer
    mov edx, 19             ; Load the length of the message
    int 0x80                ; Call the kernel to print the message

    ; Print the CPU information
    mov eax, 0              ; Select the CPUID function
    cpuid                   ; Call the CPUID instruction
    mov ebx, 0              ; Set EBX to 0 for vendor string
    mov [cpu_msg+4], ebx    ; Store the vendor string in the message buffer
    mov [cpu_msg+8], edx
    mov [cpu_msg+12], ecx
    mov eax, 4              ; Select the SYS_WRITE function
    mov ebx, 1              ; Write to stdout
    mov ecx, cpu_msg        ; Load the address of the message to print
    mov edx, 48             ; Load the length of the message
    int 0x80                ; Call the kernel to print the message

    ; Print the RAM information
    mov eax, 0x48           ; Select the INT 0x15, AX=E801h
