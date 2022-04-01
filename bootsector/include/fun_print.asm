[org 0x7c00]

hex:
 db '0x????', 0
hexbet:
 db '0123456789abcdef'

print_h:
 push bx
 push si
 mov si, hex

 mov bx, dx		;bx -> 0x1234 since dx=0x1234
 shr bx, 12		;bx -> 0x0001 right shift of 12 bits
 mov bx, [bx+hexbet]
 mov [hex+2], bl

 mov bx, dx
 shr bx, 8		;bx = 0x0012
 and bx, 0x000f		;bx = 0x0002
 mov bx, [bx+hexbet]
 mov [hex+3], bl

 mov bx, dx
 shr bx, 4
 and bx, 0x000f
 mov bx, [bx+hexbet]
 mov [hex+4], bl

 mov bx, dx
 and bx, 0x000f
 mov bx, [bx+hexbet]
 mov [hex+5], bl

; mov [hex], byte 'A'
 call print_str
 pop si
 pop bx
 ret

print_str:
 _loop:
  lodsb		;mov al,[si] ;lodsb load string buffer
  cmp al, 0
  je _end
  mov ah, 0x0e
  int 0x10
  ;inc si	; add si, 1
  jmp _loop
 _end:
 ;pop bx
 ;jmp bx
 ret ;equalent to above 2 lines

print_char:
 mov ah, 0x0e
 int 0x10
 mov ax, 'B'
 add ax, 1
 ret
 
read_disk:
 pusha
 mov ah, 0x02	;read sector from drive
 ;mov al, 1	;number sector to read
 mov ch, 0	;cylinder on 0 1st cylinder
 mov cl, 2	;2nd sector bcoz sector for bootsector
 mov dh, 0	;1st read/write head

;segment reg
 push bx
 mov bx, 0
 mov es, bx
 ;mov bx, 0x7c00+512



 int 0x13
 jc read_error	;jc=> jump carry flag | jump to read_error if cary flag to set by bios
 popa

 ret

read_error:
 mov si, disk_error
 call print_str
 jmp $

disk_error:
 db'error reading disk', 0
