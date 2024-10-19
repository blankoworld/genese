# Genese CHANGELOG

Changes made on the application in the latest versions.

# Versions


<a name="v0.2.1"></a>
## [v0.2.1](https://github.com/blankoworld/genese/compare/v0.2.0...v0.2.1) (2024-10-19)

### Features

* **Adminer:** Use adminerevo instead of adminer (which is DEPRECATED)
* **English:** Move 'services.exemple' dir. to 'services.example' one
* **English:** Move lib/commun to lib/common
* **English:** Translate lib/git file
* **English:** Translate genese content
* **English:** Translate lib/portainer in English
* **English:** Translate lib/docker in English
* **English:** Translate lib/configs in English
* **English:** Translate lib/common in English
* **English:** README - Translation in progress
* **English:** Translate last files (hope its the end!)
* **English:** Change all profils/PROFILS to 'config'/'configs'
* **English:** Move defaut.sh file to default.sh one
* **English:** Move 'commun.sh' file to 'common.sh' one
* **English:** Translate README.md file
* **English:** Move profils.exemple to configs.example
* **English:** Move 'modeles' directory to 'templates' one
* **English:** Move libs from 'bibliotheques' to 'lib' directory
* **Memory Game:** ajout d'un nouveau profil Memory Game
* **Scripts:** Reconnaissance par les IDE (ajout d'un suffixe .sh)

### Bug fix

* **Adminer:** Redémarrage, toujours


<a name="v0.2.0"></a>
## [v0.2.0](https://github.com/blankoworld/genese/compare/v0.1.0...v0.2.0) (2023-09-08)

### Release

* v0.2.0

### Bug fix

* **Adminer:** Amélioration de l'URL pour accéder à postgreSQL
* **Docker:** Correction de la variable d'environnement SOCKET_DOCKER
* **Docker:** REP_SERVICES manquant dans le fichier .env
* **Docker:** Utilisation d'une variable REP_MODELES pour le répertoire `modeles`
* **Docker:** Ajout de COMPOSE_PROJECT_NAME dans le fichier .env
* **Docker Compose:** Problème avec le nom des utilisateurs ayant un point
* **Profil:** Cosmétique d'affichage de la liste des profils
* **Profils:** Correction des noms de dossiers avec des tirets
* **Profils:** Correction de l'argement pour la création de profils
* **README:** Ajout de la liste des fonctionnalités de l'application
* **README:** Oubli de la variable REP_INSTALLATION. C'est corrigé !
* **Syntaxe:** Déplacement de code de 2 espaces
* **genese:** Chargement de la configuration après auto_chargement
* **genese:** Autochargement remanié pour la situation de DL externe
* **genese:** Oubli d'un argument pour messsage_post_creation_instance()
* **genese:** Correction sur la récupération du dépôt Git officiel

### Code refactoring

* **Docker:** Refactorisation du code pour la détection de Docker/Compose
* **genese:** Refactorisation de l'analyse des options

### Features

* **Docker:** Préparation de l'environnement Docker avec un .env
* **Docker:** Var. d'ENV globale pour fichier docker-compose.yml
* **Docker:** détection de podman/docker
* **Git:** possibilité de surcharger le nom de la branche utilisée
* **Git:** récupération silencieuse des dépôts
* **Instance:** Choix possible du nom de l'instance
* **Instances:** Utilisation d'une variable globale pour le rép. d'install.
* **Messages:** plus de couleurs, plus de gras :-)
* **Portainer:** lancer_portainer() pour créer un Portainer commun sur le port 4000
* **Services:** Récupération de dépôt Git et dossier 'extras' dans instance
* **Services:** Déclencheurs (hook) pre/post docker + à la fin de l'installation
* **TODO:** MàJ liste TODO
* **genere:** Auto-chargement du script par lui-même
* **genese:** Message concernant Portainer à la fin du processus
* **genese:** Utilisation d'une variable pour le dossier principal
* **genese:** Possibilité de configurer le projet avec un fichier .env


<a name="v0.1.0"></a>
## v0.1.0 (2022-06-25)

### Features

* **CHANGELOG:** Nouveau fichier CHANGELOG pour suivre le logiciel
* **Commande:** Suppression d'une instance
* **Commande:** Listing des instances installées
* **Commande:** Amélioration des options de l'aide contextuelle
* **Docker:** Démarrage des conteneurs à l'installation d'un profil
* **Documentation:** Fichier README pour expliquer le projet
* **Instances:** Extinction des conteneurs Docker avant suppression d'une instance
* **Licence:** Ajout de l'EUPL 1.2 sur le projet
* **Profil:** Installation du profil choisi
* **Profils:** Listing des profils
* **TODO:** MàJ de la liste de tâches à faire
* **TODO:** MàJ de la liste

### Code refactoring

* **Docker:** Extraction vers une bibliothèque séparée
* **Instances:** installer_profil() -> creer_instance()
* **Profils:** Extraction de la suppression des Docker dans une fonction

### Bug fix

* **Doc:** Correction de la documentation pour les variables d'env.
* **Docker:** Complétude des variables d'environnement et documentation
* **Instance:** Affichage d'une erreur si dossier Instance non trouvé
* **Profils:** Utilisation d'une variable d'env. pour le répertoire des profils
* **Profils:** Correction mineure sur argument de la fonction decouverte_services

