[org 0x7c00]
	mov ax, 0x000d    ; graphical mode 320x200, 16 colors, 40x25 text resolution
	int 0x10
    xor ax, ax        ; Clear AX
    mov ds, ax        ; Set data segment to 0
    mov es, ax        ; Set extra segment to 0
    mov si, msg       ; Set SI to point to the message

print:
    lodsb             ; Load character from SI into AL
    or al, al        ; Check for null terminator
    jz done           ; If null terminator, jump to done

    ; Set color attribute (0x0A means light green text on black background)
    mov ah, 0x0E     ; Teletype output function
    mov bh, 0        ; Page number (usually 0)
    mov bl, 0x0A     ; Light green text on black background
    int 0x10         ; Call BIOS interrupt to print character with color (only for graphical mode)

    jmp print         ; Loop back to print the next character
    
done:
    jmp $             ; Infinite loop to exit

msg:
    db "Your PC has been started, so you should be happy.", 10, 10, 13, "Press ENTER to reset.", 0 ; Null-terminated message string

times 510-($-$$) db 0 ; Fill the rest of the sector with zeros
dw 0xaa55             ; Boot signature