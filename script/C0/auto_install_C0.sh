#!/bin/sh

#  auto_install_C0.sh
#  
#
#  Created by Hugo Roussaffa on 07/09/2016.
#

apt-get update && apt-get upgrade -y

# this package is useless
apt-get autoremove libnl-route-3-200 -y


# install Docker
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_docker.sh

chmod +x install_docker.sh

./install_docker.sh


# install pip et ipaddress (need by docker-compose)
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ipaddress


# install Docker Lizmap && Docker Postgis (32 bits)

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/install_geopoppy.sh

chmod +x install_geopoppy.sh

./install_geopoppy.sh


# Samba
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/samba.sh

chmod +x samba.sh

./samba.sh

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/readbatvol_C0.sh

chmod +x readbatvol_C0.sh


# configure wifi AP
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/install_wifi_AP_C0.sh

chmod +x install_wifi_AP_C0.sh

./install_wifi_AP_C0.sh


reboot
