#!/bin/sh

#  auto_install_geodroid_C2.sh
#  
#
#  Created by Hugo Roussaffa on 12/08/2016.
#

apt-get update && apt-get upgrade -y


apt-get autoremove libnl-route-3-200

# configure wifi AP
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_wifi_AP.sh

chmod +x install_wifi_AP.sh

./install_wifi_AP.sh


# install Docker
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/install_docker_C2.sh

chmod +x install_docker_C2.sh

./install_docker_C2.sh



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



#apt-get install -y dnsmasq &&
#mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig &&
#
#wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/dnsmasq.conf &&
#
#
#
#git clone https://github.com/oblique/create_ap
#cd create_ap
#make install
#
#wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/create_dynamic_AP.sh

#chmod +x create_dynamic_AP.sh

#systemctl start create_ap -n wlan0 MyAccessPoint
#systemctl enable create_ap
#
# Conf create_ap !!!
# ./create_dynamic_AP

# Samba
apt-get install -y samba samba-common python-glade2 system-config-samba

/etc/init.d/samba restart

reboot
