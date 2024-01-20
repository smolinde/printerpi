# Printerpi

<i>Turn your Raspberry Pi Zero into a portable AirPrint Server and give your old printer a new life!</i>

## 1 Introduction

The purpose of this project is to provide a simple solution to turn old USB printers into modern AirPrint devices with the help of a [Raspberry Pi Zero W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/) or [Raspberry Pi Zero 2W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/). The project is combining existing open source projects and offers a ready-to-use operating system. In other words, as soon as you are going to flash your SD card, insert it into the Raspberry Pi, and power it on, you can immediatey start using it without further configuration in the operating system itself. Following components were used to create the artifact:  
- [Raspbian OS Lite (x32)](https://www.raspberrypi.com/software/operating-systems/)
- [CUPS Server](https://github.com/apple/cups) by [Apple](https://www.apple.com/)
- [HPLIP](https://developers.hp.com/hp-linux-imaging-and-printing)
- [GParted](https://gparted.org/)
- [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)

As the project does not modify any of the mentioned components but rather combines them into one system, no license is applied to repository as the Rasbian OS and CUPS Server come with conflicting licenses. There is no financial interest in this project involved, as well as there are no warranties included. The provided files (excluding printerpi image file in releases) is my contribution and is distributed under the [MIT license](https://opensource.org/license/mit/). In case any regulatory questions or concerns arise, feel free to contact me via [my email address](mailto:denis.smolin@gmx.de). With this at hand, let's have a look on the prerequisites, installation instructions, and configuration tutorial.  Enjoy!

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

<b>Time required: Approximately XX:XX (not yet estimated...)</b>

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
16) Safari prompts that the certificate is invalid. Select "Show Details" and click "visit this website". Refresh the page
17) If you see the CUPS overview page, everything went successful and you are ready to set up your printer!

## 4 WiFi configuration

To keep things as easy as possible, I created an [Apple Shortcut](https://support.apple.com/guide/shortcuts/welcome/ios) that allows us to configure wireless network connections without getting hands on the command line:  

1) Download the [Cofigure Printerpi shortcut file](https://github.com/smolinde/printerpi/blob/master/Configure%20Printerpi.shortcut) to your Apple device
2) Install the [Shortcuts app](https://apps.apple.com/us/app/shortcuts/id1462947752) on your Apple device
3) If you installed the app for the first time you must run any shortcut that is already existing to unlock hidden settings
4) Navigate to Settings > Shortcuts > Advanced and enable all 4 options
5) In the download folder of your Apple device, tap the downloaded shortcut file
6) Tap "(+) Add Shortcut"
7) With your device connected to AirPrint WiFi network, run the shortcut by tapping it
8) From here, things should be intuitive. You can add, delete, or switch network connections
9) In case you misconfigure a network, don't worry, the device will switch automatically back to Hotspot mode and broadcast the AirPirnt network
10) You can only run the shortcut if your device and Printerpi are connected to the same network

<b>Important:</b> The Rapsberry Pi Zero W/2W supports 2.4GHz networks only!

## 5 Printer Setup

### 5.1 HP Printer Driver Installation

<i>Please skip this chapter and continue with 5.2 if you don't have a HP printer.</i>  
Depending on your printer model, the driver setup process may vary. I will demonstrate the setup for the [HP LaserJet 1020](https://support.hp.com/us-en/drivers/hp-laserjet-1020-printer-series/439423). For other HP printer models, the process is identical. And yes, we will have to use the command line. Don't worry, most of the times you just have to hit enter and nothing else :)  

1) Connect your HP printer via USB and USB to Micro-USB adapter to the data port of the Printerpi (the port between Micro-HDMI and occupied power port)
2) Plug in your printer to electricity, turn it on, and put in a few sheets of paper
3) With help of the shortcut, connect your Printerpi device to a WiFi network with internet access
4) Connect to the same network from a device of your choice. Open a [command line window](https://en.wikipedia.org/wiki/Command-line_interface)
5) In your command line, type ```ssh printerpi@printerpi.local``` and hit enter
6) You are getting asked about the fingerprint of the device. Type yes and hit enter.
7) Enter following password: ```printerpi``` and hit enter again
8) Run the following command: ```sudo hp-setup -i```
9) You are prompted to select where your printer is located. In our case, just hit enter to select USB.
10) A plug-in installation process is initiated. Hit enter and wait until the download is finished adn plug-in is installed
11) Accept the license terms by hitting enter
12) You are prompted to select a name for the print queue. You can either type a name or hit enter to use the default one (recommended)
13) The print queue setup suggests a PPD file. Double-check if it contains the same name as your printer model and hit enter
14) Enter a location description or leave it blank and continue with enter
15) Enter additional information or leave it blank and continue with enter
16) If you want to test the printer immediately, hit enter to print a test page or type ```n``` and hit enter to skip
17) The setup is finished. You can now type ```exit``` and hit enter to close the connection to Printerpi
9) Plug in your printer USB wire into a free USB port of your USB hub that is connected to the Raspberry Pi
10) Connect your printer to electricity, turn it on, and put in some paper
11) On your Apple device, first connect with the AirPrint wireless network, then navigate on the CUPS homepage to Administration section


### 5.2 Printer Configuration

<i>Please note that additional driver installation for your printer model may be required. If this instruction doesn't lead to a successful installation, please refer to internet forums regarding your printer model. There may be similar tutorials as presented in 5.1.</i>  

We are now going to do the final setup step to turn the printer into an [AirPrint device](https://support.apple.com/en-us/HT201311). This will require only a few steps on the web interface of CUPS. We are almost there!

1) On a device of your choice, connect to the same network as Printerpi or connect to the AirPrint network
2) In a browser of your choice, open https://printerpi.local:631
3) Navigate to Administration section > Add Printer
4) You are prompted to sign in. Enter ```printerpi``` for both, username and password. Click "Sign In"
5) From the list of local printers, select the printer that you have connected via USB (in case of a HP printer, select the printer that comes with a random ID and HPLIP in its name)
6) Click continue
7) Tick the "Share This Printer" option. Enter a printer name, description, and location (description and locaton will be displayed later in the printer selection on Apple devices)
8) Click continue
9) On the next page, select your printer model from the list. If you have a [PPD file](https://en.wikipedia.org/wiki/PostScript_Printer_Description) at hand for your printer model, you can choose to upload and use it instead
10) Click "Add Printer"
11) Select and set default printer options of your choice
12) Click "Set Default Options"
13) For a few seconds, there should be a confirmation screen with the content "Printer \<your printer\> default options have been set successfully."
14) After getting redirected to the printer overview page, you can select from the left "Maintenance" drop-down menu to print a test page (recommended) or skip this step
15) You can now close the browser. If the test page was printed successfully, continue with 5.3. If test page was not printed, have a look at 6.2

### 5.3 Printer Usage

<i>If you managed to print a test page, it is very unlikely that from here something goes wrong</i>  

With everything set up, we can finally test the AirPrint functionality. This is the fun part :D

1) Download a [sample pdf form](http://foersom.com/net/HowTo/data/OoPdfFormExample.pdf) to your Apple device and fill out the fields (optional)
2) On your Apple device, tap Share > Print and select the printer that you have set up previously
3) Adjust printing options to match your expectations (optional, recommended)
4) Tap Print. The job is sent to Printerpi and will be executed soon. Larger documents or files need longer complilation time
5) You can find the print job status on the web configuration page. To do so, follow the steps in 6.2

### 5.4 Miscellaneous

<i>A collection of additional thoughts...</i>  

- If you want to turn off Printeri, use the shortcut to do so. Please make sure there are no active print jobs running
- After green LED turns off, unplug everything from Printerpi and turn off your printer
- You can run Printerpi for as long as you want. To turn everything on again, just plug everything in. No further actions are required
- For customization, please refer to the [official CUPS documentation](https://www.cups.org/documentation.html) and internet forums regarding the Raspbian OS

## 6 Troubleshooting

### 6.1 Bugs and Feature Requests

In case you encounter problems or something does not work as expected, feel free to open a new [issue](https://github.com/smolinde/printerpi/issues/new/choose) with the bug report template.  
If you think that some important functionality is missing, you can create create a new [feature request](https://github.com/smolinde/printerpi/issues/new/choose) with the corresponding template.

### 6.2 Printing Jobs are not Executed as Expected

Altough your printer is available on your apple device and you can send a print job it may happen that the printer doesn't execute the print job and nothing happens. This may occur due to missing drivers and/or wrong PPD file. As there are a lot of printers out there, solutions may be very individual. To get closer to the core issue, I will show how to access the print jobs. Heads up! There is always a solution for everything if you know where the problem lies :)  

1) On a device of your choice, connect to the same network as Printerpi or connect to the AirPrint network
2) In a browser of your choice, open https://printerpi.local:631
3) Navigate to Jobs section. Here you can find either active or completed jobs
4) They may be valuable information on what error occurred during print job execution. Copy the error message and search the internet for a solution
5) In Administration section > Manage Printers, you can delete a printer via right drop-down menu "Administration"
6) With drivers installed and a suitable PPD file at hand, walk through all steps in 5.2
7) Don't give up! In case nothing helps, create a freeform issue [here](https://github.com/smolinde/printerpi/issues/new/choose)

## 7 Contribution

If you want to participate and contribute to this project, feel free to contact me via [my email address](mailto:denis.smolin@gmx.de).  
Let's waste time together! :D