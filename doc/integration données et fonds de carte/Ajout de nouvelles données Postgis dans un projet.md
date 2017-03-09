#Ajout de nouvelles données Postgis dans un projet Lizmap

- Importer des shapefile dans la base postgis via Dbmanager

- modifier le projet qgis pour autoriser le flux wfs

- ajuster l'emprise du projet

# Troubleshooting
Attention, qgis 1.18 n'est pas compatible avec DBmanager pour importer une nouvelle couche. On obtient une erreur.

Il faut alors utiliser QGIS 1.14 et ça fonctionne.
~~~
Impossible d'accéder à la relation "public"."POI".
			Le message d'erreur de la base de données est :
			Problème d'obtention des données résultat.
			SQL : SELECT * FROM "public"."POI" LIMIT 1
~~~
et

~~~
dbname='gis' host=192.168.1.98 port=5432 user='docker' sslmode=disable table="public"."POI" (geom) sql= est une couche non valide et ne peut être chargée.
~~~