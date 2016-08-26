Connection USB-UART
===

[wiki odroid USB-UART](http://odroid.com/dokuwiki/doku.php?id=en:usb_uart_kit)


Sous MAC
---
Des adaptations sont indiquées sur le [forum](http://forum.odroid.com/viewtopic.php?f=53&t=841)

### Installer 
~~~
brew install minicom
~~~
et le driver 
DRIVER
First order of business is to get the drivers for our UART to work.
[You may get them at the site.](http://www.silabs.com/Support%20Documents/Software/Mac_OSX_VCP_Driver.zip)
Unzip and install the package and reboot the system.

Si le driver provoque une erreur suite à l'installation appliquer les droits suivants :

~~~
sudo chown -R root:wheel /System/library/Extensions/USBExpressCardCantWake_Huawei.kext
~~~

Verifier que USBtoUART est bien reconnu

~~~
ioreg -c IOSerialBSDClient | grep USBtoUART
~~~

resultat 

~~~
	  |   |               "IOTTYBaseName" = "SLAB_USBtoUART"
      |   |               "IOCalloutDevice" = "/dev/cu.SLAB_USBtoUART"
      |   |               "IODialinDevice" = "/dev/tty.SLAB_USBtoUART"
      |   |               "IOTTYDevice" = "SLAB_USBtoUART"
~~~



Depuis le terminal


~~~
sudo minicom -s
~~~

Troubleshooting
----

~~~
minicom: cannot open /dev/tty.SLAB_USBtoUART: No such file or directory
~~~
Verifier que USBtoUART est bien reconnu

~~~
ioreg -c IOSerialBSDClient | grep USBtoUART
~~~

deconnecter et reconnecter le cable USB. Patienter.

