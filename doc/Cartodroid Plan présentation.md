#CartOdroid outil d'aide à l'acquisition de données géographiques pour les ONG sur terrain déconnecté  


**Introduction**

Les ONG ont besoin de connaitre leur territoire "sur le bout des doigts". Sans cela, elles ne pourraient orienter leur effort auprès des populations et des espaces prioritaires.
Les informations sont en partie récoltées sur le terrain mais comment font elles lorsque ces territoires sont des zones mal desservies, voir dépourvues de technologie et réseau de communication internet (3G / 4G) ?

Nous allons dans un premier temps voir un protocole standard du processus de récolte d'information géographique sur le terrain ? 

Ensuite nous présentons les avantages de Cartodroid, outil d'aide à la saisie terrain déconnecté.


#1 - Récolter l'information géographique sur terrain sans connexion internet

Quels sont les choix en moyens humains et en matériel :

- Seul, en équipe. On peut aussi impliquer les populations.
- on a souvent à disposition des formulaires de saisie
- Grâce à des capteurs : positionnement (GNSS, giro), type caméra (RVB, PIR, thermique), météo, sonde, compteur (plaque enterrée, laser etc...), sonore.

Évidement cela dépend de l'objectif mais on note que la diversité est grande. 

- On dispose potentiellement d'informations géographiques acquises précédemment lors d'une mission antérieure ou d'une source externe (par exemple  le fond de carte OSM, une orthophoto acquise par drone,  des images satellites, toute sorte de cartographie... )

Quelle est la méthode :

- se localiser,
- récolter les données par saisie manuelle ou automatique
- passer à la localisation suivante (en évitant de saisir deux fois la même information).


#2 - Que ce passe t-il avant et après la mission ?

Avant :

- Prise de conscience de la nécessité d'une campagne de récolte d'information géographique 
- Préparer les supports cartographiques et des formulaires de saisi (semi automatique ou manuel), la méthode
- formation et briefing les personnes qui vont participer à la campagne de récolte (définir les zones)

Après :

- vérifier la qualité des données (homogénéité, exhaustivité, on évacue les erreurs, etc.)
- intégrer les données récoltées dans un ensemble plus global (base de donnée)
- utilisation d'outils d'aide à l'analyse et cartographie (SIG) 

-> **Décision**


Quels outils peuvent aider à améliorer la fluidité de ce protocole, sachant qu' entre jeux : moyens humains,  méthodes de saisie et des moyens techniques variés.


#3 - Les outils d'aide à la récolte sur le terrain

En premier lieu, si on considère une approche la moins technologique, et bien on se repport sur le  support papier.
Alors l'outil FieldPaper semble le plus adapté. 
####Avantages
- pas besoin d’électricité
- coût de production est très faible (impression).

####Inconvénients
- nécessite un peu de préparation en amont de la campagne pour la création de l'atlas
- en aval une lourde phase de contrôle et d'intégration. 
- Support cartographique à échelle statique et un fond de carte simple et épuré est nécessaire pour la lisibilité (souvent OSM).
- Le papier s’abîme sous l'eau, se déchire, s'envole et se brûle.
- risque d'erreur de saisie, lisibilité de l’écriture.
- Il y a parfois duplication ou des "trous" d'information (quiproquo entre deux enquêteurs sur le partage de leur zone d'action).
- Des difficultés à reporter sa localisation sur la carte papier.


Admettons maintenant que nous n'avons pas de contrainte technologique comme l'accès à l’électricité et donc nous pouvons utiliser d'autres outils ce qui permet d'avoir d'autres avantages et mais aussi d'autres inconvénients.

##Applications sur smartphone 

Les terminaux smartphones, tablettes et pocket PC sont des outils adaptés aux missions de récolte de données de terrain grâce notamment à un écran tactile et des applications de saisie de formulaire cartographiques.
on en compte de nombreuses et dans le monde de l’open-source les plus réputées et prometteuses sont :

- Cybertracker,
- QField, 
- OSMAND, 
- OpenMapKit, 
- [SMART](https://play.google.com/store/apps/details?id=fr.umlv.lastproject.smart&hl=fr) 
- et bien d'autre 

####Avantages 
- Le coût matériel est relativement faible moins de (entre 50 et 200 € ) et le coût d'une licence logiciel (open source) est nulle.
- Les formulaires de saisie peuvent être complexes et pas plus compliqués à saisir.
- Grâce au numérique on profite des listes d’auto complétion ce qui accélère la saisie et permet d’éviter de erreurs,
- Au cours de la saisie on dispose d'informations dynamique pour l'aide à la saisie (cartographie, images, bases de données, tout type de documents numérisés etc...). 
- On dispose des capteurs internes au terminal (camera, GPS, micro ...)
- L'intégration des données récoltés en base de donnée et plus rapide (pas de double saisie)
- Un terminal peut être tout terrain (enfin waterproof...) mais le coût est plus élevé.
- Les performances d'accès aux ressources numériques mises en cache sont en général excellentes.

####Inconvénients 
- Pré-configuration du terminal nécessaire avant le début de la mission (complexe si beaucoup de terminaux, encore plus si les terminaux ne sont pas dédié uniquement à cela).  
- Maintenance de l'installation de l'app sur le terminal. 
- L'adéquation de la Version OS et de l'App nécessite des tests de contrôle sur le smartphone suite à une nouvelle version de l'app ou de l'OS  (le gros bordel des montées en version),
- Les informations dynamiques à rendre disponible sur le terrain doivent impérativement être mise en cache sur tous les terminaux (lourd lorsque plusieurs terminaux sont utilisés). 
- Dans le cas d'un campagne en équipe, lors de la phase de récoltes les informations ne sont pas mises à jours sur les autres terminaux : risque de double saisie.



##Les microcomputeurs (serveurs portables)

L'idée est de créer un réseau sur le terrain. On créé un hotspot wifi pour rendre accessible l'ensemble des données en cours de collecte ainsi que toutes les autres ressources. On obtient un réseau intranet en quelque sorte.

###La croix rouge US à mis au point un serveur pour son application POSM

####Avantages 
- Coût relativement faible (350€ environ). Serveur très performant (un peu trop ?). Roadmap : déploiement sur Raspberry Pi.
- Adapté aux campagnes importantes de récolte avec plusieurs terminaux environs 15 smartphones connectés en même temps au serveur.
- Mutualisation du stockage des données et des ressources, les informations SONT alors mises à jours sur tous les terminaux de saisi : aucun risque de double saisie.
- Maintenance des données largement simplifiée.
- Suite à la phase de saisie, une seule synchronisation est nécéssaire pour l'intégration des données récoltées sur la base de référence (OSM en l’occurrence).


####Inconvénients 
- Nécessite l'usage de terminaux Android (coût supplémentaire)
- Maintenance de l'App sur l'OS Android uniquement, ce qui implique que l'on évacue pas les inconvénients de l'usage d'une application sur smartphone.

**et on ajoute que**

- La porté WiFi entre le serveur et les terminaux est limitée à une centaine de mètres, qui plus est contrainte par les masques (bâtiments).
- Les performances  d'accès aux ressources numériques sont réduites et contraintes par la bande passante du réseau WiFi.


###Geoppopy/CartOdroid ce sont des microcomputeurs (Raspberry et Odroid).

L'idée est de créer un réseau sur le terrain. On créé un hotspot wifi pour rendre accessible l'ensemble des données en cours de collecte ainsi que toutes les autres ressources. On obtient un réseau intranet en quelque sorte.

Le projet [Geoppopy](https://github.com/jancelin/geo-poppy) fonctionne sur ce principe sous Raspberry Pi 2 et 3. Les applications coté serveur sont QGIS-Serveur, PostGis et Lizmap.
L'administration du serveur est réalisée avec Docker (gros gain de temps pour les installations et la maintenance).

Le choix de Lizmap permet d'offrir une logique SIG aboutie et de disposer d'une continuité entre Qgis desktop et le terrain. On dispose ainsi des mêmes outils et projets sur le terrain qu'au bureau. 

Des différences avec POSM :

- c'est d'une part le matériel utilisé
- le choix de déployer l'application coté serveur plutôt que sur le client. Le client c'est uniquement le navigateur internet du terminal.

####Avantages
Les avantages sont similaires à ceux de POSM (on pourrait techniquement être déployé sur ce serveur et inversement, c'est d'ailleur ce qu'ils envisagent de faire).
- Mutualisation du stockage des données et des ressources, les informations SONT alors mises à jours sur tous les terminaux de saisi en temps réel : aucun risque de double saisie.
- Maintenance des données largement simplifiée.
- Suite à la phase de saisie, une seule synchronisation est nécéssaire pour l'intégration des données récoltées dans la base de référence.
- Très grande possibilité d'évolution et d'adaptation au cas particulier (intégration de capteur spécifiques, écran, télécommande ...) 
- Le serveur peut être administré à distance en SSH lorsqu'il est connecté a internet

**et on ajoute que**

- Coût deux à trois fois plus faible que le serveur utilisé par la croix rouge US pour POSM. 
- On a pas d'application cliente (donc pas de maintenance sur différents système iOS android, windows),


####Inconvénients 

- Nécessite néanmoins l'usage de terminaux (coût supplémentaire), 
- La porté WiFi entre le serveur et les terminaux est limitée à une centaine de mètres, qui plus est contrainte par les masques (bâtiments).
- Les performances  d'accès aux ressources numériques sont réduites et contraintes par la bande passante du réseau WiFi.

- Le montage du serveur nécéssite l'intervention d'un admin system
- L'administration du système se fait par un géomaticien


## Le développement du projet CartOdroid

Mon projet conciste à améliorer Geoppopy tant dans son aspect matériel (plus de portabilité), que dans sa partie synchronisation des données (avec par exemple [GeoGig](http://geogig.org/).
L'objectif est que le serveur soit plug-and-play mais aussi unplug-and-map :) et bien entendu de rester opensource. 

Pourquoi porter le projet sur un autre serveur ?
------------------------------------------------

Odroid est un concurent sérieux au Raspberry Pi (RPI). Son point fort est qu'il est  plus puissant pour un prix équivalent. 

Deuxièmement, l'Odroid est particulièrement bien adapté aux projets portables. C’est particulièrement vrai pour l'Odroid C0 car il embarque avec lui un module d'alimentation batterie Lipo. Faites l'achat d'une batterie et le serveur devient autonome (avec switch on/off intégré). Cela est évidement possible sur le Raspberry Pi (RPI), mais nécéssite l'adjonction d'une carte HAT, ou d'un ensemble de composant pour assurer un fonctionement simple. L'Odroid C2 doit aussi être équipé d'une telle carte supplémentaire mais celle-ci est disponible à l'achat contrairement au RPI pour lequel les ruptures de stock sont très fréquentes et où les prix sont finalement assez élevés.

### Comparatif des coûts de base

-   odroid C0 (25 $)

-   odroid C2 (40 $)

-   raspberri Pi 3 (35 $)

### Avec ajout d'un module pour l'autonomie

-   odroid C0 (12 $ ). Coût de la Batterie lipo 3000 mAp. 

![](data:image/jpeg;base64,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)

-   odroid C2 : USP3 (49 $). Le prix contient la carte HAT, une batterie lipo
    3000 mAp + un chargeur secteur.

![](https://lh3.googleusercontent.com/proxy/XLCs4q3Bzkq6nALnWxI5M6TZdAYae7s1MGE1SO7dmOogWg9NkgV0bmJndfPpIuee5ZSihrps9y_tMvvzQWDQWgKoNBgMCq8r7MVcF5YKMFS13RAG1TetUcPpUX0BBKRO=w426-h334-p)

-   Raspberri Pi 3 (environs 70 $). Des cartes existes mais les stocks sont
    épuisés.

 
Il faut ajouter à cela un chargeur secteur 2A à 6$ (ou un cable USB uniquement pour charger sur une batterie portable : 2$ ). 

### Avec ajout d'un module wireless

Les odroids n'ont pas de wifi intégré alors que RPI3 intégre ce module. Comptez
8$ supplémentaire.

### Récapitulatif

**Materiel nécéssaire pour un Ordroid C2**

|  Libellé |Tarif $|   
|---|---|
|  ODROID – C2	| 40|ODROID – C2 USP 3 (batterie module contient bat 3A et chargeur secteur)	|49|Wifi module 3	|8|USB GPS Ublox 6010 chipset with a patch antenna 50-channel u-blox 6 engine | 25**Materiel nécéssaire pour un Ordroid C0**|  Libellé | Tarif $|   
|---|---|
|  ODROID – C0	| 25|Batterie 3000 mAp	| 12|Alimentation secteur 5v/2A|	5,50|Wifi module 3	|8|USB GPS Ublox 6010 chipset with a patch antenna 50-channel u-blox 6 engine |25


**Développement kit**
|  Libellé | Tarif $|   
|---|---||USB-UART connector kit	 | 10**Frais de port et de douane (import Corée du Sud)**

|  Libellé | Tarif $|   
|---|---||Frais de port	| 30|Frais de douane |	30%### Stockage système

Les odroids sont équipés de la technologie emmc ce qui permet d'augmenter la
vitesse de lecture et d'écriture sur la carte memoire. Mais celle ci à un coût
supplémentaire (facultatif).
|  Libellé | Tarif $|   
|---|---||Carte SD classe 10, 16 go	  | 10|Usb Stick mini 64 go	| 25|**ou memoire eMMC**||8GB eMMC Module C2 Linux Black	|18
|16GB eMMC Module C2 Linux Black	|26
|32GB eMMC Module C2 Linux Black	|39
|64GB eMMC Module C2 Linux Black	|59
|128GB eMMC Module C2 Linux Black	|78	




###Conclusion
C'est odroid C0 qui revient le moins chers de tous mais les performances les meilleurs sont celles de l'Odroid C2. Le Raspberry pi 3 hors course tant que le module de batterie interne sera inaccessible.
De plus Le RPI est légèrement moins performant que Odroid C2.  
On s'apperçoit que les prix reste néanmois équivalents. Ce qui fait pencher la balance ce sont les performances (processeur, RAM et carte mémoire eMMC) ainsi que la disponibilité des composants pour le module d'autonomie.
 

Documentation - manuel
======================

Pour faire fonctionner le projet sur une carte Odroid, il faut néanmoins ajuster la configuration initiale de Julien Ancelin pour garder la même logique efficace.

La documentation complète est disponible [ici sur Read The
Doc](http://cartodroid.readthedocs.io/) !


# Réalisation d'un Proof of concept

- J'ai réalisé et documenté le portage RPI -> Odroid C2 (Docker: QGIS, Postgis, Lizmap).
- L'usage d'une batterie interne (3000mAp) permet d'avoir une autonomie de 2h d'activité environs (que l'on peut augmenter facilement grâce à l'utilisation de batteries USB. L'usage d'une batterie interne permet surtout d'éviter les extinctions inopinées qui peuvent causer des risques de perte de données en mémoire. En cas de batterie vide, le serveur s'éteind proprement, de manière automatique.


**Précisions techniques et configuration initiale additive**

- Le serveur portable fonctionne de manière autonome (pas en multi-serveur), c'est le serveur **Master**, utilisé à la fois au bureau et sur le terrain. Cela signifie qu'actuelement la base de donnée de référence est hebergé sur ce serveur. Néanmoins, des backups peuvent être réalisés sur un autre serveur.
- Un serveur de fichier Samba peut être installé pour effectuer les transfert de fichiers (projets Qgis) sur le réseau local.
- Qgis desktop accède à la base Postgis directement via le protocole TCP/IP et peut éditer les données sur le serveur lorsqu'il est connecté au réseau local ou via la connection wifi directe.
- Un DYNDNS a été parametré pour trasmettre l'envois de l'adresse IP  de la box internet dans le cas ou le fournisseur internet applique des IP dynamiques (utile pour l'administration du  serveur à distance via SSH).


### Les suites à donner

- du point de vue des performances, il faut encore évaluer le débit/temps d'affichage, la portée WiFi selon différent terrain, le nombre de terminaux potentiels connectés. 
- effectuer le POC sur ordoid C0 et comparer les performances.

- fonctionnement multi-serveur : implémenter un module de synchronisation type GeoGig (Pull-Push et branche) pour interfacer le serveur portable à une base principale situé sur un serveur fixe.
- création d'un boîtier  pour Odroid C2/C0 (anti-éclaboussures mais pas hermétique à 100% : risque de chauffe et utilité potentiellement limitée au vu du coût, un tuperware peut faire l'affaire en cas de besoin ![tuperware](https://pbs.twimg.com/media/CnRgojyXYAEinJN.jpg)
- impression et montage de boutons plastiques pour switch ON/OFF adapté à l'Odroid C2/C0.
- trouver une solution pour réaliser un shutdown propre (avec un bouton dédié interface web ?),
- définir et ajuster le comportement réseau suite à plug-unplug du câble Ethernet.


### Quelles retombées pour CartONG

Ce projet permet à CartONG de proposer la fourniture de materiel d'acquisition ou de suivi SIG aux équipes des ONGs déployées sur des terrains difficiles. Les coûts du materiels étant faibles, il est simple d'en faire profiter les ONG qui n'ont pas toujours connaissance de ces outils. CartONG se positionne ainsi comme founisseur et support de l'outil.

Les potentialités des microcomputeurs sont immenses et POSM ou CartOdroid n'en sont qu'une expression. 
Ce projet a de forte potentialité d'innovation et sera amené à être amélioré pour répondre à des usages encore plus spécifiques. 


### Équipe développement et budget de développement du projet 

Je ferai en sorte d'impliquer le créateur du projet Geoppopy **Julien Ancelin (INRA)**, des bénévoles CartOng, d'autres utilisateurs de cette solution et d'un réseau géomatique opensource plus large.

Pour la partie matériel, je ferai une présentation du projet au Fablab de Toulouse pour obtenir de l'assistance dans la conception de : 

- l’électronique (switch on/off) 
- de la conception de boîtiers et bouton plastique avec imprimante 3D et/ou découpe laser (qui sera facturé par le FabLab)

Des frais de mise en service la version démo seront facturés 300€ HT par Geodatup, hébérgé dans la SCOP de la Maison de l'iniative à Toulouse afin de soutenir financièrement le développement du projet.

Des frais de présentation / communication / frais communication / déplacement, seront facturés à hauteur de 300€ HT par Geodatup afin d'assurer un minimum la finalisation la documentation, réalisation des supports de présentations du produit avec et auprès des bénévoles qui le souhaite.

Des frais de développement des fonctionnalités supplémentaires suivantes seront facturés par Geodatup :

- programmation de la fonction de la mise sous tension / hors tension avec le bouton « shutdown » : 100€ HT- mise en place de la fonction multi-serveur avec synchronisation (GeoGig ?) : 300 € HT

Les tests fonctionnels seront des essais réalisés par une ou deux ONG du réseau CartOng. Je serai en support bénévole durant les tests, accompagné des autres bénévoles de CartOng ayant souhaité participer au projet.

Je fais la gestion du projet (Hugo Roussaffa) avec les bénévoles qui le souhaitent. 


### Méthode et outils de communication et suivi de projet

- Forge : [Github](https://github.com/geodatup/cartodroid) 
- Gestion des taches, bugtracking : Zoho project, Github
- Communication : Trello, mail, googlegroup
- Documentation : [Readthedoc](http://cartodroid.readthedocs.io/), Github

### Calendrier (6 mois) 

3 points d'étapes rythmerons le projet. Ce seront des points de suivi de projet sous forme de comité de pilotage avec un représentant de CartOng / une ONG test / l'équipe de développement.

La liste suivante à pour but de donner une idée du calendrier mais pourra être amenée à évoluer.

- **GO / NO GO** : validation du projet par CartOng ```semaine O```
- contact Julien Ancelin (Geoppopy) ```semaine O```
- communication : présentation / recrutement bénévole, ```semaine 1```
- communication : materiel de présentation interne/externe, ```semaine 1-2```
- communication : présentation du projet auprès d'ONGs, ```semaine 2-3```
- **point d'étape (GO / NO GO)** : retour sur le démarage du projet, l'étude de marché. Une ou deux ONG seront ciblées pour être testeur/cobaye ```semaine 4```
- commande materiel (facturé) ```semaine 4-5```
- développement : mise en place du serveur de développement / demo (facturé)```semaine 6```
- communication : présentation / recrutement bénévole,```semaine 7```
- communication : présentation Fablab Toulouse,```semaine 7```
- développement : conception / création boitier (facturé)```semaine 8```
- développement : conception / création bouton ON/OFF pour alimentation (facturé)```semaine 8```
- développement : fonction de la mise sous tension / hors tension avec button *shutdown* (facturé)```semaine 9```
- **point d'étape (GO / NO GO)** : Avancement projet, évaluation réelle du coût de prodution materiel ```semaine 9```
- développement : fonction synchro GeoGig ou autre (facturé) ```semaine 9-12```
- développement : fonctions supplémentaires (hors budget) ```semaine 13```
- tests unitaires ```semaine 14```
- documentation : manuel ```semaine 15```
- tests fonctionnels : envoi d'un cartOdroid à une ONG (don ?) ```semaine 16-20```
- tests fonctionnels : retour tests et ajustement ```semaine 21-22```
- développement de nouvelles fonctionnalitées ```semaine 22-23```
- communication : présentation du projet auprès d'ONGs ```semaine 24```
- **point d'étape (GO / NO GO)** : mise en production auprès de nouvelles ONGs ```semaine 25```