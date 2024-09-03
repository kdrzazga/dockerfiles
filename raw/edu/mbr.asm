[org 0x7C00]

BIOS_TELETYPE	equ 0x0E
ENTER_KEY	equ 0x0D
ESC_KEY	equ 0x1B
LIGHT_GREEN   		equ 0x0A
PAGE_NUM      		equ 0      ; Page number, usually 0
BIOS_READ_SECTOR	equ 0x02
BIOS_READ_KEYBOARD	equ 0x00
BIOS_RESET	equ 0x0000

%include 'edu/macros.inc'

print_msg

read_second_sector:
    ; Read the second sector (cylinder 0, head 0, sector 2)
    mov ah, BIOS_READ_SECTOR
    mov al, 2          ; Number of sectors to read
    mov ch, 0          ; Cylinder 0
    mov cl, 2          ; Sector 2
    mov dh, 0          ; Head 0
    mov bx, 0x7E00     ; Buffer to read data into (0x7E00)
    int 0x13           ; Call BIOS interrupt to read the sector

    ; Check if the read operation was successful
    jc error           ; If CF is set, jump to error handling

    ; Jump to the loaded code at 0x7E00
    jmp 0x7E00         ; Execute code from the second sector

error:
    ; Handle error (e.g., infinite loop)
    mov si, error_msg
    call print_error
    jmp $              ; Halt the system

reset:
    mov ax, BIOS_RESET
    int 0x19

print_error:
    ; Print the error message
    mov si, error_msg
error_print:
    lodsb              ; Load character from error message into AL
    or al, al         ; Check for null terminator
    jz done_error      ; If null terminator, jump to done
    mov ah, BIOS_TELETYPE;
    int 0x10          ; Print character
    jmp error_print    ; Loop back to print next character

done_error:
    jmp $              ; Infinite loop to exit

msg:
    db "This is data from sector 1 (Master Boot Record).", 10, 13, 0

error_msg:
    db "Error reading sector.", 10, 0

times 510-($-$$) db 0
dw 0xAA55
