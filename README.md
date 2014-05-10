##Goal: To create a UNIX like operating system in C++.
I am following the project mentioned here:

https://github.com/SamyPesse/How-to-Make-a-Computer-Operating-System 

and the Gitbook - http://samypesse.github.io/How-to-Make-a-Computer-Operating-System/

I am understanding and rebuilding author's previous work for my better understanding and enhancements(if any, I would contribute to original project). I will just put a little more novice touch in Documentation

We will build this OS for x86 32 bit architecture(not 64).

###What is x-86 architecture?
    The Intel x86 architecuture is world's predominant personal computer CPU architecture and platform. It was developed by Intel and includes the Core, Pentium and earlier 286, 386 and 486 models (hence, the "86"). The Intel x86 processor uses complex instruction set computer (CISC) architecture, which means there is a modest number of special-purpose registers instead of large quantities of general-purpose registers. It also means that complicated special-purpose instructions will predominate.The x86 processor traces its heritage at least as far back as the 8-bit Intel 8080 processor. Many peculiarities in the x86 instruction are due to the backward compatibility with that processor (and with its Zilog Z-80 variant).

###The OS should not just be a "proof of concept", it should have following features:

    Code in C++
    x86, 32 bit architecture
    Boot with Grub
    Kind of modular system for drivers
    Kind of UNIX style
    Multitasking
    ELF executable in userland
    Modules (accessible in userland using /dev/...) :
        IDE disks
        DOS partitions
        Clock
        EXT2 (read only)
        Boch VBE
    Userland :
        API Posix
        LibC
        "Can" run a shell or some executables like Lua, ...
