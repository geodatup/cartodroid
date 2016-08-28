#!/bin/sh
apt-get install dnsmasq -y
apt-get install iptables -y

rm /etc/network/interfaces 
ln -s /etc/network/interfaces.hostapd /etc/network/interfaces &&

wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/interfaces.hostapd.web  &&
wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/interfaces.hostapd.noweb &&

mv /etc/hostapd.conf /etc/hostapd.conf.bkp
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/hostapd.conf.web &&
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd.conf.noweb &&

wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/wifi_noweb.sh
wget https://raw.githubusercontent.com/geodatup/cartodroid/master/script/wifi_web.sh

chmod +x wifi_noweb.sh
chmod +x wifi_web.sh

mv /etc/init.d/hostapd /etc/hostapd.bkp
wget -P /etc/init.d https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/hostapd &&

chmod +x /etc/init.d/hostapd &&

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/dnsmasq.conf &&

mv /etc/sysctl.conf /etc/sysctl.conf.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/sysctl.conf &&

sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward" &&


sleep 5

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

sleep 5

sh -c "iptables-save > /etc/iptables.ipv4.nat" &&

mv /etc/rc.local /etc/rc.local.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src/rc.local &&

chmod +x /etc/rc.local &&
# activer le wifi en mode web (eth0 connection)
./wifi_web.sh

reboot