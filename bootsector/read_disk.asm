[org 0x7c00]

mov bp, 0xffff
mov sp, bp

call read_disk

mov si, my_msg
call print_str

jmp $

;reading a HDD drive 1st sectro 1s cylnder having the boot sector
read_disk:
 
 mov ah, 0x02	;read sector from drive
 mov al, 1	;number sector to read
 mov ch, 0	;cylinder on 0 1st cylinder
 mov cl, 2	;2nd sector bcoz sector for bootsector
 mov dh, 0	;1st read/write head

;segment reg
 mov bx, 0
 mov es, bx
 mov bx, 0x7c00+512



  int 0x13
 jc read_error	;jc=> jump carry flag | jump to read_error if cary flag to set by bios

 ret

read_error:
 mov si, disk_error
 call print_str
 jmp $

disk_error:
 db'error reading disk', 0

%include "fun_print.asm"


times 510-($-$$) db 0
dw 0xaa55

my_msg:
 db 'mem lodead?', 0

times 512 db 0	;some time full sector only loaded to make a full sector fill it with 0s
