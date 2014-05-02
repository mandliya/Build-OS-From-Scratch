Goal: To create a UNIX like operating system in C++. I am following the project mentioned here:

https://github.com/SamyPesse/How-to-Make-a-Computer-Operating-System 

and the Gitbook - http://samypesse.github.io/How-to-Make-a-Computer-Operating-System/

The OS should not just be a "proof of concept", it should have following features:

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
