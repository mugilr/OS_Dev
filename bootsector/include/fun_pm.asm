; hence bios won't helpfull in 32bit mode 
; this fun is not realy on BIOS for print string, etc.

[bits 32]

VIDEO_MEMORY equ 0xb8000	; its a video memory of x86
WHITE_ON_BLACK equ 0x0f

print_str_pm:
 pusha
 mov edx, VIDEO_MEMORY	;set edx to start with video mem

print_str_pm_loop:
 mov al, [esi]
 mov ah, WHITE_ON_BLACK

 cmp al, 0
 je print_str_pm_done

 mov [edx], ax
 add esi, 1
 add edx, 2

 jmp print_str_pm_loop

print_str_pm_done:
 popa
 ret

[bits 16]
