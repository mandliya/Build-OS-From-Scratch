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

The most fundamental unit of computer storage is a **bit**
