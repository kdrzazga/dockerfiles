[org 0x7e00]

RBIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

    text_mode6
	clrscr80x25
	print_msg
	

    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2          ; Number of sectors to read
    mov ch, 0          ; Cylinder 0
    mov cl, 4          ; Sector 2
    mov dh, 0          ; Head 0
    mov bx, 0x8200     ; Buffer to read data into (0x7E00)
    int 0x13           ; Call BIOS interrupt to read the sector

    ; Check if the read operation was successful
    jc error           ; If CF is set, jump to error handling

    ; Jump to the loaded code at 0x7E00
    jmp 0x8200         ; Execute code from the second sector	

done:
    jmp $

msg:
    db 10, 10, 13, "This is data read from sectors 2 - 3.", 10, 13, 0 ; Null-terminated message string


times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
