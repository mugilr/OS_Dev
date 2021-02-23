
print:
 loop:
  lodsb		;mov al,[si] ;lodsb load string buffer
  cmp al, 0
  je end
  mov ah, 0x0e
  int 0x10
  ;inc si	; add si, 1
  jmp loop
 end:
 ;pop bx
 ;jmp bx
 ret ;equalent to above 2 lines

