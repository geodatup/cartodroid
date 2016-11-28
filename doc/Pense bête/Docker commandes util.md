Docker commandes util


docker pull jancelin/docker-lizmap --> construit l'image venant de dockerhub.
docker docker build -t jancelin/docker-lizmap git://github.com/jancelin/docker-lizmap--> construit l'image via mon dépôt github, permet de voir toute l'installation.
docker images --> Voir les images disponible dans son docker
docker rmi name_of_image --> supprime l'image.
docker run --restart="always" --name "websig-lizmap" -p 8081:80 -d -t -v /your_qgis_folder:/home:ro -v /your_config_folder:/home2 jancelin/docker-lizmap--> démarre lizmap container
docker ps -a--> liste des container et status.
docker start name_container --> démarre container.
docker stop name_container --> arrête container.
docker rm name_container --> supprime le container (Possibilité de : docker stop name_container && docker rm name_container)
docker exec -it name_container bash--> rentre dans le container avec une session root shell.
docker cp name_container:/file/path/within/container /host/path/target ---> copie des fichier du container vers l'hôte.
docker exec -i moncontainer /bin/bash -c 'cat > /inside-container-file' < fichier-exterieur ---> copie des fichiers de l'hôte vers le container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) ---> arrête et supprime tout les containers
docker stats `docker ps | awk '{print $NF}' | grep -v NAMES` ---> voir les stats des containers


Commande de gestion reseau
docker network create
docker network connect
docker network ls
docker network rm
docker network disconnect
docker network inspect

#Troubleshooting

~~~
docker start geopoppy_postgis_1 
Error response from daemon: service endpoint with name geopoppy_postgis_1 already exists
~~~

nécéssite un redemarage de docker 

~~~
/etc/init.d/docker restart
~~~
une inspection du reseau docker peut être utile