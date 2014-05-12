##A small assembly primer:
This tutorial is meant to provide a small introduction to assembly language, which would at least help you understand at least the assembly code we are using in building our operating system.

###Tutorial Reference:
I have written boiled down here everything here using this tutorial. [Assembly language tutorial](http://www.tutorialspoint.com/assembly_programming/assembly_introduction.htm). These are more useful resources, in case you want to go in detail - [Other useful resources](http://www.tutorialspoint.com/assembly_programming/assembly_useful_resources.htm) 

###What is assembly language?
Every computer has a microprocessor which is responsible for all the arithmetical, logical and control activities. Each family of processor has its own set of instructions for handling various operations like getting input from keyboard, displaying information on screen, and performing all other necessary jobs. These set of instruction is called **machine language instructions**. 

Processors understands machine language instructions, which are basically strings of `1's and 0's. However Machine language are too obscure complex and is not human-reading friendly. It is way too complex for any software development. So low-level assembly language is designed for a specific family of processors, that represents various instructions in symbolic code and a more understandable form. We will need an **assembler** eg. NASM to translate this symbolic code to machine
instructions for machine. Obviously, modern programming languages like 'C,C++ or Java' are higher languages and
provide more human-readable abstraction of machine language instructions. 

###Main uses of Assembly language.

* Interface to programs with OS, processor and BIOS.
* Representation of data in memory and other external devices.
* How processor executes and executes instruction.
* How instructions access and process data.
* How program accesses external devices.

###Main advantages of Assembly language
* It requires less memory and execution time.
* It allows harware specific complex jobs in an easier way.
* It is suitable for time-critical jobs.
* It is most suitable for writing interrupt service routines and other memory resident programs

###Basic Hardware Features:
The main internal hardware of a PC  is composed of processor, memory and registers. The **Registers** are components that hold data and address. To execute a program the system copies it from external device to internal memory, then the processor executes the program instructions.

The most fundamental unit of computer storage is a **bit**. However, we use 8 bits together to form a **byte**, and byte is the most basic way of representing the data.  The processor usually supports following data sizes.

- Word:a 2-byte data item
- Double Word: a 4-byte (32 bit) data item
- Quadword: an 8-byte (64 bit) data item
- Paragraph: a 16-byte (128 bit) area
- Kilobyte: 1024 bytes
- Megabyte: 1,048,576 bytes

###Addressing Data in Memory

The process through which the processor controls the execution of instructions is referred as the fetch-decode-execute cycle or the execution cycle. It consists of three continuous steps:
+ Fetching the instruction from memory
+ Decoding or identifying the instrution
+ Executing the instruction

The processor may access one or more byte at a time. The bytes are stored in either **Big Endian**(Most significant byte(MSB) of the word in smallest address and least significant in the largest address) or **Little Endian** (most significant byte(MSB) of a word in the largest address and the least significant byte is stored in the smallest address). 

There are two types of memory addresses:

- An absolute address - A direct reference to specific location.
- The segment address(or offset) - Starting address of memory segment with the offset value.


###What will you need for this tutorial:

- A linux environment which has [Netwide Assembler](http://www.nasm.us/) installed. Please visit [this](http://www.nasm.us/) link for installation. 

###Assembly - Basic Syntax

An assembly program can be divided in three sections.

* The **data** section:

> The data section is used for declaring initialized data or constants. This data does not change at runtime. You can declare various constant values, file names, Buffer sizes etc.

The syntax for declaring data section is 
```
section .data
```

* The **bss** section:

> The bss section is used for declaring variables. The syntax for declaring bss section is:

```
section .bss
```

* The **text** section:

> The text section is used for keeping the actual code. This section must begin with the declaration `global _start`, which tells the kernel where the program execution begins.

```
section .text
global _start
_start:
```


###Comments

This is important, as comments can be used to explain what a particular section is doing. The comments in assembly begins with a semicolon `;`. Comment may contain any printable character including blank. It can appear on a line like this

```
; This is a comment in assembly code

```

or something like this

```
add eax, bax   ; adds eax to bax
```

### Assembly language statements

There are three types of statements in assembly language programs:

* Executable instructions or (simply) instructions.
* Assembler directives or pseudo-ops 
* Macros

The **Executable Instructions** or simply **instructions** tell the processor what to do. Each instruction consists of an **operation code (opcode)** Each instruction generate one machine language instruction.

The **assembly directive** or **pseudo-ops** tell the assembler about the various aspects of the assembly process. These are non-executable code and does not generate any corresponding machine instructions.

Lastly, **Macros** are simply text subsitution mechanism. 

##Syntax:

Assembly language statements are basically one statement per line. Each statement follows the following format:

```
[label] mnemonic [operands] [;comment]
```

The square brackets over a field above tells that field is optional. A basic instruction has two parts. First, it is the name of the instruction ( or the mnemonic ), which is to be executed and second one are the operands or the parameters for that command/instruction.

Following are some typical examples of assembly language statements:

```
INC COUNT           ;Increments the memory variable COUNT.
MOV TOTAL, 26       ;Transfer the value 26 in the memory variable TOTAL.
ADD BH, AH          ;Add the content of BH register to AH register.
AND MASK1, 128      ;Perform AND operation on the variable MASK1 and 128.
ADD MARKS, 12       ;Add 12 to the variable MARKS.
MOV AL,11           ;Transfer the value 11 to the AL register.
```

##Hello World

Let's finally do some coding.This code will print "Hello World" on the screen. Don't worry if you don't understand here.

```
section .text
    global _start       ;Must be declared for the linker (ld)
_start:                 ;Tells the linker the linking point
    mov  edx  len       ;Message length
    mov  ecx  msg       ;Message to print
    mov  ebx  1         ;File descriptor, It is stdout for printing on screen.
    mov  eax  4         ;System call number (sys_write)
    int 0x80            ;Trap to pass control to kernel

    mov eax  1          ;System call for exit (sys_exit)
    int 0x80            ;Control back to kernel
section .data
    msg db 'Hello World', 0xa       ;The hello world string
    len equ $ - msg                 ;Length of the string
```

##Lets compile and link

Please make sure you have **nasm** and **ld** binaries in your **PATH** variable. Follow the following steps to execute the above program

* Save the file name with say `hello.asm`. File name could be anything followed by `.asm`.
* Assemble the program using
```
nasm -f elf hello.asm
```
* If there are any errors, it will be prompted by the assembler here. Otherwise a `hello.o` file would be created.
* Now we will link the object file and create an executable file using:
```
ld -m elf_i386 -s -o hello hello.o
```
* Execute the program by typing `./hello`.
* If everything is all right you should see `Hello World` on the screen.

##Assembler - Memory segments
We have already discussed three sections of an assembly program. These sections represent various memory segments as well. Interestingly if you replace `section` keyword with `segment` keyword, you will get the same results.Try.

**Memory Segments** - A segmented memory model divides the system memory into groups of independent segments referenced by pointers located in segment registers. Each section is used to contain a specific type of data. One segment is used to contain instruction code and another is used to store data elements and a third segments keeps the program stact.

* **Data Segment**: It is represented by **.data** section and the **.bss** section. The **.data** section is used to declare the memory region , where data elements are stored for the program. This section cannot be expanded after the data elements are declared, and it remains static throughout the program.
The .bss section is also a static memory section that contains buffers for data to be declared later in the program. This buffer memory is zero-filled.

* **Code Segment**: It is represented by **.text** section, This defines an area in memory that stores the instruction codes. This is also a fixed area.

* **Stack**: - this segment contains data values passed to functions and procedures within the program.



##Assembly Registers

The **ia-32(also called Intel-32 or x86-32 or i386)** architecture contain 10 32-bit registers and six 16-bit registers. These are grouped in following three categories:

* **General Registers**:  The general registers are further divided into :
    - **Data Registers**:
        Four 32-bit data registers are used for arithmetic, logical and other operations. These 32-bit registers can be used in three ways:
            * As complete 32-bit data registers: EAX, EBX, ECX, EDX
            * Lower halves of the 32-bit registers can be used as four 16-bit data registers: AX, BX, CX and DX.
            * Lower and higher halves of the above-mentioned four 16-bit registers can be used as eight 8-bit data registers: AH, AL, BH, BL, CH, CL, DH, and DL.
    - Pointer Registers
    - Index Registers
    
