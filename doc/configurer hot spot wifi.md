 
Activer la clé wifi
===================

Pour obtenir le nom de la clé

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ifconfig 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

Dans /etc/network/interfaces

 

 

 

How to set wireless access point? (Jessie)
==========================================

There are two different hostap daemons. One is **default** and the other one is
for some **Realtek** wifi cards. Both have their own basic configurations and
both are patched to gain maximum performances.

Sources: <https://github.com/igorpecovnik/hostapd>

Default binary and configuration location:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/sbin/hostapd
/etc/hostapd.conf
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

To start AP automatically:

1.  Edit /etc/init.d/hostapd and add/alter location of your conf
    file **DAEMON\_CONF=/etc/hostapd.conf** and
    binary **DAEMON\_SBIN=/usr/sbin/hostapd**

2.  Copy **/etc/network/interfaces.hostapd** to **/etc/network/interfaces**

3.  Reboot

4.  Predefined network name: “SSID” password: 12345678

5.  To change parameters, edit /etc/hostapd.conf BTW: You can get WPAPSK the
    long blob from wpa\_passphrase YOURNAME YOURPASS

 

Configurer le DNSMASQ
=====================

 

 

 

 

Wifi hotspot troubleshooting
============================

 

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
root@odroidc2:~# hostapd /etc/hostapd.conf
Configuration file: /etc/hostapd.conf
Driver does not support configured HT capability [DSSS_CCK-40]
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED 
wlan0: Unable to setup interface.
wlan0: interface state DISABLED->DISABLED
wlan0: AP-DISABLED 
hostapd_free_hapd_data: Interface wlan0 wasn't started
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

make sur the hosted.conf is adapt to your wifi dongle

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
root@odroidc2:~# hostapd /etc/hostapd.conf
Configuration file: /etc/hostapd.conf
Line 20: unknown configuration item 'noscan'
1 errors found in configuration file '/etc/hostapd.conf'
Failed to set up interface with /etc/hostapd.conf
Failed to initialize interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

the line 20 should be commented

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
root@odroidc2:~# /etc/init.d/hostapd stop
[ ok ] Stopping hostapd (via systemctl): hostapd.service.
root@odroidc2:~# /etc/init.d/dnsmasq stop
[ ok ] Stopping dnsmasq (via systemctl): dnsmasq.service.
root@odroidc2:~# /etc/init.d/networking restart
[....] Restarting networking (via systemctl): networking.serviceWarning: Unit file of networking.service changed on disk, 'systemctl daemon-reload' recommended.
. ok 
root@odroidc2:~# [1] 1680
Configuration file: /etc/hostapd.conf
[....] Starting dnsmasq (via systemctl): dnsmasq.serviceUsing interface wlan0 with hwaddr 7c:dd:90:ad:67:c2 and ssid "SSID"
Job for dnsmasq.service failed. See 'systemctl status dnsmasq.service' and 'journalctl -xn' for details.
 failed!
root@odroidc2:~# wlan0: interface state UNINITIALIZED->ENABLED
wlan0: AP-ENABLED 
root@odroidc2:~# systemctl status dnsmasq.service
● dnsmasq.service - dnsmasq - A lightweight DHCP and caching DNS server
   Loaded: loaded (/lib/systemd/system/dnsmasq.service; enabled)
  Drop-In: /run/systemd/generator/dnsmasq.service.d
           └─50-dnsmasq-$named.conf, 50-insserv.conf-$named.conf
   Active: failed (Result: exit-code) since Wed 2016-08-10 09:07:30 CEST; 20s ago
  Process: 1189 ExecStop=/etc/init.d/dnsmasq systemd-stop-resolvconf (code=exited, status=0/SUCCESS)
  Process: 782 ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf (code=exited, status=0/SUCCESS)
  Process: 1692 ExecStart=/etc/init.d/dnsmasq systemd-exec (code=exited, status=2)
  Process: 1690 ExecStartPre=/usr/sbin/dnsmasq --test (code=exited, status=0/SUCCESS)
 Main PID: 780 (code=exited, status=0/SUCCESS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

lancer la commande pour voir ce qui se passe en live

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tail -f  /var/log/messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

connecter un terminal au hotspot

un message de ce type doit apparaitre

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wlan0: STA 00:26:08:f6:83:01 IEEE 802.11: authenticated
wlan0: STA 00:26:08:f6:83:01 IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 00:26:08:f6:83:01
wlan0: STA 00:26:08:f6:83:01 RADIUS: starting accounting session 4945A99A-00000000
wlan0: STA 00:26:08:f6:83:01 WPA: pairwise key handshake completed (RSN)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

la connection est alors établie.

### aucune IP sur wlan
~~~
ifdown wlan0
ifup wlan0
/etc/init.d/dnsmasq restart 
~~~


###IPTABLES
`iptables -nvL`

`iptables -L --line-numbers`

 voir la [doc](http://www.octetmalin.net/linux/tutoriels/ip-forward.php) 
 
 ~~~
 sysctl net.ipv4.ip_forward
 sysctl -w net.ipv4.ip_forward=1
nano /etc/sysctl.conf
 sysctl -p /etc/sysctl.conf
 ~~~

###Check routes


~~~
route -n
~~~


##Ip en temps réel
~~~
ip monitor
~~~
