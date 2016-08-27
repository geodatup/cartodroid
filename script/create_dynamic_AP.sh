#!/bin/sh

# set NATing rules
iptables -t nat -I POSTROUTING -s 172.24.1.1 ! -o ap0 -j MASQUERADE
iptables -I FORWARD -i ap0 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/conf/all/forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# allow PPTP VPN behind our NAT
modprobe nf_nat_pptp

# create AP
create_ap -n wlan0 MyAccessPoint MyPassPhrase
ret=$?

# cleanup
iptables -t nat -D POSTROUTING -s 172.24.1.1 ! -o ap0 -j MASQUERADE
iptables -D FORWARD -i ap0 -j ACCEPT

exit $ret