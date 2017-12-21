 
Activer la clé wifi
===================

Pour obtenir le nom de la clé

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ifconfig 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Dans `/etc/network/interfaces`

How to set wireless access point? (Jessie)
==========================================

There are two different hostapd daemons. One is **default** and the other one is
for some **Realtek** wifi cards. Both have their own basic configurations and
both are patched to gain maximum performances.

Sources: <https://github.com/igorpecovnik/hostapd>

Default binary and configuration location:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/sbin/hostapd
/etc/hostapd.conf
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

To start AP automatically:

1.  Edit `/etc/init.d/hostapd` and add/alter location of your conf
    file **`DAEMON\_CONF=/etc/hostapd.conf`** and
    binary **`DAEMON\_SBIN=/usr/sbin/hostapd`**

2.  Copy **`/etc/network/interfaces.hostapd`** to **`/etc/network/interfaces`**

3.  Reboot

4.  Predefined network name: “SSID” password: 12345678

5.  To change parameters, edit `/etc/hostapd.conf` BTW: You can get WPAPSK the
    long blob from wpa\_passphrase YOURNAME YOURPASS

 

Configurer le DNSMASQ
=====================
 

 

Wifi hotspot troubleshooting
============================

 

 
`root@odroidc2:~# hostapd /etc/hostapd.conf`

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

>make sur the hosted.conf is adapt to your wifi dongle


####Another errors messages

~~~
Configuration file: /etc/hostapd.conf
nl80211: Could not configure driver mode
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
nl80211 driver initialization failed.
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED 
hostapd_free_hapd_data: Interface wlan0 wasn't started
~~~

> relancer les services :
> `/etc/init.d/hostapd stop && /etc/init.d/dnsmasq stop && /etc/init.d/networking restart &&  hostapd /etc/hostapd.conf`

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Configuration file: /etc/hostapd.conf
Line 20: unknown configuration item 'noscan'
1 errors found in configuration file '/etc/hostapd.conf'
Failed to set up interface with /etc/hostapd.conf
Failed to initialize interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

>the line 20 should be commented

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
root@odroidc2:~# /etc/init.d/hostapd stop
[ ok ] Stopping hostapd (via systemctl): hostapd.service.
root@odroidc2:~# /etc/init.d/dnsmasq stop
[ ok ] Stopping dnsmasq (via systemctl): dnsmasq.service.
root@odroidc2:~# /etc/init.d/networking restart
[....] Restarting networking (via systemctl): networking.serviceWarning: Unit file of networking.service changed on disk, 'systemctl daemon-reload' recommended.
root@odroidc2:~# hostapd /etc/hostapd.conf
Configuration file: /etc/hostapd.conf
[....] Starting dnsmasq (via systemctl): dnsmasq.serviceUsing interface wlan0 with hwaddr 7c:dd:90:ad:67:c2 and ssid "SSID"
Job for dnsmasq.service failed. See 'systemctl status dnsmasq.service' and 'journalctl -xn' for details.
 failed!

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 
après une extinction inopinée de cartodroid 
~~~
hostapd /etc/hostapd.conf
Configuration file: /etc/hostapd.conf
nl80211: Could not configure driver mode
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
nl80211 driver initialization failed.
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED
hostapd_free_hapd_data: Interface wlan0 wasn't started
~~~



arreter  les sevices suivants :
~~~
/etc/init.d/hostapd stop
/etc/init.d/dnsmasq stop
/etc/init.d/networking restart
~~~
et les redemarer 

/etc/init.d/hostapd start
/etc/init.d/dnsmasq start




~~~
root@cartodroid:~# hostapd /etc/hostapd.conf
Configuration file: /etc/hostapd.conf
nl80211: Could not configure driver mode
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
nl80211 driver initialization failed.
wlan0: interface state UNINITIALIZED->DISABLED
wlan0: AP-DISABLED
hostapd_free_hapd_data: Interface wlan0 wasn't started
~~~

Une fois hostapd lancé
connectez un terminal au hotspot

un message de ce type doit apparaitre

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wlan0: STA 00:26:08:f6:83:01 IEEE 802.11: authenticated
wlan0: STA 00:26:08:f6:83:01 IEEE 802.11: associated (aid 1)
wlan0: AP-STA-CONNECTED 00:26:08:f6:83:01
wlan0: STA 00:26:08:f6:83:01 RADIUS: starting accounting session 4945A99A-00000000
wlan0: STA 00:26:08:f6:83:01 WPA: pairwise key handshake completed (RSN)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

la connection est alors établie.

lorsque vous vous deconectez ces messages apparaissent
~~~
wlan0: AP-STA-DISCONNECTED 80:56:f2:25:98:4b
wlan0: STA 80:56:f2:25:98:4b IEEE 802.11: disassociated
wlan0: interface state ENABLED->DISABLED
wlan0: AP-DISABLED
nl80211: deinit ifname=wlan0 disabled_11b_rates=0
~~~



lancer la commande pour voir ce qui se passe en live

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tail -f  /var/log/messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ou verifier les status des services 

~~~
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
~~~


ifdown wlan0 && ifup wlan0 
et relancer dnsmasq



si internet n'est pas accessible redemarer le bridge
DO
ifdown br0 && ifup br0

et si lizmap n'est pas accessible mais que internet l'est
deconnection du client du AP wifi 

DO 
ifdown eth0 && ifup eth0

si la box n'est pas accessible mais qu'internet l'est
ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
From 192.168.1.98 icmp_seq=1 Destination Host Unreachable

DO
ifconfig eth0 192.168.1.98


CAS déconnection à chaud du eth0
+ deconnection / reconnection de la clé wifi car erreur et disparition du SSID
~~~
[ 1436.176842] ieee80211 phy1: rt2x00usb_vendor_request: Error - Vendor Request 0x06 failed for offset 0x0408 with error -110
~~~

la clé s'allume: débrancher et rebrancher clé wifi

RUN
./wifi_noweb.sh


---
/etc/init.d/dnsmasq restart
/etc/init.d/hostapd restart

peut être nécessaire de relancer hostapd avec cette commande 
hostapd /etc/hostapd.conf
puis 
/etc/init.d/hostapd restart

-> connection limité pas d'internet
Perte de lizmap ...
verifier 
systemctl status networking.service
● networking.service - Raise network interfaces
   Loaded: loaded (/lib/systemd/system/networking.service; enabled; vendor prese
  Drop-In: /etc/systemd/system/networking.service.d
           └─10-nostop.conf
        /run/systemd/generator/networking.service.d
           └─50-insserv.conf-$network.conf
   Active: failed (Result: timeout) since Sat 2017-08-12 08:30:44 UTC; 45min ago
     Docs: man:interfaces(5)
  Process: 708 ExecStart=/sbin/ifup -a --read-environment (code=killed, signal=T
  Process: 508 ExecStartPre=/bin/sh -c [ "$CONFIGURE_INTERFACES" != "no" ] && [
 Main PID: 708 (code=killed, signal=TERM)

Aug 12 08:25:43 cartodroid systemd[1]: Starting Raise network interfaces...
Aug 12 08:25:44 cartodroid ifup[708]: /sbin/ifup: waiting for lock on /run/netwo
Aug 12 08:30:44 cartodroid systemd[1]: networking.service: Start operation timed
Aug 12 08:30:44 cartodroid systemd[1]: Failed to start Raise network interfaces.
Aug 12 08:30:44 cartodroid systemd[1]: networking.service: Unit entered failed s
Aug 12 08:30:44 cartodroid systemd[1]: networking.service: Failed with result 't
Warning: networking.service changed on disk. Run 'systemctl daemon-reload' to re

DO
systemctl daemon-reload
sleep 2
service dnsmasq restart
sleep 5
service networking restart
sleep 5
service hostapd restart

-> supprime le AP
DO 
service hostapd restart


CAS extinction innopinée en mode WIFI no web
verifier 

lrwxrwxrwx 1 root root    31 Aug 12 11:52 interfaces -> /etc/network/interfaces.hostapd


try ./wifi_noweb.sh
- Plus de AP

./reload_AP.sh

- networking failed

systemctl daemon-reload
service networking restart

try ./wifi_noweb.sh


CAS reconnection à chaud du eth0 / connecté au AP wlan0

---

aucune IP sur wlan

~~~
ifdown wlan0
ifup wlan0
/etc/init.d/dnsmasq restart 
~~~

no responding :

~~~
ifdown: waiting for lock on /run/network/ifstate.wlan0
~~~
 wait 5 min


---
#Outils de debug
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
