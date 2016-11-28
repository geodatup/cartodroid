


#Mise en réseau du serveur C2 


Brancher la batterie


Connecter le serveur avec un cable Ethernet à la box.
Allumer le server
Créer un bail DHCP static sur la box

##Test de fonctionnement :
A parir d'un navigateur internet connecter au server en indiquant dans la barre url, l'adresse IP du serveur.

# configurer la redirection sur serveur par NGINX à l'appel de l'url



ajouter un module a apache dans le container Lizmap
~~~
apt-get install libapache2-mod-rpaf

sudo vi /etc/apache2/mods-enabled/rpaf.conf
~~