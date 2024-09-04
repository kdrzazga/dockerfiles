[org 0x8a00]

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	
	call print_stats
	
done:
    jmp $
	
print_stats:
	call copy_data_to_string
	pusha
	
	xor ax, ax              ; Clear AX
	mov ds, ax              ; Set data segment to 0
	mov es, ax              ; Set extra segment to 0
	mov si, stats_msg       ; Set SI to point to the message
	
	print2:
		lodsb               ; Load character from SI into AL
		or al, al          ; Check for null terminator
		jz end2
	
		mov ah, BIOS_TELETYPE_OUT
		mov bh, 0
		mov bl, 4
		int 0x10
	
		jmp print2
	
	end2:
	popa
ret	

copy_data_to_string:
	push ax
	mov al,[STAT1]
	add al, '0' ;convert to char
	mov [s1],al
	mov al,[STAT2]
	add al, '0'
	mov [s2],al
	mov al,[STAT3]
	add al, '0'
	mov [s3],al
	mov al,[STAT4]
	add al, '0'
	mov [s4],al
	pop ax
ret

msg:
    db 10, 13, "This is data read from sectors 8 - 9.", 13, 10, 0 ; Null-terminated message string

stats_msg:
	db 10, 13, "Statistics are following:", 10, 13, "STAT 1: "
s1:
	db '-'; placeholder
	db 10, 13, "STAT 2: "
s2:
	db '-'; placeholder
	db 10, 13, "STAT 3: "
s3:
	db '-'; placeholder
	db 10, 13, "STAT 4: "
s4:
	db '-' ;placeholder
	db 10, 13

termination:
	db 0

times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
