#!/bin/sh
wget -P /etc/network https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/interfaces.hostapd.noweb &&
wget -P /etc https://raw.githubusercontent.com/geodatup/cartodroid/master/wifi_AP_src-disable/hostapd.conf.noweb &&
