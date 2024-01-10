# Printerpi

<i>Turn your Raspberry Pi Zero into a portable AirPrint Server and give your old printer a new life!</i>

## 1 Introduction

The purpose of this project is to provide a simple solution to turn old USB printers into modern AirPrint devices with the help of a [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/) or [Raspberry Pi Zero 2W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/). The project is combining existing open source projects and offers a ready-to-use operating system. In other words, as soon as you are going to flash your SD card, insert it into the Raspberry Pi, and power it on, you can immediatey start using it without further configuration in the operating system itself. Following components were used to create the artifact:  
- [Raspbian OS Lite (x32)](https://www.raspberrypi.com/software/operating-systems/)
- [CUPS Server](https://github.com/apple/cups) by [Apple](https://www.apple.com/)
- [HPLIP](https://developers.hp.com/hp-linux-imaging-and-printing)
- [GParted](https://gparted.org/)
- [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)

As the project does not modify any of the mentioned components but rather combines them into one system, no license is applied to repository as the Rasbian OS and CUPS Server come with conflicting licenses. There is no financial interest in this project involved, as well as there are no warranties included.  In case any regulatory questions or concerns arise, feel free to contact me via [my email address](mailto:denis.smolin@gmx.de). With this at hand, let's have a look on the prerequisites, installation instructions, and configuration tutorial!

## 2 Prerequisites
For this project to work, you need at least the following items at hand:
- A Raspberry Pi Zero W or Raspberry Pi Zero 2W
- An empty micro SD card with at least 4GB space
- A 5V, 2A powerbank with at least 5000 mAh
- A suitable Micro-USB (male) wire (Not necessary an OTG cable, any length)
- A Micro-USB (male) to USB-A (female) adapter
- A suitable USB-A (male) wire for your printer
- A computer of your choice
- A suitable micro SD card reader of your choice
- A USB printer of your choice
- An Apple device, e.g. iPhone or iPad

<b>Time required: Approximately XX:XX</b>

## 3 Installation

With suitable hardware at hand, first download the [latest release](https://github.com/smolinde/printerpi/releases/latest) of the Printerpi OS and the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) for your computer operating system.

1) Unzip the downloaded file
2) Plug in your SD card with the adaper (or without if your computer has a dedicated slot) into your computer
3) Open the Raspberry Pi Imager
4) Select the operating system by scrolling down to "Use custom"
5) Select the image file from your file system. You will find a file called ```printerpi.img``` in the previously unzipped folder
6) Select the device you want to flash the image onto. It should be your SD card
7) Click Next. In prompt "Use OS customization?" click yes
8) Confirm the "All existing data on \<your device\> will be erased" prompt with yes
9) The process will take some time. Grab a coffee or complete a lesson in Duolingo
10) After the flashing and verification process finish, click continue. You can now unplug your SD card and close the Raspberry Pi Imager
11) Insert the SD card into your Raspberry Pi
12) Connect your powerbank to the rightmost Micro-USB port of the Raspberry Pi Zero (The port furthest away from the micro-HDMI port!)
13) Wait a few minutes until the Rapsberry Pi boots completely
14) On your Apple device, go to Settings > Wi-Fi and connect to the network AirPrint. Your device should be able to connect and display that there is no internet connection
15) On your Apple device, open Safari browser and open following URL: https://printerpi.local:631
16) If you see the CUPS overview page, everything went successful and you are ready to set up your printer!

## 4 Printer Setup

### 4.1 HP Printer Installation

Please skip this chapter and continue with 4.2 if you don't have a HP printer.  
Depending on your printer model, the driver setup process may vary. I will demonstrate the setup for the [HP LaserJet 1020](https://support.hp.com/us-en/drivers/hp-laserjet-1020-printer-series/439423). For other HP printer models, the process is similar.
1) Open your command line and type ```ssh printerpi@printerpi.local``` and hit enter
2) Enter following password: ```printerpi``` and hit enter again
3) After everything was installed, run the following command: ```sudo hp-setup -i```
4) You are prompted to select where your printer is located. In our case, just hit enter to select USB.
5) TBD!!!
6) Plug in your printer USB wire into a free USB port of your USB hub that is connected to the Raspberry Pi
7) Connect your printer to electricity, turn it on, and put in some paper
8) On your Apple device, first connect with the AirPrint wireless network, then navigate on the CUPS homepage to Administration section
9) Click "Add Printer"
10) Select TBD!!!

