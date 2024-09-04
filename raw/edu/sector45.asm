[org 0x8200]

NEXT_SECTOR			equ	6
NEXT_TARGET_ADDR	equ 0x8600

BIOS_READ_SECTOR	equ 0x02


%include 'edu/macros.inc'

	print_msg
	
	call change_stats
	
    mov ah, BIOS_READ_SECTOR
    mov al, 2
    mov ch, 0
    mov cl, NEXT_SECTOR
    mov dh, 0
    mov bx, NEXT_TARGET_ADDR
    int 0x13
	
    jmp NEXT_TARGET_ADDR

change_stats:
	inc byte [STAT1]
	inc byte [STAT2]
	inc byte [STAT3]
	inc byte [STAT4]
ret

msg:
    db "This is data read from sectors 4 - 5", 10, 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
