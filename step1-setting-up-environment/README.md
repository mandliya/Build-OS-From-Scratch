Notice: This is NOT my work, I am just following the project- http://samypesse.github.io/How-to-Make-a-Computer-Operating-System/

I hope to make it more novice friendly and enhance documentation and code if I can.

##Step 1: Set up environment (again taken from original work):

We will create virtual development environment for our project using Vagrant and Virtualbox.   

###a. Install Vagrant:
    Vagrant is a free and open-source software for creating and configuring virtual development environments. It can be considered a wrapper around VirtualBox. 

    Get and install Vagrant from http://www.vagrantup.com.

###b. Install VirtualBox:
    Oracle virtualBox is a virtualization software package for x86 and AMD64/Intel64-based computers.

    Vagrant needs Virtual to work. 
    Download VirtualBox and install from your system at :
      https://www.virtualbox.org/wiki/Downloads.
    
###c. Start and test the development environment.

    -Once Vagrant and Virtualbox are installed, you need to download the ubuntu lucid32 image for Vagrant. Type

```
     vagrant box add lucid32 http://files.vagrantup.com/lucid32.box
```
Once the Lucid32 image is ready, we need to define our development file using a *Vagrantfile* (https://github.com/mandliya/Build-OS-From-Scratch/blob/master/src/Vagrantfile). This file defines what prerequisites our environment needs.
```    
    -nasm
    -make
    -build-essential
    -grub
    -qemu
```
Start you box using (from folder where Vagrantfile is placed):
```
vagrant up
```
You can access your virtual box using ssh to connect to the virtual box using 

```
vagrant ssh
```

