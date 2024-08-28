[org 0x7C00]

BIOS_TELETYPE	equ 0x0E
ENTER_KEY	equ 0x0D
ESC_KEY	equ 0x1B
LIGHT_GREEN   		equ 0x0A
PAGE_NUM      		equ 0      ; Page number, usually 0
BIOS_READ_SECTOR	equ 0x02
BIOS_READ_KEYBOARD	equ 0x00
BIOS_RESET	equ 0x0000

; Set graphical mode 320x200, 16 colors
mov ax, 0x0008      
int 0x10

xor ax, ax              ; Clear AX
mov ds, ax              ; Set data segment to 0
mov es, ax              ; Set extra segment to 0
mov si, msg             ; Set SI to point to the message

print:
    lodsb               ; Load character from SI into AL
    or al, al          ; Check for null terminator
    jz wait_for_key

    mov ah, BIOS_TELETYPE
    mov bh, PAGE_NUM
    mov bl, LIGHT_GREEN
    int 0x10

    jmp print

wait_for_key:
    ; Wait for a key press
    mov ah, BIOS_READ_KEYBOARD
    int 0x16

    cmp al, ENTER_KEY
    je read_second_sector

    cmp al, ESC_KEY 
    je reset 

    jmp wait_for_key

read_second_sector:
    ; Read the second sector (cylinder 0, head 0, sector 2)
    mov ah, BIOS_READ_SECTOR
    mov al, 5          ; Number of sectors to read
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
    db "This program will present all the graphical and text modes of BIOS available for 10h interrrupt. Enjoy!", 10, 10, 13, "Press ENTER to continue.", 10, 13, 0

error_msg:
    db "Error reading sector.", 10, 0 ; Null-terminated error message string

times 510-($-$$) db 0     ; Fill the rest of the sector with zeros
dw 0xAA55                 ; Boot signature END OF MASTER BOOT RECORD
