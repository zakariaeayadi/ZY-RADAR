# 🚀 ZY RADAR – Système de détection et de visualisation radar

## 📌 Présentation du projet

**ZY RADAR** est un mini-projet réalisé dans le cadre de notre formation en **Génie Informatique Embarquée**.

Ce projet consiste à développer un système de détection d'objets utilisant un capteur ultrasonique monté sur un servomoteur. Le système effectue un balayage angulaire afin de détecter les objets présents dans son environnement et de transmettre les données à une interface graphique développée avec Processing.

L'objectif est de reproduire le principe de fonctionnement d'un radar à travers une visualisation en temps réel.

## 🎥 Démonstration vidéo

Découvrez le fonctionnement de notre projet à travers cette démonstration vidéo publiée sur LinkedIn :

▶️ **[Regarder la démonstration de ZY RADAR sur LinkedIn](https://lnkd.in/p/ekkRkYmg)**

## ⚙️ Technologies et composants utilisés

### Matériel
- Arduino
- Capteur ultrasonique
- Servomoteur
- Câblage électronique

### Environnement logiciel
- Arduino IDE
- Processing
- Langage C/C++ (Arduino)
- Java (Processing)

## 🔍 Fonctionnalités principales

- Détection des objets à l'aide d'un capteur ultrasonique.
- Balayage angulaire automatique grâce au servomoteur.
- Rotation du servomoteur entre **20° et 180°**.
- Mesure de la distance entre le capteur et les objets détectés.
- Transmission des données entre Arduino et Processing via une communication série.
- Visualisation graphique des mesures en temps réel sous forme de radar.

## 🧩 Architecture du système

Le projet repose sur deux parties complémentaires :

**1. Partie matérielle – Arduino**

Arduino contrôle le servomoteur, récupère les mesures du capteur ultrasonique et transmet les informations relatives à l'angle et à la distance.

**2. Partie logicielle – Processing**

Processing reçoit les données transmises par Arduino et les utilise pour afficher une interface radar dynamique permettant de visualiser les objets détectés.

## 🔄 Principe de fonctionnement

1. Le servomoteur effectue un balayage angulaire entre 20° et 180°.
2. Le capteur ultrasonique mesure la distance des objets détectés.
3. Arduino traite les mesures et transmet les données via le port série.
4. Processing récupère les données et actualise l'affichage radar en temps réel.

## 🎯 Objectifs pédagogiques

Ce projet nous a permis de mettre en pratique plusieurs notions fondamentales des systèmes embarqués :

- Programmation des microcontrôleurs avec Arduino.
- Interaction avec des capteurs et des actionneurs.
- Acquisition et traitement des données.
- Communication série entre deux environnements logiciels.
- Développement d'une interface graphique interactive.
- Intégration entre matériel électronique et logiciel.

## 👨‍💻 Auteurs

- **Zakaria Ayadi**
- **Yasser Ramdani**

Projet académique réalisé dans le cadre de la formation en Génie Informatique Embarquée.
