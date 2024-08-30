BIOS_TELETYPE_OUT	equ 0x0E

%macro text_mode6 0
	mov ax, 0x0600
    int 0x10
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
