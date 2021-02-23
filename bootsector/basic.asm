;loop:
;  jmp loop ; A comment

;db 'Hello MR' ; it'll conver the char to ASCII and strore in hex


%if 0
;ax,bx,cx,dx are general purpose registers
;here we're wirriting in a registers
mov ax, 0x12
mov bx, ax
mov cx, 0x1234
mov dl, 0x12
mov dh, 0x34
%endif

%if 0
mov ah, 0x0e	; BIOS scrolling teetype function int 10/ ah = 0 eh -> scrolling teletype BIOS routine
mov al, 'H'	; lower byte of 'a' will store the ASCII of H
int 0x10	; int-> interrupt so we're calling 0x10 interrrupt
mov al, 'E'
int 0x10
mov al, 'L'
int 0x10
mov al, 'L'
int 0x10
mov al, 'O'
int 0x10
mov al, ' '
int 0x10
mov al, 'M'
int 0x10
mov al, 'R'
int 0x10
%endif

[org 0x7c00]	; it tell our asm to  treat 0x7c00 as the orign of our code
mov ah, 0x0e	; BIOS scrolling teetype function int 10/ ah = 0 eh -> scrolling teletype BIOS routine


%if 0
;mov [0x40], word 0x01	;here we are correpting the interrupt table
			;in int mem 1st 4 bytes will be the int 0x01 in interrupt table 

mov ah, 0x0e	; BIOS scrolling teetype function int 10/ ah = 0 eh -> scrolling teletype BIOS routine
mov al, [my_char]	; [x] -> load a value in address x here x is a memory  
;mov ah, 0x7c07 ;[7c07] here 7c is the bootsector in main memory and 07 is the address of char stored  
int 0x10	; int-> interrupt so we're calling 0x10 interrrupt that's print(al) 

my_char:
  dw 'x'
%endif 

;printing from stack mem
%if 0
;mov [0x9000], byte'A'	;we store in the free mem and load it into al reg to print
;mov al,[0x9000]

;using stack
mov bp, 0x9000	;set base address of stack to 0x9000
mov sp,bp	;set top address of the stack to same since its in initiall piont both top and bottom are same
push 'A'	;store A in stack address
push 'B'
push 'C'
push 'D'

mov al,[0x9000-3*0x2]	;since stack grow in downward the mem address get decresed so 0x9000 is the base address, each push char will require 2 byte so 0x9000-0x2 will be the address of the char A stored [0x9000-i*0x2] is the address of the each char i rep ith element in stack
int 0x10

pop bx		;pop the stack and store it in bx(we can change to any reg like cx,dx)
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10
%endif 

%if 0
;if else condition
mov dx, 75
cmp dx, 10
jl less_10
mov al, 'T'
jmp endif

less_10:
 mov al, 't'
endif:
%endif

%if 0
;printing A to Z using while loop
mov al, 'A'
loop:
 int 0x10
 add al,1
 cmp al, 'Z'
 jle loop 
%endif


;function

mov bp, 0x9000
mov sp,bp
	
;mov al,'X'
;call print

;mov al,'Y'
;call print	; call it will jump to that function and store the instruction pointer to reuturn there
 
;jmp $		; endless jump- to stop the CPU zooming of executing arbitrary bytes

mov si,string
call print
mov si,estring
call print
;mov si, hex
;call print

string:
 db'Hello MR', 0
estring:
 db'Bye MR', 0
;hex:
; db'0x0000', 0

print:
 loop:
  lodsb		;mov al,[si] ;lodsb load string buffer
  cmp al, 0
  je end
  int 0x10
 ; inc si	; add si, 1
  jmp loop
 end:
 ;pop bx
 ;jmp bx
 ret ;equalent to above 2 lines

;magic number at last 2 bytes of the 1st sector
times 510-($-$$) db 0	 ; the byte will be 0
dw 0xaa55		 ; the word will be written
