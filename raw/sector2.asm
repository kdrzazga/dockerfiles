[org 0x7e00]

    xor ax, ax              ; Clear AX
    mov ds, ax              ; Set data segment to 0
    mov es, ax              ; Set extra segment to 0
    mov si, msg             ; Set SI to point to the message

print:
    lodsb                   ; Load character from SI into AL
    or al, al               ; Check for null terminator
    jz done         ; If null terminator, jump to wait_for_key

    ; Set color attribute (0x0A means light green text on black background)
    mov ah, 0x0E           ; Teletype output function
    mov bh, 0              ; Page number (usually 0)
    mov bl, 0x0A           ; Light green text on black background
    int 0x10               ; Call BIOS interrupt to print character

    jmp print               ; Loop back to print the next character

done:
    jmp $                  ; Infinite loop to exit

msg:
    db 10, 10, 13, "This is data read from sector 2", 10, 13, 0 ; Null-terminated message string


times 512-($-$$) db 0     ; Fill the rest of the sector with 
