# Projet Julie Bergeron Hypnose - Notes

## Workflow de travail
- **Toujours démarrer le serveur HTTP** au début de chaque session
- Quand le client dit **"ça fonctionne"** → commit + push automatique sur GitHub (https://github.com/denisstgermain/jbweb) puis passer au point suivant
- **Commits** : message clair et descriptif de ce qui a été fait, **pas de mention de Claude comme co-auteur**
- Repo GitHub : https://github.com/denisstgermain/jbweb.git

## Serveur local
- **Toujours démarrer le serveur HTTP** au début de chaque session de travail
- Commande : `powershell -ExecutionPolicy Bypass -File C:\hypnose\serveur.ps1`
- URL : http://localhost:3000
- Le script serveur.ps1 est dans C:\hypnose\

## Stack technique
- Site statique HTML/CSS/JS (pas de framework)
- Pas de Node.js ni Python installé sur la machine
- Serveur local via PowerShell (serveur.ps1)

## Structure du site
- index.html - Page d'accueil
- a-propos.html - À propos
- contact.html - Contact avec formulaire
- prendre-rendez-vous.html - Prise de rendez-vous (widget Tédycal à intégrer)
- services/ - 10 pages de services

## Contact
- Tél : 514-462-0486
- Email : info@juliebergeronhypnose.com
- Adresse : 545 Montée Masson, Terrebonne, QC J6W 2Z4

## À faire / Points en suspens
- Intégrer le widget Tédycal dans prendre-rendez-vous.html
- Supprimer le fichier "index .html" (doublon avec espace)
- Optimiser l'image Accueil.jpg (3.2 MB → trop lourd)
- Brancher le formulaire de contact (backend)
