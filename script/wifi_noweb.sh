


cp /etc/network/interfaces.hostapd.noweb /etc/network/interfaces.hostapd

cp /etc/hostapd.conf.noweb /etc/hostapd.conf


ifdown wlan0
ifup wlan0
systemctl daemon-reload
service hostapd restart
service dnsmasq restart
