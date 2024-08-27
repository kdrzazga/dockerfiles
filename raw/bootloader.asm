[org 0x7c00]
    mov ax, 0x000d          ; Set graphical mode 320x200, 16 colors
    int 0x10

    xor ax, ax              ; Clear AX
    mov ds, ax              ; Set data segment to 0
    mov es, ax              ; Set extra segment to 0
    mov si, msg             ; Set SI to point to the message

print:
    lodsb                   ; Load character from SI into AL
    or al, al               ; Check for null terminator
    jz wait_for_key         ; If null terminator, jump to wait_for_key

    ; Set color attribute (0x0A means light green text on black background)
    mov ah, 0x0E           ; Teletype output function
    mov bh, 0              ; Page number (usually 0)
    mov bl, 0x0A           ; Light green text on black background
    int 0x10               ; Call BIOS interrupt to print character

    jmp print               ; Loop back to print the next character

wait_for_key:
    ; Wait for a key press
    mov ah, 0x00           ; Function to read keyboard input
    int 0x16               ; Call BIOS keyboard interrupt

    ; Check if the key pressed is Enter (ASCII 0x0D)
    cmp al, 0x0D           ; Compare AL with ASCII code for Enter
    je read_second_sector   ; If Enter, jump to read_second_sector

    ; Check if the key pressed is ESC (ASCII 0x1B)
    cmp al, 0x1B           ; Compare AL with ASCII code for ESC
    je reset                ; If ESC, jump to reset

    jmp wait_for_key        ; If not Enter or ESC, wait again

read_second_sector:
    ; Read the second sector (cylinder 0, head 0, sector 2)
    mov ah, 0x02           ; BIOS function to read sectors
    mov al, 1              ; Number of sectors to read
    mov ch, 0              ; Cylinder 0
    mov cl, 2              ; Sector 2
    mov dh, 0              ; Head 0
    mov bx, 0x7E00         ; Buffer to read data into (0x7E00 - 0x7FFF)
    int 0x13               ; Call BIOS interrupt to read sector

    ; Check if the read operation was successful
    jc error               ; If CF is set, jump to error handling

    ; Jump to the loaded code at 0x7E00
    jmp 0x7E00             ; Execute code from the second sector

error:
    ; Handle error (e.g., infinite loop)
    mov si, error_msg
    call print_error
    jmp $                  ; Halt the system

reset:
    ; Reset the machine (software reset)
    mov ax, 0x0000         ; Set up reset
    int 0x19               ; Call BIOS to reset the system

print_error:
    ; Print the error message
    mov si, error_msg
error_print:
    lodsb                  ; Load character from SI into AL
    or al, al             ; Check for null terminator
    jz done_error         ; If null terminator, jump to done
    mov ah, 0x0E          ; Teletype output function
    int 0x10              ; Print character
    jmp error_print

done_error:
    jmp $                  ; Infinite loop to exit

msg:
    db "Your PC has been started, so you should be happy.", 10, 10, 13, "Press:", 10, 13, " ENTER to continue.", 10, 13, " ESC to reset (and read this menu again)", 10, 13, 0 ; Null-terminated message string

error_msg:
    db "Error reading sector.", 10, 0 ; Null-terminated error message string

times 510-($-$$) db 0     ; Fill the rest of the sector with zeros
dw 0xaa55                 ; Boot signature  END OF MASTER BOOT RECORD

second_sector:

clear_screen:
;    mov ax, 0x0600            ; Function 06h (scroll up), AL = 00h (clear the screen)
;    mov bh, 0x07              ; Set attribute to light gray on black
;    mov cx, 0x0000            ; Number of lines to scroll
;    mov dx, 0x184F            ; Define area: top left (0,0) to bottom right (24,79)
;    int 0x10                  ; Call BIOS interrupt to scroll screen
;    ret