systemctl daemon-reload
service hostapd stop
service dnsmasq stop

sleep 5
service hostapd start
service dnsmasq start