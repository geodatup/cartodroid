#!/bin/sh
#apt-get install dnsmasq -y
#apt-get install iptables -y

rm /etc/network/interfaces.hostapd

wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/interfaces.hostapd &&

mv /etc/hostapd.conf /etc/hostapd.conf.AP
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd.conf &&


service hostapd restart

#service dnsmasq restart
