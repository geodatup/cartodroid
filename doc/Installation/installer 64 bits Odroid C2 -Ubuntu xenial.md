Installer Armbian Xenial (Odroid C2)
====================================

Contient Ubuntu 16

obtenir l'image sur le site

<http://www.armbian.com/odroid-c2/>

 

 

Créer l’image sur une carte SD
==============================

 

Décompresser l’image :

7z arhives can be uncompressed with [7-Zip](http://www.7-zip.org/) on
Windows, [Keka](http://www.kekaosx.com/en/) on Mac and 7z on Linux (apt-get
install p7zip-full). RAW images can be written
with [Rufus](https://rufus.akeo.ie/) (Win xp/7/8/10) or DD in Linux/Mac.

 

Sur mac : ou X est le numéro de disk

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df -h
sudo diskutil umount /dev/diskX && dd bs=1m if=/path/to.img of=/dev/diskX && diskutil eject diskX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

dans mon cas :

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo diskutil umount /dev/disk1s1 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo dd bs=1m if=Armbian_5.14_Odroidc2_Ubuntu_xenial_3.14.72/Armbian_5.14_Odroidc2_Ubuntu_xenial_3.14.72.raw of=/dev/disk1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo diskutil eject disk1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

l’installation doit prendre plusieurs minutes.

 

 

Premier démarrage
=================

Insérer la carte SD dans le slot prévu.

Connecter l’Odroid à l’alimentation (USB ou secteur).

Connecter Odroid à un écran par HDMI ou via usb grace au connecteur USB-UART.

 

First boot takes longer (around 3min) than usual (20s) because it updates
package list, regenerates SSH keys and expand partition to fit your SD card. It
might reboot one time automatically. Second boot also take little longer (around
3min) because it creates 128MB emergency swap space.

 

Connection root et création d’un user
-------------------------------------

user : root

Root password est : 1234

Un prompt demande de modifier ce password immédiatement.

Un autre prompt demande la création d’un utilisateur.

 

Faire la mise à jour du système via internet
--------------------------------------------

Connecter Odroid C2 à un accès internet via un cable ethernet.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get update && sudo apt-get upgrade -y
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

Odroid C2 est maintenant prêt à être paramètré.



##Installation automatique
~~~
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/auto_install_C2.sh
chmod +x auto_install_C2.sh
./auto_install_C2.sh
~~~