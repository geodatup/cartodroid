 

Execute this as root:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ wheezy main" > /etc/apt/sources.list.d/hypriot.list 
sudo curl https://packagecloud.io/gpg.key
sudo apt-key add
sudo apt-get update
sudo apt-get -y install --no-install-recommends docker-hypriot
sudo apt-get -y install cgroupfs-mount
sudo reboot
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
