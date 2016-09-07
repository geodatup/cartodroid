#!/bin/sh

#  auto_install_C0.sh
#  
#
#  Created by Hugo Roussaffa on 07/09/2016.
#

apt-get update && apt-get upgrade -y

# this package is useless
apt-get autoremove libnl-route-3-200 -y

# configure wifi AP
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/install_wifi_AP_C0.sh

chmod +x install_wifi_AP_C0.sh

./install_wifi_AP_C0.sh


# install Docker
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/install_docker_C0.sh

chmod +x install_docker_C0.sh

./install_docker_C0.sh


# install pip et ipaddress (need by docker-compose)
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ipaddress


# install Docker Lizmap && Docker Postgis (64 bits)

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/C0/install_geopoppy.sh

chmod +x install_geopoppy.sh

./install_geopoppy.sh


# Samba
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/samba.sh

chmod +x samba.sh

./samba.sh

reboot
