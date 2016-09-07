#!/bin/sh

#  install_geopoppy.sh
#  
#
#  Created by Hugo Roussaffa on 07/09/2016.
#

# Construire son arborescence dans cartodroid

mkdir /home/geodatup
wget -P /home/geodatup https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_sig.tar &&
wget -P /home/geodatup https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_base.tar &&
tar xvfz /home/geodatup/geopoppy_sig.tar --preserve-permissions --same-owner -C / &&
tar xvfz /home/geodatup/geopoppy_base.tar --preserve-permissions --same-owner -C / &&

cd /home/GeoPoppy &&
rm docker-compose.yml
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/CO/docker-compose.yml
chmod +x docker-compose.yml 
docker-compose up -d
