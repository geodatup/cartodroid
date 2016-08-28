Accès aux données
=================

 

Créer un serveur de fichier samba
---------------------------------

 

Installer Samba

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get install -y samba samba-common python-glade2 system-config-samba
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

configurer Samba

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nano /etc/samba/smb.conf
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ajouter

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[global]
workgroup = CartodroidGroup
server string = Carto Server
netbios name = MyCartodroid
security = user
map to guest = bad user
dns proxy = no
#===== Share Definitions =====
[lizmap_project]
path = /home/GeoPoppy/lizmap_project
browsable = yes
writable = yes
guest ok = yes
read only = no
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

renommer hostname

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nano /etc/hostname
cartodroid
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 
configurer host

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(for i in $(seq 50 150); do echo 172.24.1.50 $i client$i; done) >> /etc/hosts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configurer les droits d'ecriture au dossier. On ajoute user au groupe www-data

~~~

~~~



Redemarer samba et tester la connection depuis un autre ordinateur sur le reseau

~~~
/etc/init.d/samba restart
~~~




Démarrage automatique de samba.

Modifier le fichier `/etc/rc.local` en ajoutant avant `exit 0`

~~~
/etc/init.d/samba restart
~~~


 

Créer un server FTP
-------------------

 > n'est pas fonctionnel en wifi direct pour l'instant

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
apt-get install pure-ftpd pure-ftpd-common
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

voir la documentation de lizmap à ce sujet 


 [Lizmap doc](http://docs.3liz.com/fr/install/linux.html)

 

 

Troubleshooting
---------------

### Le projet s’affiche mais pas les layers Postgis

les projets doivent impérativement :

-   avoir une étendu correspondante à la vue souhaitée.

-   les parametres de connection "user mdp " doivent aparaitre dans le fichier
    du qgs du projet

-   les entités modifiables doivent être WFS compliant (OWS projet)

-   les multipolygones ne peuvent être édité sur Lizmap

 

### le projet ne s’affiche pas 

-   le nom du fichier projet qgs ne doit pas comporter d'espace
