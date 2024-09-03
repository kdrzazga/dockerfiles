[org 0x8a00]

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	
done:
    jmp $

msg:
    db 10, 13, "This is data read from sectors 8-9.", 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
