#!/bin/sh

apt-get install -y samba samba-common python-glade2 system-config-samba

mv /etc/samba/smb.conf /etc/samba/smb.conf.bkp

wget -P /etc/samba/ https://raw.githubusercontent.com/geodatup/cartodroid/master/samba-files/smb.conf

# donner les droits d'ecriture aux invités au dossier lizmap
chmod ugo+w -R /home/GeoPoppy/lizmap

mv /etc/hostname /etc/hostname.bkp
wget -P /etc/ https://raw.githubusercontent.com/geodatup/cartodroid/master/samba-files/hostname


(for i in $(seq 50 150); do echo 172.24.1.$i client$i; done) >> /etc/hosts



/etc/init.d/samba restart

