section .text
    global _start
_start:
    mov ecx ,msg   ;Load the message 
    mov edx ,len   ;Load the length of message
    mov ebx ,1     ;File descriptor stdout
    mov eax ,4     ;System call (sys_write)
    int 0x80      ;Sending control to kernel

    mov eax ,1     ;System call exit
    int 0x80      ;Control back to kernel

section .data
msg db 'Hello! World', 0xa  ;The message
len equ $ - msg             ;Length of message
