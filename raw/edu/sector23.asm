[org 0x7e00]

NEXT_SECTOR			equ	4
NEXT_TARGET_ADDR	equ 0x8200

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	call set_statistics
	
    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2
    mov ch, 0
    mov cl, NEXT_SECTOR
    mov dh, 0
    mov bx, NEXT_TARGET_ADDR
    int 0x13
	
    jmp NEXT_TARGET_ADDR

set_statistics:
	mov bx, STAT1
	mov byte[bx], 8
	mov bx, STAT2
	mov byte[bx], 5
	mov bx, STAT3
	mov byte[bx], 2
	mov bx, STAT4
	mov byte[bx], 0
    ret	
	
done:
    jmp $

msg:
    db "This is data read from sectors 2 - 3", 10, 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
