This is NOT my work, I am just following the project- http://samypesse.github.io/How-to-Make-a-Computer-Operating-System/

I hope to make it more novice friendly and enhance documentation and code if I can. Some of the things I am writing here is borrowed from blog post which I will try to cite in the end of the page. Please make me aware of mistakes.

**The section in the end will explain how we translate this part of process into the code which we are developing  in 'src' folder.
##Booting Explained

In this section, we will see what is the usual sequence of booting in a UNIX based OS is and then we will explain how we are going to do it.

###1. System Startup/Hardware startup:
When the machine is powered on or restarted the power is supplied to **SMPS(switched-mode power supply)** which converts AC power to DC.The DC power is then supplied to all the devices such as Motherboard, HDD's,CD/DVD-ROM, Mouse, Key-board etc. The Processor(CPU) then start running its sequence operations stored in its memory. 

The first instruction it will run is to pass control to **BIOS(Basic Input/Output System)** to do **POST(Power On Self Test)**. Once the control goes to BIOS, it will perform two operations:

* **Run the POST operations
* Selecting the first boot device.**

**POST operation** Post is a process of checking hardware availability. BIOS will have a list of all the devices which were present in the previous boot. In order to check if a hardware is available for the present booting or not it will send an electric pulse to each and every device in the list that it already have. If an electrical pulse is returned from that device it will come to a conclusion the hardware is working fine and ready for use. If it does not receive a signal from a
particular device it will treat that device as faulty or it was removed from the system. If any new hardware is attached to the system it will do the same operation to find if its available or not. The new list will be stored in BIOS memory for next boot.

After that, out of the list, BIOS select first boot device( Boot device sequence could be decided and changed). If the first in list is not found, it checks second, then third and so on. If none of the devices are found, the boot process will halt with error **NO BOOT DEVICE FOUND**

###2. Master Boot Record Loading:

Once the BIOS gives the control back to CPU, it will load the **Master Boot Record(MBR)** of the first boot device. MBR is the first(or last, it depends on manufacturer) record on the boot device of size *512 bytes*. 

MBR is the location of the disk which contains these three sections:

* **Primary boot loader code (446 bytes)**
* **Partition table information(64 bytes)**
* **Magic Number(2 Bytes)**

The primary boot loader code provides boot loader information and location details of the actual boot loader on the boot device. This is used by CPU to load the second stage of boot loader. The partition table contains information such as start and end of each partition the disk has, type of partition (primary or extended) etc. There are only 4 Partitions permitted on a HDD, as each partition record take 16 bytes and there are total 64 bytes reserved for partition table information. 

Magic Number serve as a validation check for MBR. The 0xAA55 signature is the last two bytes of the first sector of your bootdisk (bootsector/Master Boot Record/MBR). If it is 0xAA55, then the BIOS will try booting the system. If it's not found (it garbled or 0x0000), you'll get an error message from your BIOS that it didn't find a bootable disk (or the system tries booting the next disk). This signature is represented (in binary) as 0b1010101001010101. The
alternating bit pattern was thought to be a protection against certain failures (drive or controller).


[![Screen](https://raw.github.com/SamyPesse/How-to-Make-a-Computer-Operating-System/master/preview.png)](https://raw.github.com/SamyPesse/How-to-Make-a-Computer-Operating-System/master/preview.png)

