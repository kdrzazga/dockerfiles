[org 0x7e00]

RED		equ 4

%include 'edu/macros.inc'

    text_mode6	
	print_msg
	
done:
    jmp $

msg:
    db 10, 10, 13, "This is data read from sectors 2 - 10e", 10, 13, 0 ; Null-terminated message string


times 10*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
