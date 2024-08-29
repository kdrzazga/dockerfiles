[org 0x7e00]

WHITE         equ 15                ; Color for the ball
LIGHT_GRAY    equ 8                 ; Color for the bat
BIOS_TELETYPE	equ 0x0E
LIGHT_GREEN	equ 0x0A
LIGHT_BLUE   		equ 9
PAGE_NUM	equ 0

mov ax, 0x0013
int 0x10

loop:
	call clrscr
	call draw_bat
	call draw_ball
	jmp getkey
	
reset:
    mov ax, 0x0000
    int 0x19

getkey:
    mov ah, 0
    int 0x16
	
	cmp al, 48       ; Check if we've pressed '0'
    je up_arrow
	
	cmp al, 50
	je down_arrow
	
	cmp al,27
	je reset

	jmp loop

up_arrow:
	mov ax, [bat_y]
	;cmp ax, 0
	;jle skip_decrease
	dec ax
	mov [bat_y], ax
	
skip_decrease:
	jmp loop

down_arrow:
	mov ax, [bat_y]
	add ax, 1
	mov [bat_y], ax
jmp loop

clrscr:
    mov ax, 0xa000        ; Point to video memory
    mov es, ax            ; Set ES to point to the video segment
    xor di, di            ; Clear DI (offset within video memory)
    mov cx, 64000         ; Number of bytes to fill (320 * 200)

    mov al, 255
	black_fill:    
		mov [es:di], al ; Fill the byte with white
		inc di               ; Move to the next pixel
		loop black_fill       ; Decrement CX and continue until zero
	ret

draw_bat:
    mov ax, 0xa000 	
    mov es, ax
	mov al,0b11101011
	
	push ax
	mov ax, [bat_y]
	mov bx, 640
	mul bx
	add ax, 40
	mov di, ax
	pop ax
	mov cx, 25
	fill2:
		mov [es:di], al
		inc di
		mov [es:di], al
		add di, 640 - 1
		loop fill2
	ret

	
draw_ball:
	ret

bat_width: dw 20  
ball_x: dw 120
ball_y: dw 120
bat_x: dw 10
bat_y: dw 40

times 10*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs