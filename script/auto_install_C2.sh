#!/bin/sh

#  auto_install_geodroid_C2.sh
#  
#
#  Created by Hugo Roussaffa on 12/08/2016.
#

apt-get update && apt-get upgrade -y


# configure wifi AP
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_wifi_AP.sh

chmod +x install_wifi_AP.sh

./install_wifi_AP.sh


# install Docker
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_docker_C2.sh

chmod +x install_docker_C2.sh

./install_docker_C2.sh


# install Docker Lizmap && Docker Postgis (64 bits)

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_geopoppy.sh

chmod +x install_geopoppy.sh

./install_geopoppy.sh



# install pip et ipaddress (need by cdocker-compose)
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ipadress

reboot
