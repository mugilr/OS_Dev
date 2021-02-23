[org 0x7c00]

mov bp, 0xffff
mov sp, bp

mov si, my_msg
call print_str

jmp $



%include "fun_print.asm"

my_msg:
 db 'mem lodead?'



times 510-($-$$) db 0
dw 0xaa55
