[org 0x8200]

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	
    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2
    mov ch, 0
    mov cl, 6
    mov dh, 0
    mov bx, 0x8600
    int 0x13
	
    jmp 0x8600         ; Execute code from the second sector		
done:
    jmp $

msg:
    db 10, 13, "This is data read from sectors 4-5.", 10, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
