# ZY RADAR

### Système de détection ultrasonique avec visualisation radar en temps réel

## Présentation du projet

ZY RADAR est un mini-projet réalisé dans le domaine des systèmes embarqués. Il consiste à concevoir un système de détection d'objets utilisant un capteur ultrasonique monté sur un servomoteur.

Le système effectue un balayage de son environnement dans une plage angulaire comprise entre **20° et 180°**. Les données collectées sont transmises à une interface graphique développée avec Processing afin de visualiser les objets détectés en temps réel.

## Technologies et outils utilisés

- **Arduino** : programmation et traitement des données.
- **Capteur ultrasonique** : mesure des distances.
- **Servomoteur** : orientation du capteur.
- **Arduino IDE** : développement et téléversement du programme.
- **Processing** : création de l'interface graphique et visualisation radar.

## Fonctionnalités principales

- Détection des objets à l'aide d'un capteur ultrasonique.
- Balayage angulaire entre 20° et 180°.
- Mesure de la distance entre le capteur et les objets.
- Communication série entre Arduino et Processing.
- Visualisation graphique des données en temps réel.

## Architecture du système

### 1. Partie matérielle et programmation Arduino

- Contrôle du servomoteur.
- Acquisition des mesures du capteur ultrasonique.
- Transmission des données vers l'ordinateur via le port série.

### 2. Partie logicielle avec Processing

- Réception des données transmises par Arduino.
- Traitement des informations reçues.
- Affichage des angles et des distances sur une interface radar.

## Principe de fonctionnement

1. Le servomoteur oriente le capteur ultrasonique entre 20° et 180°.
2. Le capteur mesure la distance des objets présents dans son environnement.
3. Arduino récupère les mesures et les transmet à Processing.
4. Processing affiche les données sous forme de représentation radar.

## Installation et utilisation

1. Télécharger ou cloner ce dépôt GitHub.
2. Ouvrir le programme Arduino avec Arduino IDE.
3. Connecter les composants électroniques.
4. Téléverser le programme sur la carte Arduino.
5. Ouvrir le sketch Processing.
6. Sélectionner le port série correspondant à la carte Arduino.
7. Exécuter le programme Processing pour visualiser les résultats.

## Objectifs pédagogiques

Ce projet a permis de mettre en pratique plusieurs compétences :

- Programmation des systèmes embarqués.
- Acquisition et traitement des données issues de capteurs.
- Commande des
