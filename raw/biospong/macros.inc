BIOS_TELETYPE_OUT	equ 0x0E

%macro single_delay 0
		push cx
		mov cx, 0xffff       ; Adjust this value for longer/shorter delays
	.delay_loop2:
		nop
		loop .delay_loop2
		pop cx
%endmacro

%macro delay0xffff 0
		push cx
		mov cx, 0x13         ; Adjust this value for longer/shorter delays 0x12 optimal
	.delay_loop:
		nop
		single_delay
		loop .delay_loop      ; Decrement CX and loop while CX is not zero
		pop cx
%endmacro

%macro text_mode6 0
	mov ax, 0x0600
    int 0x10
%endmacro

%macro clrscr 0
	pusha
	mov ax, 0x0600  ; Function 0x06 - Scroll up window (this effectively clears the screen)
    mov bh, 0x03    ; Attributes (green on black)
    mov cx, 0       ; Upper left corner (row 0, column 0)
    mov dx, 0x184F  ; Lower right corner (row 24=0x18, column 79=0x4f)
    int 0x10        ; Call BIOS interrupt to clear the screen

	popa
%endmacro

%macro clr_bottom_scr 0
	pusha
	mov ax, 0x0600  ; Function 0x06 - Scroll up window (this effectively clears the screen)
    mov bh, 0x07    ; Attributes (light gray on black)
    mov cx, 0x0b00  ; Upper left corner (row 11, column 0)
    mov dx, 0x184F  ; Lower right corner (row 24=0x18, column 79=0x4f)
    int 0x10        ; Call BIOS interrupt to clear the screen

	popa
%endmacro

%macro print_msg 0
	push ax
	push ds
	push es
	push si
	xor ax, ax              ; Clear AX
	mov ds, ax              ; Set data segment to 0
	mov es, ax              ; Set extra segment to 0
	mov si, msg             ; Set SI to point to the message
	
	print:
		lodsb               ; Load character from SI into AL
		or al, al          ; Check for null terminator
		jz end_macro
	
		mov ah, BIOS_TELETYPE_OUT
		mov bh, 0
		mov bl, 4
		int 0x10
	
		jmp print
	
	end_macro:
	pop si
	pop es
	pop ds
	pop ax
%endmacro
