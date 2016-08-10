 

Execute this as root:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ jessie main" > /etc/apt/sources.list.d/hypriot.list 
curl https://packagecloud.io/gpg.key
apt-key add
apt-get update
apt-get -y install --no-install-recommends docker-hypriot
apt-get -y install cgroupfs-mount
reboot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
