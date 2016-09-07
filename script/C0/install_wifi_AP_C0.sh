#!/bin/sh
apt-get install dnsmasq -y
#apt-get install iptables -y

#wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/interfaces.hostapd.web  &&
wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/interfaces.hostapd.noweb &&

#wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/hostapd.conf.web &&
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd.conf.noweb &&

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/wifi_noweb.sh
#wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/wifi_web.sh
#wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/reload_AP.sh
wget -P /etc/init.d https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/hostapd &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/dnsmasq.conf &&



# Attention à partir de la il n'y a plus de web
mv etc/network/interfaces etc/network/interfaces.ssid
ln -s /etc/network/interfaces.hostapd.noweb /etc/network/interfaces &&


mv /etc/hostapd.conf /etc/hostapd.conf.bkp

chmod +x wifi_noweb.sh
#chmod +x wifi_web.sh
#chmod +x reload_AP.sh

mv /etc/init.d/hostapd /etc/hostapd.bkp

chmod +x /etc/init.d/hostapd &&

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig &&

# activer le wifi en mode web (eth0 connection)
./wifi_noweb.sh

reboot