docker stop geodatup_postgis_1
docker rm geodatup_postgis_1

docker run --restart="always" --name "postgis" -p 5432:5432 -d -v /home/GeoPoppy/postgres_data:/var/lib/postgresql  geopoppy_postgis

docker stop geodatup_lizmap_1
docker rm geodatup_lizmap_1




docker stop postgis
docker rm postgis

docker stop lizmap
docker rm lizmap

docker stop geopoppy_postgis_1
docker rm geopoppy_postgis_1


docker run --restart="always" --name "lizmap" -p 80:80 -d -t -v /home/GeoPoppy/lizmap/lizmap_project:/home -v /home/GeoPoppy/lizmap/lizmap_project/lizmap_var:/var/www/websig/lizmap/var geopoppy_lizmap

/var/www/websig/lizmap/install/set_rights.sh 

chown -R www-data /var/config var/config /var/db /var/log /var/mails /var/uploads 
chmod -R ug+w /var/config var/config /var/db /var/log /var/mails /var/uploads 