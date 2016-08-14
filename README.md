# Cartodroid

Le projet est basé sur le travail de Julien Ancelin (Geoppopy - Lizmap sur Raspberry Pi).

Le projet Cartodroid consite pour l'instant à porter le projet Geoppopy sur Odroid (C2 et C0).

##Pourquoi porté le projet sur ce materiel ?

Odroid est un concurent sérieu au Raspberry Pi. Le principal point est qu'il est plus puissant pour un prix équivalent. Vous trouverez de nombreux comparatifs sur internet à ce sujet. Nous nous intéressons ici qu'au caractéristiques essentiels au fonctionnement du projet.

Deuxiemement, l'Odroid est particulièrement bien adapté au projet portable. Particulièrement l'Odroid C0. Il embarque avec lui un module d'alimentation Lipo. Faite l'achat d'une batterie et le serveur est autonome. Cela est évidement possible sur le Raspberry Pi, mais cela nécéssite l'adjanction d'une carte HAT, ou d'un ensemble de composant pour assurer un fonctionement simple. L'Odroid C2 doit aussi être équipé d'une telle carte HAT mais celle ci est disponible à l'achat contrairement au RPI où les ruptures de stock sont très fréquentes et où les prix sont assez élevé.

###Comparatif des coûts de base

- odroid C0 (25$)
- odroid C2 (40$) 
- raspberri Pi 3 (35$)

###Avec ajout d'un module pour l'autonomie :
- odroid C0 (12$). Batterie lipo 3000 amp
- odroid C2 : USP3 (49$). Le prix contient la carte HAT, une batterie lipo 3000 amp + un chargeur secteur.
- raspberri Pi 3 (environs 70$). Des cartes existes mais les stocks sont épuisés (il faut acheté séparement une batterie). 

###Avec ajout d'un module wireless :
les odroids n'ont pas de wifi intégré alors que RPI3 intégre ce module. Comptez 8$ supplémentaire. 

###Stockage système
Les odroids sont équipés de la technologie emmc ce qui permet d'augmenter la vitesse de lecture et d'écriture sur la carte memoire. Mais celle ci à un coût supplémentaire (facultatif).


On s'apperçoit que les prix sont équivalents (tout de même moins chers pour le C0). Ce qui fait pencher la balance c'est les performances ainsi que la disponibilité des composants pour le module d'autonomie.


# Documentation - manuel
La documentation complète est disponible ici
http://cartodroid.readthedocs.io/en/latest/
