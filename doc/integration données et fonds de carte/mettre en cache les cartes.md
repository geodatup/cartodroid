# Mise en cache des données pour le terrain


ouvrir le docker Lizmap

~~~
docker exec -it geopoppy_lizmap_1 bash
~~~

Aller ici

~~~
cd /var/www/websig/lizmap/scripts/
~~~

~~~
php script.php lizmap~wmts:capabilities geopoppy Rouyre_cadastre_imagerie
~~~

~~~
php script.php lizmap~wmts:capabilities geopoppy Rouyre_Imagerie drone_janvier_2016 EPSG:3857

php script.php lizmap~wmts:capabilities geopoppy Rouyre_Imagerie drone_janvier_2016 EPSG:2154
~~~

~~~
php script.php lizmap~wmts:capabilities geopoppy Rouyre_cadastre_imagerie ign_cadastre_rouyre_10k EPSG:2154
~~~




#Seeder 

###Drone rouyre 2016
~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_Imagerie drone_janvier_2016 EPSG:2154 0 8
~~~

### Imagerie
~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie Imagerie EPSG:2154 0 6
~~~

### Cadastre
~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie ign_cadastre_rouyre_1k EPSG:2154 4 5
~~~

~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie ign_cadastre_rouyre_10k EPSG:2154 0 3
~~~

### tout à la suite
~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie Imagerie EPSG:2154 0 6
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie ign_cadastre_rouyre_1k EPSG:2154 4 5
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_cadastre_imagerie ign_cadastre_rouyre_10k EPSG:2154 0 3
~~~


###OSM
~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_Imagerie osm_mapnik EPSG:3857 0 23
~~~

~~~
php script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_Imagerie osm_mapnik EPSG:3857 0 8
~~~


###IGN

~~~
php /var/www/websig/lizmap/scripts/script.php lizmap~wmts:seeding -v -f geopoppy Rouyre_Imagerie ign-photo EPSG:2154 0 5

~~~


#Vider le cache server

Se connecter en tant qu'admin sur le server. Dans la console d'admin, aller dans le projet et cliquer sur "vider le cache". 

Vérfier si le log n'est pas remplis par des erreurs.

~~~
lizmap/project/.../var/log
~~~


L'opération peut prendre plusieurs minutes. Afin de voir si le déroulement de la vidange s'effectue correctement, vérifier que la taille du dossier /tmp diminue.

Depuis le container lizmap :

~~~
du -sch /tmp/ 
~~~

Depuis la machine hote :

~~~
/home/Geopoppy/lizmap/project/.../var/log
~~~

#Troubleshootig 

Impossible de supprimer le cache. Erreur interne Jelix. le fichier log indique une permission denied sur le dossier /tmp.



Il faut adresser les bons droits au dossier. Toujours en étant dans le container Lizmap :

~~~
chown :www-data /tmp -R
chmod 775  /tmp -R
~~~


le répertoire du cache n'est pas accessible /var/www/websig/lib/jelix-plugins/cache/file/file.cache.php     106


