[org 0x7c00]

mov bp, 0x9000
mov sp, bp

;mov si, hello
;call print
mov dx, [0x7c00+510]	;address of magic no.
call print_h


jmp $

%include "fun_print.asm"

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

;hello:
 ;db 'Hello_MR', 0
;hell:
 ;db 'Hello', 0
hex:
 db '0x??1?', 0
hexbet:
 db '0123456789abcdef'

times 510-($-$$) db 0
dw 0xaa55
