Bienvenue sur la documentation de geodroid
==========================================

 

Geodroid est un outil pour mettre à jour vos données cartographiques sur le
terrain.

 

Ce mini serveur carto diffuse vos cartes Qgis en Wifi sans connection internet.

 

 

Les principaux besoins auquel répond l'outil :
----------------------------------------------

-   Nous voulons cartographier, quantifier ou décrire le peuplement forestier
    d'une propriété de plusieurs centaines d'hectares.

-   Nous ne disposons pas de couverture réseau internet (Edge, 3G/4G) sur cette
    zone.

-   Nous souhaitons utiliser les mêmes cartes que celles disponibles au bureau
    afin de faciliter les mises à jours de données et de former les utilisateurs
    aux mêmes méthodes de saisie.

-   La visualisation et l'intégration des données peut se faire sur tous les
    types de tablettes, smartphones, pc, directement depuis le navigateur
    internet sans applications supplémentaires (pas de client lourd) et sans
    accès à internet !

-   Vos données sont synchronisées vers une base de donnée et sauvegardées quand
    le serveur dispose d'une connexion internet sécurisée.

-   Vos stagiaires, techniciens et même les propriétaires forestiers peuvent
    être autonomes dans la saisie des données en 10 min.

-   Outil est autonome, petit, léger, simple d'utilisation pour être emmené dans
    la poche ou un sac à dos.

 

Les briques techniques :
========================

Materiels :
-----------

-   Serveur miniature (odroid C0/C2)

-   Batteries interne Lipo (3000mAp) pour une autonomie d’environs 4h.

-   Carte micro SD 16 go pour l’installation du système.

-   Clé Wifi

-   Espace de stockage extensible (clés USB 256 Go, disques dures externes)

-   Tablette/smartphone + GPS (intégré ou non)

-   Cable Ethernet

-   Alimentation 2mAp 5volt

Logiciels :
-----------

\- Qgis (+ plugin Lizmap): n’est pas installé sur le serveur mais sur un
ordinateur de bureau.

\- Postgis

\- Qgis Serveur

\- [Lizmap](http://www.3liz.com/lizmap.html) Web Client (interface d'édition de
l'utilisateur)

 

Flux des données:
-----------------

On distingue 2 types de données, celles que vous modifiez et celles qui sont
simplement visualisées.

Exemple de données modifiables métiers (les peuplements, équipements
etc.) et des données tierces visualisables (fond topo IGN, OSM, limites de
reserves ONF etc).

Pour être modifiables, nos données métiers sont stockées en base de données
(Postais). Cette opération est réalisable sous Qgis.

Au bureau, nous travaillons sur nos données avec Qgis, nous faisons de nouveaux
projets (à partir de données métiers et tiers), des géotraitements, des
représentations cartographiques complexes et aussi des formulaires de saisies
simplifiés.

Ces projets sont ensuite publiés sur le serveur miniature que vous emmener sur
le terrain. Les projets sont gérés par Lizmap. Vous pouvez définir des
droits et groupes d'utilisateurs.

Ainsi, vous disposer de vos données mises en formes, sécurisés, organisés, sur
le terrain même sans connexion internet.

A votre retour du terrain, vos données sont automatiquement
publiées/sauvegardées sur le serveur principal, simplement en connectant le
serveur miniature à votre réseau Ethernet.

### Sens du flux des données :

Base de données Postgis -\> Projets Qgis -\> Lizmap Plugin -\> Qgis Serveur -\>
Lizmap web Client -\> Base de données Postgis ...
