##A small assembly primer:
This tutorial is meant to provide a small introduction to assembly language, which would at least help you understand at least the assembly code we are using in building our operating system.

###Tutorial Reference:
I have written boiled down here everything here using this tutorial. [Assembly language tutorial](http://www.tutorialspoint.com/assembly_programming/assembly_introduction.htm). These are more useful resources, in case you want to go in detail - [Other useful resources](http://www.tutorialspoint.com/assembly_programming/assembly_useful_resources.htm) 

###What is assembly language?
Every computer has a microprocessor which is responsible for all the arithmetical, logical and control activities. Each family of processor has its own set of instructions for handling various operations like getting input from keyboard, displaying information on screen, and performing all other necessary jobs. These set of instruction is called **machine language instructions**. 

Processors understands machine language instructions, which are basically strings of `1's and 0's. However Machine language are too obscure and complex is not human-reading friendly. It is way too complex for any software development. So low-level assembly language is designed for a specific family of processors, that represents various instructions in symbolic code and a more understandable form.Obviously, modern programming languages like 'C,C++ or Java' are higher languages and
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



