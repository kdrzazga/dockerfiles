; Define variables in the data section
SECTION .data
	hello:     db 'Hello world!',10
	line1:     db 'This is a fragment of Gall Anonim Chronicle about the history of Poland. Below the fragment about prince Popiel:',10
	line2:     db 'Et factum est autem, ut ab una muliere orta sit seditione gens magna, quae vocatur Lestko, et publice insurgerent contra ducem Popiel. '
	line3:     db 'Cuius Popiel exitus fuit, ut interiit in profundum lacum, vocatur autem ille lacus Druzno; nam utpote verissima est, res maxime inter gentem nostram celeberrima.'
	line4:	   db 'Hoc itaque facto secundum libitum suum Lestko dux est electus, et a populo unanimi consensu est susceptus',10
	helloLen:  equ $-hello

; Code goes in the text section
SECTION .text
	GLOBAL _start 

_start:
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel

	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel