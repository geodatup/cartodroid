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

sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/dnsmasq.conf &&

sudo mv /etc/sysctl.conf /etc/sysctl.conf.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/sysctl.conf &&

sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward" &&

sleep 5

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  

sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  

sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT 

sleep 5

sudo sh -c "iptables-save > /etc/iptables.ipv4.nat" &&

sudo mv /etc/rc.local /etc/rc.local.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/geodroid/master/wifi_AP_src/rc.local &&

chmod +x rc.local &&

sudo service hostapd start 

sudo service dnsmasq start
