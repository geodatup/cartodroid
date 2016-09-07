 

 

 

Installer Armbian (Odroid C0)
=============================

Contient Jessie

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
nano /etc/network/interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

supprimer les commentaires de la section \# Wireless adapter \#1

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Allow-hotplug wlan0
iface wlan0 inet dhcp 
    wpa-ssid xxx
    wpa-psk xxx
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Remplacez xxx par les paramètres wifi de votre box internet.

Verifier que la clé wifi est reconnue

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
iwconfig
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Démmarer la carte wifi

~~~
ifup wlan0
~~~

réponse :

~~~~
Internet Systems Consortium DHCP Client 4.3.1
Copyright 2004-2014 Internet Systems Consortium.
All rights reserved.
For info, please visit https://www.isc.org/software/dhcp/

Listening on LPF/wlan0/7c:dd:90:ad:67:c2
Sending on   LPF/wlan0/7c:dd:90:ad:67:c2
Sending on   Socket/fallback
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 5
DHCPDISCOVER on wlan0 to 255.255.255.255 port 67 interval 7
DHCPREQUEST on wlan0 to 255.255.255.255 port 67
DHCPOFFER from 192.168.1.1
DHCPACK from 192.168.1.1
bound to 192.168.1.47 -- renewal in 38708 seconds.
~~~~

notez l'adresse ip de votre carte.

un `reboot` fonctione aussi



Et que la connection à la box est bien possible

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ping 192.168.1.1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

On peut désormais mettre à jour le système

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get update && apt-get upgrade -y
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Et/ou installer automatiquement Cartodroid sur la board odroid-C0

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/auto_install_C0.sh
chmod +x auto_install_C0.sh
./auto_install_C0.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

l'opération peut prendre plusieurs dizaines de minutes.