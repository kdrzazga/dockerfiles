[org 0x7e00]

RED		equ 4

%include 'edu/macros.inc'

    text_mode6
	clrscr80x25
	print_msg
	
loop:
	mov al, 'o'             ; Character to display
    mov ah, 0x0E            ; Function to write character
    int 0x10                ; Call BIOS interrupt
    clrscr80x25
	mov al, 'o'             ; Character to display
    mov ah, 0x0E            ; Function to write character
    int 0x10                ; Call BIOS interrupt
    mov ah, 0x02            ; Function to set cursor position
    mov bh, 0               ; Page number (typically 0)
    
    ; Load positions into DL and DH
    mov dl, [pos_x + bx]    ; Column (X position)
    mov dh, [pos_y + bx]    ; Row (Y position)
    
    int 0x10                ; Call BIOS interrupt to set cursor position

    delay0xffff
    mov al, 'o'             ; Character to display
    mov ah, 0x0E            ; Function to write character
    int 0x10                ; Call BIOS interrupt

    ; Increment the index and wrap around
    inc bx
    cmp bx, pos_count       ; Compare index with number of positions
    jl loop                ; If index < pos_count, continue loop
    xor bx, bx              ; Else, reset index to 0
    jmp loop               ; Repeat the loop
	
done:
    jmp $

msg:
    db 10, 10, 13, "This is data read from sectors 2 - 10h. Press any key.", 10, 13, 0 ; Null-terminated message string

pos_x: db 30, 31, 32, 33, 34, 35, 36, 37, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 27, 27, 26, 25, 24, 23, 24, 25, 26, 27, 28, 29
pos_y: db 15, 16, 16, 16, 16, 16, 17, 18, 19, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9,  8,   7,  6,  7,  8,  9, 10, 11, 12, 13, 14  
pos_count: equ 32                   ; Number of positions in pos_x and pos_y

times 10*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
