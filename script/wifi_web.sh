
cp /etc/network/interfaces.hostapd.web /etc/network/interfaces.hostapd
cp /etc/hostapd.conf.web /etc/hostapd.conf


#ifdown wlan0
#ifup wlan0


./reload_AP.sh 

echo "wifi with web"