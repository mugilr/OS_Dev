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
