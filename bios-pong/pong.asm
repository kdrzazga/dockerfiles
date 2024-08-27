[org 0x7e00]

WHITE         equ 15                ; Color for the ball
LIGHT_GRAY    equ 8                 ; Color for the bat
BIOS_TELETYPE	equ 0x0E
LIGHT_GREEN	equ 0x0A
LIGHT_BLUE   		equ 9
PAGE_NUM	equ 0

mov ax, 0x0012        
int 0x10

loop:
	call clrscr
	call draw_bat
	call draw_ball
    mov ah, 0		;wait key
    int 0x16
	
    reset:
    mov ax, 0x0000
    int 0x19

clrscr:
    mov ax, 0xa000        ; Point to video memory
    mov es, ax            ; Set ES to point to the video segment
    xor di, di            ; Clear DI (offset within video memory)
    mov cx, 64000         ; Number of bytes to fill (320 * 200)

private:
    mov al, 0b10101010           ; Set AL to 0 (to fill black)
	black_fill:    
		mov [es:di], al ; Fill the byte with black
		inc di               ; Move to the next pixel
		loop black_fill       ; Decrement CX and continue until zero
	ret

draw_bat:
	push bx
    mov ax, 0xA000          ; Segment address for video memory
    mov es, ax              ; Set ES to point to video memory
    xor di, di              ; Clear DI (offset)

    mov ax, [bat_y]         ; Use word for position
    mov cx, 320
    mul cx                  ; Y * 320 (width)
    add di, ax              ; Add y offset
    add di, [bat_x]         ; Add x position
    ; No shl needed if in 256-color mode (we'll use bytes)

    mov cx, [bat_width]     ; Assuming you have defined width
    mov al, LIGHT_GREEN       ; Load color into AL
    draw_bat_loop:
        mov [es:di], bl       ; Set the pixel color
        inc di                ; Next pixel
        loop draw_bat_loop    ; Loop through width
    pop bx
	ret
	
draw_ball:
	ret

bat_width: dw 20  
ball_x: dw 120
ball_y: dw 120
bat_x: dw 10
bat_y: dw 100

times 10*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs