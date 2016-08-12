#!/bin/sh

#  auto_install_geodroid_C2.sh
#  
#
#  Created by Hugo Roussaffa on 12/08/2016.
#

apt-get update && apt-get upgrade -y

wget https://raw.githubusercontent.com/geodatup/geodroid/master/script/install_wifi_AP.sh

chmod +x install_wifi_AP.sh

./install_wifi_AP.sh

wget https://raw.githubusercontent.com/geodatup/geodroid/master/script/install_docker_C2.sh

chmod +x install_docker_C2.sh

./install_docker_C2.sh

reboot
