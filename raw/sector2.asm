[org 0x7e00]

TELETYPE_OUT	equ 0x0E
RED		equ 4

    xor ax, ax              ; Clear AX
    mov ds, ax              ; Set data segment to 0
    mov es, ax              ; Set extra segment to 0
    mov si, msg             ; Set SI to point to the message

print:
    lodsb                   ; Load character from SI into AL
    or al, al               ; Check for null terminator
    jz done
	
	mov ah, TELETYPE_OUT
    mov bh, 0              ; Page number (usually 0)
    mov bl, RED
    int 0x10

    jmp print

done:
    jmp $                  ; Infinite loop to exit

msg:
    db 10, 10, 13, "This is data read from sector 2", 10, 13, 0 ; Null-terminated message string


times 512-($-$$) db 0     ; Fill the rest of the sector with 
