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
sudo diskutil umount /dev/disk1s2 
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

Un prompt  demande de modifier ce password immédiatement.

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

 

Alimentation batterie Lipo
==========================

 

La batterie est fournie pleine ?

 

Script : Auto shutdown
----------------------

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/sh
MODEL=$(cat /proc/cpuinfo | grep ^Hardware | awk -F " " '{print $3}')
SYSFS_GPIO_DIR="/sys/class/gpio"

retval=""

gpio_export()
{
        [ -e "$SYSFS_GPIO_DIR/gpio$1" ] && return 0
        echo $1 > "$SYSFS_GPIO_DIR/export"
}

gpio_getvalue()
{
	echo in > "$SYSFS_GPIO_DIR/gpio$1/direction"
        val=`cat "$SYSFS_GPIO_DIR/gpio$1/value"`
        retval=$val
}

gpio_setvalue()
{
	echo out > "$SYSFS_GPIO_DIR/gpio$1/direction"
        echo $2 > "$SYSFS_GPIO_DIR/gpio$1/value"
}

if test $MODEL = "ODROIDC"
then
        AC_OK_GPIO=88
        BAT_OK_GPIO=116
	LATCH_GPIO=115
	gpio_export $LATCH_GPIO 
	gpio_setvalue $LATCH_GPIO 1
elif test $MODEL = "ODROID-C2"
then
        AC_OK_GPIO=247
        BAT_OK_GPIO=239
	LATCH_GPIO=225
	gpio_export $LATCH_GPIO 
	gpio_setvalue $LATCH_GPIO 1
else 
        AC_OK_GPIO=199
        BAT_OK_GPIO=200
fi

gpio_export $AC_OK_GPIO
gpio_export $BAT_OK_GPIO
gpio_getvalue $AC_OK_GPIO
if [ $retval -eq  1 ]
then
        echo "DC Input Okay"
else
        echo "Power is shutdown or AC Adaptor is disconnected"
        gpio_getvalue $BAT_OK_GPIO
        echo $retval
        if [ $retval -eq 0 ]
        then
                echo "battery is lower than 3.7V"
                /sbin/shutdown -P 1
        else
                echo "battery is good"
        fi
fi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### Cron setup

This can be set up by running: **\$ sudo crontab -e**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# m h  dom mon dow   command
*/2 * * * * /home/odroid/ups3.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The script will run every 2 minutes.

 

Script : niveau batterie
------------------------

### Read Battery Voltage Script on ODROID-C0

This script read the voltage of battery from ADC channel 0.  
Save the following code as readbatvol.sh in home directory.  


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/sh
#
# Read Battery Voltage on ODROID-C0
#

ADCRES=0.004106
ADCVAL=$(cat /sys/class/saradc/saradc_ch0)
BATTVOL=$(echo $ADCRES*$ADCVAL | bc)
echo Battery voltage is $BATTVOL V
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please change the script permissions to execute with chmod.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo chmod a+x readbatvol.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Execute the script to read battery voltage.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./readbatvol.sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
