


cp /etc/network/interfaces.hostapd.noweb /etc/network/interfaces.hostapd

cp /etc/hostapd.conf.noweb /etc/hostapd.conf

service hostapd restart

service dnsmasq restart
