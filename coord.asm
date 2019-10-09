.model small

display macro msg
        lea dx, msg
        mov ah, 09h
        int 21h
        endm

.data
        row db 02h dup(?)
        column db 02h dup(?)
        msg1 db 0dh, 0ah, "Enter x Coordinate $"
        msg2 db 0dh, 0ah, "Enter y Coordinate $"

.code
        start: mov ax, @data
        mov ds, ax
        display msg1
        mov si, offset row
        call read
        display msg2
        mov si, offset column
        call read
        mov si, offset row
        mov ah, [si]
        inc si
        mov al, [si]
        sub ax, 3030h
        aad
        mov dh, al
        mov si, offset column
        mov ah, [si]
        inc si
        mov al, [si]
        sub ax, 3030h
        aad
        mov dl, al
        mov ah, 00h
        mov al, 03h
        int 10h
        jmp final

        read proc near
        mov cx, 02h
        back: mov ah, 01h
        int 21h
        mov [si], al
        inc si
        dec cx
        jnz back
        ret

        read endp

        final: mov ah, 01h
        int 21h
        mov ah, 4ch
        int 21h
        end

