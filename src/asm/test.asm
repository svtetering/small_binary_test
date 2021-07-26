section .text
    global _start

    global _sys_exit
    global _sys_write
    global _sys_open

    extern entry
    _start:
        jmp entry

    ; Syscalls
    _sys_exit:
        mov eax, 0x1
        int 0x80

    _sys_write:
        push ebp
        mov ebp, esp

        ; get the file descriptor
        mov ebx, [ebp+8]

        ; get the message address
        mov ecx, [ebp+12]

        ; get the message length
        mov edx, [ebp+16]

        mov eax, 0x4
        int 0x80

        pop ebp
        ret

    _sys_open:
        push ebp
        mov ebp, esp

        ; get the pathname
        mov ebx, [ebp+8]

        ; get the flags
        mov ecx, [ebp+12]

        ; get the umode
        mov edx, [ebp+16]
        and edx, 0b1111111111111111

        mov eax, 0x5
        int 0x80

        pop ebp
        ret
