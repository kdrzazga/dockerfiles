[org 0x7e00]

BIOS_READ_SECTOR	equ 0x02

%include 'edu/macros.inc'

	print_msg
	
	call set_statistics

    ; 2 further sectors
    mov ah, BIOS_READ_SECTOR
    mov al, 2          ; Number of sectors to read
    mov ch, 0          ; Cylinder 0
    mov cl, 4          ; Sector 2
    mov dh, 0          ; Head 0
    mov bx, 0x8200     ; Buffer to read data into (0x7E00)
    int 0x13           ; Call BIOS interrupt to read the sector

    ; Jump to the loaded code at 0x7E00
    jmp 0x8200         ; Execute code from the second sector	

set_statistics:
	mov bx, STAT1
	mov byte[bx], 1
	mov bx, STAT2
	mov byte[bx], 0
	mov bx, STAT3
	mov byte[bx], 9
	mov bx, STAT4
	mov byte[bx], 4
    ret

msg:
    db "This is data read from sectors 2 - 3.", 10, 13, 0 ; Null-terminated message string

times 2*512-($-$$) db 0     ; Fill the rest of 10 sectors with NULLs
