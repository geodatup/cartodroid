#!/bin/sh

#  auto_install_docker.sh
#  
#
#  Created by Zugi R on 12/08/2016.
#

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


echo "deb https://apt.dockerproject.org/repo jessie main" > /etc/apt/sources.list.d/docker.list 




apt-get install docker.io -y
# impossible d'installer docker-compose avec apt-get. on contourne avec PIP
pip install docker-compose 
