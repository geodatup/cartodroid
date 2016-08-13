#!/bin/sh
apt-get install dnsmasq -y
apt-get install iptables -y
mv /etc/network/interfaces.hostapd /etc/network/interfaces.hostapd.bkp &&
wget -P /etc/network https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/interfaces.hostapd &&
mv /etc/network/interfaces /etc/network/interfaces.bkp &&

ln -s /etc/network/interfaces.hostapd /etc/network/interfaces &&

wget -P /etc/network https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/interfaces.hostapd &&

#sudo ifdown wlan0; sudo ifup wlan0 &&
mv /etc/hostapd.conf /etc/hostapd.conf.bkp
wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/hostapd.conf &&

mv /etc/init.d/hostapd /etc/hostapd.bkp
wget -P /etc/init.d https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/hostapd &&

chmod +x /etc/init.d/hostapd &&

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/dnsmasq.conf &&

mv /etc/sysctl.conf /etc/sysctl.conf.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/sysctl.conf &&

sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward" &&

sleep 5

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -A FORWARD -i eth0 -o wlx7cdd90ad67c2 -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i wlx7cdd90ad67c2 -o eth0 -j ACCEPT

sleep 5

sh -c "iptables-save > /etc/iptables.ipv4.nat" &&

mv /etc/rc.local /etc/rc.local.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/rc.local &&

chmod +x /etc/rc.local &&

service hostapd start

service dnsmasq start
