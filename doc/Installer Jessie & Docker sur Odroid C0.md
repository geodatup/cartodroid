Installer Armbian (Odroid C0)
=============================

Contient Jessie + Docker

obtenir l'image sur le site

<http://www.armbian.com/odroid-c1/>

 

 

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
sudo dd bs=1m if=Desktop/odroid/Armbian_5.14_Odroidc1_Debian_jessie_3.10.102/Armbian_5.14_Odroidc1_Debian_jessie_3.10.102.raw of=/dev/disk1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo diskutil eject disk1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

l’installation doit prendre plusieurs minutes.

 

 

Premier démarrage
=================

 

A l’achat, le C0 détient aucune connectique pour le piloter. Heureusement, un
pack DIY est disponible pour moins de 2\$. Connecteur USB à souder, et/ou
connecteur UART (auquel il faut ajouter un cable USB-UART pour pouvoir le
piloter via ssh).

Je conseil de souder aussi un ou deux ports USB.

 

Insérer la carte SD dans le slot prévu.

Connecter l’Odroid à l’alimentation (USB ou secteur).

Connecter Odroid à un écran par HDMI ou via usb grace au connecteur USB-UART

 

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

 

Mise à jour du système via internet
-----------------------------------

Pour effectuer la connection internet il faudra insérer une clé wifi dans un des
ports USB.

L’accès wifi n’est pas plug&play, il faut configurer le wifi.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo nano /etc/network/interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

supprimer les commentaires de la section \# Wireless adapter \#1

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Allow-hotplug wlan0
face wlan0 inet dhcp 
    wpa-ssid xxx
    wpa-psk xxx
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

Remplacez xxx par les paramètres wifi de votre box internet.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo reboot 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Verifier que la clé wifi est reconnue

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo iwconfig
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Et que la connection à la box est bien possible

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo ping 192.168.1.1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

On peut désormais mettre à jour le système

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get update && sudo apt-get upgrade -y
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

1.  Edit /etc/init.d/hostapd and add/alter location of your conf
    file **DAEMON\_CONF=/etc/hostapd.conf** and
    binary **DAEMON\_SBIN=/usr/sbin/hostapd**

2.  Link **/etc/network/interfaces.hostapd** to **/etc/network/interfaces**

3.  Reboot

4.  Predefined network name: “BOARD NAME” password: 12345678

5.  To change parameters, edit /etc/hostapd.conf BTW: You can get WPAPSK the
    long blob from wpa\_passphrase YOURNAME YOURPASS

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get install dnsmasq
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 
