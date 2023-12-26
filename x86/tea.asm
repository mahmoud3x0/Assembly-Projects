org 100h ;offset in memory 
.data 
    delta      DW  02ach
    sum        DW  0        
    var0       DW  0
    var1       DW  0   
    key0       DW  3fh    
    key1       DW  1dh
    key2       DW  0f1h
    key3       DW  0fch     
           
    message_0 DB 'Press "e" for Encryption or "d" for Decryption or "c" for Encryption&Decryption "x" for exit: $'
    message_1 DB 0Ah,'Enter a Text (4 chars) to Encrypt: $'     
    message_2 DB 0Ah,'Wait for Encrypting... $'    
    message_3 DB 0Ah,'Encrypted text is: $'    
    message_4 DB 0Ah,'Wait for Decrypting... $' 
    message_5 DB 0Ah,'decrypted text is: $'                             


.code
             
main proc          
      
 jmp choose_operation
                        
 encryptAndDecryptOperation:           
    mov ah,09h                 ;print message_1  
    mov dx,offset message_1    ;print              
    int 21h                    ;interrupt kernal
    
    mov ah,01h                 ;reads var0
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt dos
    mov bl,al                  ;assign al to bh 
    mov var0,bx                ;assign ax to var0
    
    mov ah,01h                 ;reads var1
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt kernal
    mov bl,al                  ;assign al to bh 
    mov var1,bx                ;assign ax to var1 
      

    mov ah, 09h                ;print the string
    mov dx, offset message_2   ;assign load effective address
    int 21h                    ;interrupt dos

    call encrypt               ;calling function ercrypt

    mov ah, 09h                ;print the string
    mov dx, offset message_3   ;assign load effective address
    int 21h                    ;interrupt dos

    mov ah, 02h                ;reads input var0
    mov bx, var0               ;assign var0 to bx
    mov dl, bh                 ;take first byte
    int 21h                    ;interrupt dos
    mov dl, bl                 ;take second byte
    int 21h                    ;interrupt dos

    mov bx, var1               ;assign var1 to bx
    mov dl, bh                 ;assign dl to bh
    int 21h                    ;interrupt dos
    mov dl, bl                 ;assign bl to dl
    int 21h                    ;interrupt dos

    mov dl, 0Ah                ;assign line feed (enter)
    mov ah, 02h                ;prints dl 
    int 21h                    ;interrupt dos

    mov ah, 09h                ;print the string
    mov dx, offset message_4   ;assign load effective address
    int 21h                    ;interrupt dos

    call decrypt               ;calling function ercrypt

    mov ah, 09h                ;print the string
    mov dx, offset message_5   ;assign load effective address
    int 21h                    ;interrupt dos

    mov ah, 02h                ;reads input v0
    mov bx, var0                 ;assign v0 to bx
    mov dl, bh                 ;take first byte
    int 21h                    ;interrupt dos
    mov dl, bl                 ;take second byte
    int 21h                    ;interrupt dos

    mov bx, var1               ;assign var1 to bx
    mov dl, bh                 ;read first byte
    int 21h                    ;interrupt dos
    mov dl, bl                 ;read second byte
    int 21h                    ;interrupt dos

    mov dl, 0Ah                ;assign line feed (enter)
    mov ah, 02h                ;prints dl 
    int 21h                    ;interrupt dos
                                             
    jmp choose_operation       ;jumps to choose_operation again                
                        
 choose_operation:
    
    mov ah, 09h                  ;prints message_0
    lea dx, message_0
    int 21h                      ;interrupt dos
    mov ah, 01h                  ;reads the choise
    int 21h                      ;interrupt dos
    cmp al, 'e'                  ;compare value in al with e
    je encryptOperation          ;jump if it equal
    cmp al, 'd'                  ;compare value in al with e
    je DecryptOperation          ;jump if it equal
    cmp al, 'c'                  ;compare value in al with e
    je encryptAndDecryptOperation;jump if it equal
    cmp al, 'x'                  ;compare value in al with e
    mov dl, 0Ah                ;assign line feed (enter)
    mov ah, 02h                ;prints dl 
    int 21h                    ;interrupt dos
    je endProgram                ;jump to end if it equal
    jmp choose_operation         ;repeat operation again
    
    
         
 encryptOperation:
         
    mov ah,09h                 ;print message_1  
    mov dx,offset message_1    ;print              
    int 21h                    ;interrupt kernal   
    
    mov ah,01h                 ;reads var0
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt kernal
    mov bl,al                  ;assign al to bh 
    mov var0,bx                ;assign ax to var0
    
    mov ah,01h                 ;reads var1
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt kernal
    mov bl,al                  ;assign al to bh 
    mov var1,bx                  ;assign ax to var1 
      
      
    ; "Wait for Encrypting..."
    mov ah, 09h
    mov dx, offset message_2
    int 21h    
    
    call encrypt
     
    mov ah, 09h
    mov dx, offset message_3
    int 21h       
     
    mov ah, 02h ;print output  
    ;print v0       
    mov bx, var0  ;assign v0 to ax
    mov dl, bh  ;assign bh to dl           
    int 21h     ;interrupt kernel
    mov dl, bl  ;assign bl to d1
    int 21h      
    
    ; print v1
    mov bx, var1
    mov dl, bh             
    int 21h
    mov dl, bl
    int 21h    
    
    mov dl, 0Ah                ;assign line feed (enter)
    mov ah, 02h                ;prints dl 
    int 21h                    ;interrupt dos
                
    jmp choose_operation       ;jumps to choose_operation again                
    
  ;-----------------------------------------------------------------------------
  
    DecryptOperation:    
    
    mov ah,09h                 ;print message_1  
    mov dx,offset message_1    ;print              
    int 21h                    ;interrupt kernal   
    
    mov ah,01h                 ;reads var0
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt kernal
    mov bl,al                  ;assign al to bh 
    mov var0,bx                  ;assign ax to var0
    
    mov ah,01h                 ;reads var1
    int 21h                    ;interrupt kernal
    mov bh,al                  ;assign al to bh  
    int 21h                    ;interrupt kernal
    mov bl,al                  ;assign al to bh 
    mov var1,bx                ;assign ax to var1 
      
      
    ; "Wait for Encrypting..."
    mov ah, 09h
    mov dx, offset message_4
    int 21h    
    
    call decrypt
     
    mov ah, 09h
    mov dx, offset message_5
    int 21h       
     
    mov ah, 02h ;print output  
    ;print var0       
    mov bx, var0  ;assign var0 to ax
    mov dl, bh    ;assign bh to dl           
    int 21h       ;interrupt kernel
    mov dl, bl    ;assign bl to d1
    int 21h      
    
    ; print var1
    mov bx, var1
    mov dl, bh             
    int 21h
    mov dl, bl
    int 21h  
    
    mov dl, 0Ah                ;assign line feed (enter)
    mov ah, 02h                ;prints dl 
    int 21h                    ;interrupt dos
                
    jmp choose_operation       ;jumps to choose_operation again                
          
;-------------------------------------------------------------------------------------
   endProgram:
    ; stop the program
    mov ah, 4ch
    int 21h
    
    endp
        
      
encrypt proc
   mov cx,8
   
 enc_loop:  
      ;sum=sum+delta 
      mov ax, delta  ;assign delta value in ax  
      mov bx, sum    ;assign sum   value in bx
      add ax,bx      ;ax=ax+bx
      mov sum,ax     ;assign ax value in sum    
      ; var0 += ((var1<<4) + k0) ^ (var1 + sum) ^ ((var1>>5) + key1)    
      mov ax, var1     ;assign upper value  in register ax   
      mov bx, key0     ;assign key0 to register dx
      shl ax,4         ;shift left var1 by 4
      add ax,bx        ;ax=ax+bx ((var1 << 4) + key0)       
      ; dx ^= (var1 + sum) 
      mov dx,ax        ;dx for xoring 
      mov ax, var1     ;assign upper value  in register ax 
      mov bx,sum       ;assign bx value in sum
      add ax,bx        ;ax=ax+bx    (var1 + sum)
      xor dx,ax        ;dx=dx^ax
      ; dx ^= ((var1>>5) + key1)
      mov ax, var1     ;assign upper value  in register ax  
      shr ax, 5        ;shift  right var1 by 5    
      mov bx, key1     ;assign key1 to register dx
      add ax,bx        ;ax=ax+bx
      xor dx,ax        ;dx=dx^ax  
             
      mov ax,var0      ;assign var0 to ax   
      add ax,dx        ;ax=ax+dx var0=var0+xoring    
      mov var0,ax      ;assign value of ax register to var0
      
                          
     ;var1 += ((var0 << 4) + k2) ^ (var0 + sum) ^ ((var0 >> 5) + key3);   
      mov ax, var0     ;assign upper value  in register ax   
      mov bx, key2     ;assign key2 to register dx
      shl ax,4         ;shift left var0 by 4
      add ax,bx        ;ax=ax+bx ((var0 << 4) + key2)       
      ; dx ^= (v0 + sum) 
      mov dx,ax      ;dx for xoring 
      mov ax, var0   ;assign upper value  in register ax 
      mov bx,sum     ;assign bx value in sum
      add ax,bx      ;ax=ax+bx    (var0 + sum)
      xor dx,ax      ;dx=dx^ax
       ; dx ^= ((var0>>5) + k3)
      mov ax, var0     ;assign upper value  in register ax  
      shr ax, 5        ;shift  right v1 by 5    
      mov bx, key3     ;assign key3 to register dx
      add ax,bx        ;ax=ax+bx
      xor dx,ax        ;dx=dx^ax  
       ; v1 += dx        
      mov ax,var1      ;assign var1 to ax   
      add ax,dx      ;ax=ax+dx var1=var1+xoring    
      mov var1,ax      ;assign value of ax register to var1
             
             
  loop enc_loop          
ret
jmp endProgram       

encrypt endp  
   decrypt proc   
    
        mov cx, 8      ; counter for "loop" instruction
            
dec_Loop:      
        ; var1 -= ((var0<<4) + key2) ^ (var0 + sum) ^ ((var0>>5) + key3)
        ; dx = ((var0<<4) + key2)
        mov ax, var0
        shl ax, 4
        mov bx, key2
        add ax, bx
        mov dx, ax
        ; dx ^= (var0 + sum)
        mov ax, var0
        mov bx, sum
        add ax, bx
        xor dx, ax
        ; dx ^= ((var0>>5) + key3)
        mov ax, var0
        shr ax, 5
        mov bx, key3
        add ax, bx
        xor dx, ax
        ; v1 -= dx
        mov ax, var1
        sub ax, dx
        mov var1, ax
        
        ; var0 -= ((var1<<4) + key0) ^ (var1 + sum) ^ ((var1>>5) + key1)    
        ; dx = ((var1<<4) + key0)
        mov ax, var1
        shl ax, 4
        mov bx, key0
        add ax, bx
        mov dx, ax
        ; dx ^= (var1 + sum)
        mov ax, var1
        mov bx, sum
        add ax, bx
        xor dx, ax
        ; dx ^= ((var1>>5) + key1)
        mov ax, var1
        shr ax, 5
        mov bx, key1
        add ax, bx
        xor dx, ax
        ; v0 -= dx
        mov ax, var0
        sub ax, dx
        mov var0, ax 
        
        ; sum -= delta  
        mov bx, delta
        mov ax, sum
        sub ax, bx
        mov sum, ax 
        
loop dec_Loop          ; "loop" uses "cx" as its counter     
        
ret
decrypt endp
end         
jmp endProgram
