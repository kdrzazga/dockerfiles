%macro readkey 0
    mov eax, 3                  ; 'read' system call
    mov ebx, 0                  ; file descriptor 0 = STDIN
    mov ecx, buffer             ; buffer address
    mov edx, 1                  ; number of bytes to read
    int LINUX_KERNEL_INTRPT      ; call the kernel
%endmacro

%macro writemsg 2
    mov eax, 4                  ; 'write' system call
    mov ebx, 1                  ; file descriptor 1 = STDOUT
    mov ecx, %1                 ; string to write
    mov edx, %2                 ; length of string to write
    int LINUX_KERNEL_INTRPT      ; call the kernel
%endmacro

%macro increase 1
    mov al, [%1]
    inc al
    mov [%1], al
    jmp main_loop
%endmacro

%define LINUX_KERNEL_INTRPT 80h

section .data
    hello:     db 'Hello!',10
	helloLen:  equ $-hello
    help:      db 'h - help, c - clear screen, x - exit.', 10
    helpLen:   equ $-help
	error:	   db  'unknown command', 10
	errorLen   equ $-error
    exit_msg:  db 'BYE !', 10
    exitLen:   equ $-exit_msg
	status:	   db '+--+--+--+--+--+--+--+--+', 10
			   db '| 0| 1| 2| 3| 4| 5| 6| 7|', 10
			   db '+--+--+--+--+--+--+--+--+', 10
			   db '| '
	m1:		   db 48
			   db '| '
	m2:		   db 48
			   db '| '
	m3:		   db 48
			   db '| '
	m4:		   db 48
			   db '| '
	m5:		   db 48
			   db '| '
	m6:		   db 48
			   db '| '
	m7:		   db 48
			   db '| '
	m8:		   db 48
			   db '| ',10
			   db '+--+--+--+--+--+--+--+--+', 10

	statusLen: equ $-status

section .text
    global _start

_start:
    ; Display initial message
    writemsg hello, helloLen

main_loop:

    readkey

    cmp byte [buffer], 'h'
    je display_help

    cmp byte [buffer], 's'
    je write_status

    cmp byte [buffer], 'x'
    je exit_program
	
    cmp byte [buffer], '1'
    je cell1	
    cmp byte [buffer], '2'
    je cell2	
    cmp byte [buffer], '3'
    je cell3	
    cmp byte [buffer], '4'
    je cell4	
    cmp byte [buffer], '5'
    je cell5	
    cmp byte [buffer], '6'
    je cell6	
    cmp byte [buffer], '7'
    je cell7	
    cmp byte [buffer], '8'
    je cell8

    cmp byte [buffer], 'c'
    je clear_screen

    writemsg error, errorLen
    jmp main_loop

display_help:
    writemsg help, helpLen
    jmp main_loop

write_status:
    writemsg status, statusLen
    jmp main_loop

cell1:
	increase m1
cell2:
	increase m2
cell3:
	increase m3
cell4:
	increase m4
cell5:
	increase m5
cell6:
	increase m6
cell7:
	increase m7
cell8:
	increase m8

clear_screen:
    mov eax, 4                  ; 'write' system call
    mov ebx, 1                  ; file descriptor 1 = STDOUT
    mov ecx, clear_screen
    mov edx, 4
    int LINUX_KERNEL_INTRPT      ; call the kernel
    jmp main_loop

exit_program:
    ; Display exit message
    writemsg exit_msg, exitLen

    ; Terminate program
    mov eax, 1            ; 'exit' system call
    xor ebx, ebx          ; exit with error code 0
    int LINUX_KERNEL_INTRPT  ; call the kernel

section .bss
    buffer resb 1         ; buffer to store user input
	