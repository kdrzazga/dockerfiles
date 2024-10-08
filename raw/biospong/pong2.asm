[org 0x8200]

BIOS_READ_KEYBOARD	equ 0x00
BIOS_READ_SECTOR	equ 0x02
ESC_KEY	equ 0x1B

%include 'biospong/macros.inc'

print_msg
;clr_bottom_scr
single_delay
	
loop:
    clr_bottom_scr
	mov al, 'o'
    mov ah, 0x0E
    int 0x10
    mov ah, 0x02
    mov bh, 0
    
    mov dl, [pos_x + bx]    ; Column (X position)
    mov dh, [pos_y + bx]    ; Row (Y position)
    
    int 0x10

    delay0xffff

    inc bx
    cmp bx, [pos_count]      ; Compare index with number of positions
    jl loop
    xor bx, bx              ; reset index to 0
    jmp loop               ; Repeat the loop


pos_x: 	db 03, 04, 05, 06, 07, 08, 09, 10, 11   ;9 data
		db 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 13, 12, 11, 10, 09, 08, 07, 06, 05, 05, 05, 05, 05, 05, 05, 05
		db 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18 ;14
		db 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 28, 28, 28, 28, 28, 28, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 18, 18, 18, 18, 18, 18, 18
		db 18, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38 ;22
		
		db 37, 36, 35, 35, 35, 36, 37, 38, 38, 39, 39, 38, 37, 36, 35, 35, 35, 36, 37, 38, 38, 39, 39, 38 ;24 - 2 circles
		db 37, 36, 35, 34, 34, 34, 34, 34, 34, 34, 34, 34 ;12
		db 34, 34, 34, 34, 34, 34, 34, 34, 34, 35, 36, 36, 37, 37, 38, 38, 39, 40, 40, 40, 40, 40, 40, 40, 40; 25- letter N
		db 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40 ;19
		db 39, 40, 39, 40, 39, 40, 39, 40, 39 ;9
		db 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54 ;15
		
		db 55, 55, 55, 55, 55, 54, 53, 52, 51, 52, 53, 54, 55, 55, 55, 55, 55, 54, 53, 52, 51, 50, 49, 48, 47, 47, 47, 47, 47, 47, 47, 47, 48, 49, 50, 51, 52, 53; 38- letter G
		
buffer:
		db 5 dup(0)
		
pos_y: 	db 11, 12, 13, 14, 15, 16, 17, 18, 19 ;9
		db 20, 21, 22, 23, 24, 23, 22, 21, 20, 21, 22, 23, 24, 23, 22, 21, 20, 21, 22, 23, 24, 23, 22, 21, 20, 21
		db 13, 14, 15, 16, 15, 14, 13, 12, 13, 12, 11, 11, 11, 11 ;14
		db 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 09, 08, 07, 06, 05, 04, 03, 02, 02, 02, 02, 02, 02, 02, 02, 02, 03, 04, 05, 06, 07, 08, 09, 10  ;letter O
		db 11, 12, 13, 14, 15, 14, 13, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 24, 24 ;22
		
		db 23, 23, 22, 21, 20, 19, 19, 20, 21, 21, 22, 23, 23, 23, 22, 21, 20, 19, 19, 20, 21, 21, 22, 23; 2 circles
		db 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11
		db 10, 09, 08, 07, 06, 05, 04, 03, 02, 03, 04, 05, 06, 07, 08, 09, 10, 09, 08, 07, 06, 05, 04, 03, 02; letter N
		db 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 ;19
		db 20, 18, 17, 16, 15, 16, 17, 18, 19 ;9
		db 19, 18, 17, 16, 15, 14, 13, 12, 11, 11, 11, 11, 11, 11, 11; 15
		
		db 10, 09, 08, 07, 06, 06, 06, 06, 06, 06, 06, 06, 06, 07, 08, 09, 10, 10, 10, 10, 10, 10, 10, 10, 10, 09, 08, 07, 06, 05, 04, 03, 02, 02, 02, 02, 02, 02; letter G

buffer2:
		db 5 dup(0)

pos_count: dw 255

msg:
    db 10, 10, 10, 13, "3rd part", 10, 13, 0 ; Null-terminated message string
	
times 2*512-($-$$) db 0     ; Fill the rest of 3 sectors with NULLs
