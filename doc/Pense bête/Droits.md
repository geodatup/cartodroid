changer de proprietaire
=======================
~~~
sudo chown -R www-data:www-data ann
~~~
donner les droits d'écriture au groupe
~~~
sudo chmod -R g+w ann
~~~

### Ajouter un utilisateur au groupe
useradd -g www-data users

## lister utilisateur et groupes
~~~
cat /etc/passwd | awk -F: '{print $ 1}'
~~~
Afficher les groupes :

~~~
cat /etc/group | awk -F: '{print $ 1}'
~~