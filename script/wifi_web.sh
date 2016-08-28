
cp /etc/network/interfaces.hostapd.web /etc/network/interfaces.hostapd

cp /etc/hostapd.conf.web /etc/hostapd.conf

service hostapd restart

service dnsmasq restart