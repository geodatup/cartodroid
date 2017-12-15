

ifdown wlan0
sleep 2
ifup wlan0
sleep 2

ifdown br0
ifup br0

systemctl daemon-reload
service hostapd stop
service dnsmasq stop

sleep 5

service hostapd start
service dnsmasq start
service networking restart

/etc/init.d/samba restart

