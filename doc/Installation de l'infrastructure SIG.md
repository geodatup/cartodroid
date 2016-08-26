Installation de l’infrastructure SIG
====================================

 

Construire l’arborescence
-------------------------

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mkdir /home/pi
wget -P /home/pi https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_sig.tar 
wget -P /home/pi https://github.com/jancelin/geo-poppy/raw/master/install/geopoppy_base.tar
tar xvfz /home/pi/geopoppy_sig.tar --preserve-permissions --preserve-order --same-owner -C /
tar xvfz /home/pi/geopoppy_base.tar --preserve-permissions --preserve-order --same-owner -C /
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

Installation de lizmap et postgis
---------------------------------

L’installation des images se font sur une architecture arm64.

Nous avons choisi celle ci pour être compatible avec le server Docker qui tourne
correctement sur l’Odroid C2 (Armbian Serveur Ubuntu Xenial).

**aarch64/debian**

 

### Installation rapide

Télécharger le fichier docker-compose

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wget -P /home/geodatup https://raw.githubusercontent.com/geodatup/cartodroid/master/script/docker-compose.yml
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lancer le avec la commande

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker-compose up -d
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### Installation manuelle

Lancer le build Docker depuis ces dépôts :

**Lizmap & Qgis-Server**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t geodatup/lizmap git://github.com/geodatup/docker-lizmap-odroidC2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker run --restart="always" --name "lizmap" -p 80:80 -d -t -v /home/lizmap_project:/home -v /home/GeoPoppy/lizmap_project/lizmap_var:/var/www/websig/lizmap/var geopoppy_lizmap
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Postgis**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t geodatup/postgis git://github.com/geodatup/docker-postgis-odroidC2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker run --restart="always" --name "postgis" -p 5432 -d -v /home/GeoPoppy/postgres_data:/var/lib/postgresql geopoppy_postgis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

Troubleshooting
---------------

Lorsqu’on accède à la page

<http://172.24.1.1/websig/lizmap/www/>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Error 500. A technical error has occured. Sorry for this trouble.Application log directory is not writable
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
