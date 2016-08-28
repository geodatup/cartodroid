ifdown eth 0br0


ifdown wlan0
ifup wlan0
systemctl daemon-reload
service hostapd restart
service dnsmasq restart
service networking restart