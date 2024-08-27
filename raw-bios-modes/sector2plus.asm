[org 0x7e00]

BIOS_TELETYPE	equ 0x0E
ENTER_KEY	equ 0x0D
ESC_KEY	equ 0x1B
LIGHT_GREEN   		equ 0x0A
PAGE_NUM      		equ 0      ; Page number, usually 0
BIOS_READ_SECTOR	equ 0x02
BIOS_READ_KEYBOARD	equ 0x00
BIOS_RESET	equ 0x0000

mov ax, 0x0000
int 0x10

xor ax, ax          ; Clear AX
mov ds, ax              ; Set data segment to 0
mov es, ax              ; Set extra segment to 0

mov si, msg00h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0001
int 0x10
mov si, msg01h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0002
int 0x10
mov si, msg02h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0003
int 0x10
mov si, msg03h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0004
int 0x10
mov si, msg04h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0005
int 0x10
mov si, msg05h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0006
int 0x10
mov si, msg06h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0007
int 0x10
mov si, msg07h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0008
int 0x10
mov si, msg07h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0009
int 0x10
mov si, msg09h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x000a
int 0x10
mov si, msg0ah             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x000d
int 0x10
mov si, msg0dh             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x000e
int 0x10
mov si, msg0eh             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x000f
int 0x10
mov si, msg0fh             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0010
int 0x10
mov si, msg10h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0011
int 0x10
mov si, msg11h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0012
int 0x10
mov si, msg12h             ; Set SI to point to the message
call print
call wait_for_key

mov ax, 0x0013
int 0x10
mov si, msg13h             ; Set SI to point to the message
call print
call wait_for_key


jmp reset

print:
    lodsb               ; Load character from SI into AL
    or al, al          ; Check for null terminator
    jz wait_for_key

    mov ah, BIOS_TELETYPE
    mov bh, PAGE_NUM
    mov bl, LIGHT_GREEN
    int 0x10

    jmp print
	
	ret

wait_for_key:
    ; Wait for a key press
    mov ah, BIOS_READ_KEYBOARD
    int 0x16
	ret

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

msg00h:
    db "mov ax, 0x0000 int 0x10 Text 40x25 chars Greyscale", 10, 13, 0
msg01h:
    db "mov ax, 0x0001 int 0x10 Text 40x25 chars Color", 10, 13, 0
msg02h:
    db "mov ax, 0x0002 int 0x10 Text 80x25 chars Greyscale", 10, 13, 0
msg03h:
    db "mov ax, 0x0003 int 0x10 Text 80x25 chars Color", 10, 13, 0
msg04h:
    db "mov ax, 0x0004 int 0x10 Graphics 320x200 pixels Color", 10, 13, 0
msg05h:
    db "mov ax, 0x0005 int 0x10 Graphics 320x200 pixels Greyscale", 10, 13, 0
msg06h:
    db "mov ax, 0x0006 int 0x10 Graphics 540x200 px Monochrome", 10, 13, 0
msg07h:
    db "mov ax, 0x0007 int 0x10 Text 80x25 chars Monochrome", 10, 13, 0
msg08h:
    db "mov ax, 0x0008 int 0x10 Graphics 160x200 px Color", 10, 13, 0
msg09h:
    db "mov ax, 0x0009 int 0x10 Graphics 320x200 px Color", 10, 13, 0
msg0ah:
    db "mov ax, 0x000a int 0x10 Graphics 640x200 px Color", 10, 13, 0
msg0dh:
    db "mov ax, 0x000d int 0x10 Graphics 320x200 px Color", 10, 13, 0
msg0eh:
    db "mov ax, 0x000e int 0x10 Graphics 640x200 px Color", 10, 13, 0
msg0fh:
    db "mov ax, 0x000f int 0x10 Graphics 640x350 px Monochrome", 10, 13, 0
msg10h:
    db "mov ax, 0x0010 int 0x10 Graphics 640x350 px Color", 10, 13, 0
msg11h:
    db "mov ax, 0x0011 int 0x10 Graphics 640x480 px Monochrome", 10, 13, 0
msg12h:
    db "mov ax, 0x0012 int 0x10 Graphics 640x480 px Color", 10, 13, 0
msg13h:
    db "mov ax, 0x0013 int 0x10 Graphics 320x200 px Color", 10, 13, 0

error_msg:
    db "Error reading sector.", 10, 0 ; Null-terminated error message string

times 5*512-($-$$) db 0
