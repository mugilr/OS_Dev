[org 0x7c00]

mov bp, 0x9000
mov sp, bp

;mov si, hello
;call print
mov dx, 0x3344
call print_h

%include "print_string.asm"

print_h
 mov si, hex
 mov [hex], byte 'A'
 call print
 ret

%if 0
print:
 loop:
  lodsb         ;mov al,[si] ;lodsb load string buffer
  cmp al, 0
  je end
  mov ah, 0x0e
  int 0x10
  ;inc si       ; add si, 1
  jmp loop
 end:
 ;pop bx
 ;jmp bx
 ret ;equalent to above 2 lines
%endif

;%include "print_string.asm"

jmp $

;hello:
 ;db 'Hello_MR', 0
;hell:
 ;db 'Hello', 0
hex:
 db '0x??1?', 0

times 510-($-$$) db 0
dw 0xaa55
