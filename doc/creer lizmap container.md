Docker
======

 

 

sous le capot

-   Debian arch64

-   php7

-    

 

Démarre un nouveau container

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker run -t -i aarch64/ubuntu /bin/bash
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

 

echo "deb http://qgis.org/debian xenial main" \>\> /etc/apt/sources.list

echo "deb-src http://qgis.org/debian xenial main" \>\> /etc/apt/sources.list

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get install -y python-simplejson xauth htop nano curl ntp ntpdate python-software-properties git wget unzip apache2 libapache2-mod-fcgid php7.0 php7.0-cgi php7.0-curl php7.0-cli php7.0-sqlite php7.0-gd php7.0-pgsql libapache2-mod-php7.0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
a2dismod php7.0; a2enmod actions; a2enmod fcgid ; a2enmod ssl; a2enmod rewrite; a2enmod headers; a2enmod deflate; a2enmod php7.0
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get install qgis-server python-qgis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

mod\_deflate.conf /etc/apache2/conf.d/mod\_deflate.conf

\#config php5

php.conf /etc/apache2/conf.d/php.conf

\# Remove the default mod\_fcgid configuration file

rm -v /etc/apache2/mods-enabled/fcgid.conf

\# Copy a configuration file from the current directory

fcgid.conf /etc/apache2/mods-enabled/fcgid.conf

\# Open port 80 & mount /home

EXPOSE 80

\# Mount /home (persistent data)

VOLUME /home

apache2.conf /etc/apache2/apache2.conf

apache.conf /etc/apache2/sites-available/000-default.conf

apache.conf /etc/apache2/sites-enabled/000-default.conf

fcgid.conf /etc/apache2/mods-available/fcgid.conf

pg\_service.conf /etc/pg\_service.conf

\# pg service file

ENV PGSERVICEFILE /etc/pg\_service.conf

 

 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t geodatup/rpi-docker-lizmap git://github.com/geodatup/rpi-docker-lizmap
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

docker build -t jancelin/rpi-docker-lizmap
git://github.com/jancelin/rpi-docker-lizmap

 

 

apt-get install -y  python-simplejson xauth htop vim curl ntp ntpdate
python-software-properties git wget unzip apache2=2.4.10-10+deb8u5
apache2-mpm-worker=2.4.10-10+deb8u5 apache2-mpm-prefork=2.4.10-10+deb8u5
apache2-bin=2.4.10-10+deb8u5 apache2-data=2.4.10-10+deb8u5
libapache2-mod-fcgid=1:2.3.9-1+b1 libapache2-mod-php5=5.6.24+dfsg-0+deb8u1
php5=5.6.24+dfsg-0+deb8u1 php5-common=5.6.24+dfsg-0+deb8u1
php5-cgi=5.6.24+dfsg-0+deb8u1 php5-curl=5.6.24+dfsg-0+deb8u1
php5-cli=5.6.24+dfsg-0+deb8u1 php5-sqlite=5.6.24+dfsg-0+deb8u1
php5-gd=5.6.24+dfsg-0+deb8u1 php5-pgsql=5.6.24+dfsg-0+deb8u1

 

gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010

gpg -a --export 7638D0442B90D010 \| sudo apt-key add -
