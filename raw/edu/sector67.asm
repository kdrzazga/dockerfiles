[org 0x8600]

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	
    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2
    mov ch, 0
    mov cl, 8
    mov dh, 0
    mov bx, 0x8a00
    int 0x13
	
    jmp 0x8a00         ; Execute code from the second sector		
done:
    jmp $

msg:
    db "This is data read from sectors 6 - 7.", 10, 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
