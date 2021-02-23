[org 0x7c00]

mov bp, 0x8000
mov sp, bp

;mov si, hello
;call print
;mov dx, [0x7c00+510]	;address of magic no.

mov ax, 0xc000
mov ds, ax
mov si, 0x5759
call print_str

;db'BIOS', 0
call find_str
 
jmp $

;hello:
 ;db 'Hello_MR', 0
;hell:
 ;db 'Hello', 0
;find_me:
; db'BIOS', 0


%include "fun_print.asm"

;search a string
find_str:

 mov bx, 0
 mov es, bx	;es =0
 
 _srch_str:
 ; mov dx, bx	;print the hex address
  mov al, [es:bx]
  cmp al, 'B'
  jne _cntn_srch
  
  mov al, [es:bx+1]
  cmp al, 'I'
  jne _cntn_srch
  
  mov al, [es:bx+2]
  cmp al, 'O'
  jne _cntn_srch
  
  mov al, [es:bx+3]
  cmp al, 'S'
  jne _cntn_srch
  
  mov al, [es:bx+4]
  cmp al, ' '
  jne _cntn_srch
  
  mov al, [es:bx+5]
  cmp al, 'C'
  jne _cntn_srch
  
  mov dx, es
  call print_h
  mov dx, bx
  call print_h
  jmp $
 
  _cntn_srch:
  
  inc bx
  cmp bx, 0
  je _inc_seg

  jmp _srch_str
  _inc_seg:
   mov cx, es
   add cx, 0x1000	;0x1000 => 0x10000 
   mov es, cx
   jmp _srch_str
 ret

times 510-($-$$) db 0
dw 0xaa55
