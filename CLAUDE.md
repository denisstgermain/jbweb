# CLAUDE.md — Projet Julie Bergeron (jb)

## REGLE CRITIQUE : Isolation des sites

Ce repo contient DEUX projets completement independants. **Tu ne dois JAMAIS modifier un site sans instruction explicite de l'utilisateur pour CE site.**

### Protocole obligatoire
1. **Debut de session** : toujours demander "On travaille sur quel site aujourd'hui? Hypnose ou Spirituel?"
2. **En cours de session** : verifier regulierement qu'on est toujours sur le bon site, surtout avant de modifier un fichier
3. **Ne jamais changer de site** sans confirmation explicite de l'utilisateur

### Site 1 : Hypnose (juliebergeronhypnose.com)
- **Fichiers** : tous les fichiers a la racine du repo (index.html, a-propos.html, contact.html, prendre-rendez-vous.html, merci.html, outils-reference.html) + dossiers `css/`, `js/`, `services/`, `images/`
- **FTP** : `juliebergeronhypnose.com/juliebergeronhypnose.com/`
- **Public cible** : personnes cherchant de l'hypnotherapie
- **Modifier SEULEMENT si l'utilisateur le demande explicitement**

### Site 2 : Services spirituels (1 seul site, 3 domaines, 3 landing pages)
- **C'est UN SEUL site** partage par les 3 domaines :
  - juliebergeron-holistique.com
  - juliebergeron-tarologue.com
  - juliebergeron-rose-tarologue.com
- **Fichiers** : dossier `site-spirituel/` (a creer) — code commun deploye sur les 3 dossiers FTP
- **Structure** : page d'accueil + 3 landing pages (1 par service) + page contact + navigation commune
- **FTP** : le meme site est deploye dans les 3 dossiers :
  - `juliebergeronhypnose.com/juliebergeron-holistique.com/`
  - `juliebergeronhypnose.com/juliebergeron-tarologue.com/`
  - `juliebergeronhypnose.com/juliebergeron-rose-tarologue.com/`
- **Router JS** : detecte le domaine pour afficher la landing page appropriee en page d'accueil
- **Public cible** : personnes cherchant soins holistiques, tarologie, guidance feminine
- **Modifier SEULEMENT si l'utilisateur le demande explicitement**
- **Aucune mention d'hypnose** sur ces pages (publics differents)

---

## Informations sur Julie Bergeron

- **Nom** : Julie Bergeron
- **Titre** : Maitre-praticienne en hypnose transformatrice (IFHEC)
- **Adresse** : 545 Montee Masson, Terrebonne, QC J6W 2Z4
- **Telephone** : 514-462-0486
- **Email** : info@juliebergeronhypnose.com
- **Horaire** : Lun-Mar 8h-19h, Mer-Ven 8h-16h, Sam-Dim ferme
- **Facebook** : facebook.com/julie.bergeron.355
- **Reservation** : Tidycal (bergeron-julie)
- **Tarif hypnose** : 120$ CAD (taxes incluses)

---

## Stack technique

- HTML5 / CSS3 / Vanilla JS (aucun framework)
- Polices : Playfair Display (titres) + Lato (corps) via Google Fonts
- Palette hypnose : violet (#3d1a5e), mauve pale (#ede8f2), noir (#1a1a1a), texte (#555555)
- Animations : reveal on scroll (IntersectionObserver), nav sticky
- Integ. externes : Google Tag Manager (GTM-P7XP9NR), Tidycal, Formsubmit.co, Google Maps
- Responsive : breakpoints 900px, 768px, 480px

---

## FTP

- **Serveur** : juliebergeronhypnose.com
- **Login** : jb_sorcellerie@juliebergeronhypnose.com
- **Script deploy** : `ftp-upload.ps1` (PowerShell, deploie vers le dossier hypnose)
- **Upload manuel** : `curl -T fichier "ftp://juliebergeronhypnose.com/DOSSIER/" --user "LOGIN:PASS"`

---

## Repo Git

- **Remote** : https://github.com/denisstgermain/jbweb.git
- **Branche** : master
- **Convention commits** : messages en francais, descriptifs

---

## Site Spirituel — Decisions confirmees

- **1 seul site avec 3 landing pages** (holistique, tarologue, rose-tarologue)
- Les 3 domaines pointent vers le meme site ; un router JS affiche la bonne landing selon le domaine
- Navigation commune entre les 3 services (le visiteur peut decouvrir les autres services)
- Tarifs : sur demande seulement (pas de prix affiches)
- Reservation : Tidycal + telephone + email
- Palettes distinctes par landing page :
  - Holistique : verts doux (#2d6a4f, #52b788, #d8f3dc) + dore
  - Tarologue : bleu nuit (#1a1a2e, #16213e) + or (#d4af37)
  - Rose Tarologue : rose (#e8b4b8, #f4c2c2) + or rose (#b76e79) + blanc creme (#faf5f0)
