#!/bin/sh

#  auto_install_C2.sh
#  
#
#  Created by Hugo Roussaffa on 12/08/2016.
#

apt-get update && apt-get upgrade -y


apt-get autoremove libnl-route-3-200 -y

# configure wifi AP
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_wifi_AP.sh

chmod +x install_wifi_AP.sh

./install_wifi_AP.sh


# install Docker
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_docker.sh

chmod +x install_docker.sh

./install_docker.sh



# install pip et ipaddress (need by docker-compose)
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ipaddress



# install Docker Lizmap && Docker Postgis (64 bits)

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_geopoppy.sh

chmod +x install_geopoppy.sh

./install_geopoppy.sh

# configure wifi AP

echo 
"""
you may need to change interface name to wlan 0
get this file and change the mac address to your wifi adapter mac address
wget -P /etc/udev/rules.d/ https://github.com/geodatup/cartodroid/tree/master/wifi_AP_src/70-persistent-net.rules
you get your mac address with this command : ip addr
reboot the system
"""


# Samba
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/samba.sh

chmod +x samba.sh

./samba.sh

reboot
