[org 0x8600]

NEXT_SECTOR			equ	8
NEXT_TARGET_ADDR	equ 0x8a00

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	call change_stats
	
    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2
    mov ch, 0
    mov cl, NEXT_SECTOR
    mov dh, 0
    mov bx, NEXT_TARGET_ADDR
    int 0x13
	
    jmp NEXT_TARGET_ADDR

change_stats:
	dec byte [STAT1]
	dec byte [STAT2]
	inc byte [STAT3]
	inc byte [STAT4]
ret
	
done:
    jmp $

msg:
    db "This is data read from sectors 6 - 7.", 10, 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
