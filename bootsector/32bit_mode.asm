[org 0x7c00]

mov bp, 0xffff
mov sp, bp


mov si, msg_realm
call print_str

mov si, msg_kernel
call print_str

mov al, 9
mov bx, kernel_entry	; passs [0x7e00] 3nd sector
call read_disk

; switch to protected mode
call switch_to_pm

jmp $


%include "include/fun_print.asm"
%include "include/switch_pm.asm"
%include "include/fun_pm.asm"

[bits 32]
;bios is nomore helpfull in 32 bit mode
BEGIN_PM:
 ; 0xb8000 is video mem

 mov si, msg_protm
 call print_str_pm

[bits 16]


msg_realm  db "in 16-bit real mode ", 0
msg_protm  db "in 32-bit protected mode ", 0
msg_kernel db "in kernel from the disk to address 0x7e00 ",0

times 510-($-$$) db 0
dw 0xaa55

kernel_entry:
 
