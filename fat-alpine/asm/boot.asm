;nasm -f bin boot.asm -o boot.bin
;dd if=boot.bin of=booter.img bs=512 count=1 conv=notrunc

[ORG 0x7C00]        ; Set the origin of the code to 0x7C00
BITS 16              ; Set code generation to 16-bit mode

start:
    jmp near main  ; Jump to main code

; Boot sector padding to fill up to 512 bytes
times 510-($-$$) db 0
dw 0xAA55           ; Boot signature

main:
    ; Set up the segment registers to point to the text buffer
    mov ax, 0x07C0      ; Set up a segment address to access the boot sector
    add ax, 288         ; Add the offset where the text buffer begins
    mov ds, ax          ; Set DS to the segment address

    ; Write "Hello Computer" to the text buffer using BIOS interrupts
    mov si, msg         ; Set SI to point to the message string
    call print_string   ; Call the print_string subroutine

    ; Infinite loop to prevent the code from exiting
    cli
    hlt
    jmp $

print_string:
    ; Print the string pointed to by SI
    ; Assumes that DS points to the segment containing the string
    mov ah, 0x0E        ; BIOS teletype function
    mov bh, 0x00        ; Page number (0 for mode 3 text)
.loop:
    lodsb               ; Load the next character from the string
    cmp al, 0           ; Check for the end of the string
    je .done
    int 0x10            ; Call BIOS interrupt to print the character
    jmp .loop
.done:
    ret

msg db 'Hello Computer', 0

