#!/bin/sh
#apt-get install dnsmasq -y
#apt-get install iptables -y
mv /etc/network/interfaces.hostapd /etc/network/interfaces.hostapd-enabled.bkp &&
mv /etc/network/interfaces /etc/network/interfaces-enabled.bkp &&

touch /etc/network/interfaces
ln -s /etc/network/interfaces.hostapd /etc/network/interfaces &&

wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/interfaces.hostapd &&

#sudo ifdown wlan0; sudo ifup wlan0 &&
mv /etc/hostapd.conf /etc/hostapd-enabled.conf.bkp
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd.conf &&

mv /etc/init.d/hostapd /etc/hostapd-enabled.bkp
wget -P /etc/init.d https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd &&

chmod +x /etc/init.d/hostapd &&

mv /etc/dnsmasq.conf /etc/dnsmasq-enabled.conf.orig &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/dnsmasq.conf &&

mv /etc/sysctl.conf /etc/sysctl-enabled.conf.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/sysctl.conf &&

#sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward" &&
echo 0 > /proc/sys/net/ipv4/ip_forward &&
sysctl -p /etc/sysctl.conf

#iptables-restore
sleep 5

#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT

#iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

#sleep 5

#sh -c "iptables-save > /etc/iptables.ipv4.nat" &&

mv /etc/rc.local /etc/rc.local.bak &&

wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/rc.local &&

chmod +x /etc/rc.local &&

service hostapd restart

service dnsmasq restart
