#Mise à jour ou réinstallation de Lizmap

~~~
cd /home/Geopoppy
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker rmi geopoppy_lizmap

docker-compose up -d
~~~