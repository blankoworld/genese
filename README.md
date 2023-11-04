# Présentation

Ce dépôt a pour but de fournir un outil qui permette de faciliter la création d'un script qui automatise la génération d'un nouvel environnement pour votre projet.

Il s'appuie sur Docker Compose pour cela. La finalité est d'avoir un dossier contenant un environnement neuf pour votre projet avec un fichier docker-compose.yml qui lance les différents services nécessaires à celui-ci.

Même s'il permet de faciliter cette génération, il ne fait pas tout !

En effet, vous décrivez chaque service que vous utilisez dans un dossier à cet effet. Puis vous crééez un profil qui liste les services nécessaires. Et enfin vous utilisez la commande de base pour générer en quelques minutes votre environnement.

C'est un outil initialement fait pour des développeurs d'application, afin de leur faciliter la création d'un nouvel environnement de travail à chaque nouveau ticket, pour chaque développeur, pour chaque projet.

Un exemple est donné dans les dossiers `profils.exemple` et `services.exemple`.

# Fonctionnalités

* Création automatisée de conteneurs Docker reliés entre eux
* Génération d'un fichier docker-compose.yml à partir de dossiers standardisés
* Téléchargement automatique des dépôts Git pour les projets ciblés
* Utilisation de fichiers de profils pour décrire les « dépendances » d'un projet (profil)
* Héritage possible d'un profil à l'autre
* Lancement d'une instance unique de Portainer pour la gestion des « stacks » générées
* Choix possible d'un nom de stack pour chaque « projet » (profil) qu'on lance
* Affichage en couleur de la procédure d'installation d'un projet (profil)
* Utilisation de variables d'environnement pour surcharger le paramétrage de l'application
* Détection de podman, docker et podman-compose/docker-compose
* Listing des « instances » générées par le programme
* Suppression/nettoyage possible d'une instance donnée
* Système de « déclencheurs » pour permettre d'exécuter un code spécifique avant/après le lancement des conteneurs
* Surcharge possible des fichiers récupérés par Git pour écraser certains fichiers ou apporter de la configuration supplémentaire
* Possibilité d'utiliser le script sur Gitlab Pages pour lui permettre de s'auto-charger d'un dépôt et déployer le reste des bibliothèques nécessaires

# Prérequis

Il faut les outils suivants : 

* Être sous GNU/Linux ou dans un environnement pouvant utiliser l'interpréteur de commande nommé Bash
* Docker
* Docker Compose

# Préparation

Dans un premier temps, récupérez le dépôt complet.

Ensuite rendez le script principal exécutable : 

```bash
chmod +x genese
```

# Configuration

Il est vivement conseillé de créer un fichier `.env` dont vous avez un exemple situé dans le fichier `.env.exemple`.

```bash
cp .env.exemple .env
```

Ce fichier `.env` va contenir la configuration de l'application, notamment concernant la localisation du répertoire contenant les profils et du répertoire contenant les services.

# Utilisation

La commande de base initie l'affichage d'une aide : 

```
bash genese
```

Options disponibles : 

- `-h`, `--help` : Affichage de l'aide contextuelle
- `-i`, `--instance` : Liste des instances installées
- `-l`, `--liste` : Liste des profils disponibles
- `-n`, `--nom` : Nom donné à l'instance à créer. Par défaut le même nom que le profil
- `-p <nom>`, `--profil <nom>` : Utilise le profil `<nom>` comme base de déploiement
- `-s <nom>`, `--supprime <nom>` : Supprime l'instance `<nom>`

# Installation et utilisation en une seule fois

Petite astuce intéressante pour déployer un environnement en une seule fois : 

```bash
mkdir test
cd test
wget -q -O - "https://raw.githubusercontent.com/blankoworld/genese/develop/genese" |bash -s -- -p defaut
```

Cette commande va télécharger la dernière version du logiciel dans le répertoire `test` et lancer l'installation du profil par défaut.

C'est de cette manière qu'on permet d'avoir un outil intéressant pour des installations en un seul coup.

# Variables d'environnement

## Concernant l'application

L'utilisation de variables d'environnement permettent de personnaliser le comportement de l'outil.

- `NOM_DECLENCHEUR_POST_DOCKER` : Nom du fichier contenant les commandes effectuées **après** le lancement de tous les conteneurs Docker. Le fichier doit se trouver dans l'un des services utilisés. Par exemple dans `./services/postgres14/hook_post_docker.sh`. Valeur par défaut : `hook_post_docker.sh`
- `NOM_DECLENCHEUR_POST_INSTALLATION` : Nom du fichier contenant des commandes à lancer à la fin de l'installation d'une instance. Il doit se trouver dans le dossier d'un service utilisé. Par exemple dans `./services/adminer/hook_fin.sh`. Valeur par défaut : `hook_fin.sh`
- `NOM_DECLENCHEUR_PRE_DOCKER` : Nom du fichier listant les actions à effectuer **avant** le lancement des conteneurs Docker. Ce fichier doit se trouver dans l'un des services utilisés. Par exemple dans `./services/postgres14/hook_pre_docker.sh`. Valeur par défaut : `hook_pre_docker.sh`
- `NOM_DOSSIER_EXTRAS` : Nom du dossier contenant les fichiers qu'on souhaite déposer dans le répertoire d'une instance. Ce dossier se trouve dans les services pour lesquels on souhaite écraser quelques fichiers. Valeur par défaut : `extras`. Chaque fichier et dossier dans ce répertoire se retrouvera dans la destination finale.
- `NOM_FICHIER_SOURCE` : Nom du fichier situé dans un répertoire service et décrivant la branche et le dépôt à utiliser pour charger d'éventuels fichiers du service. Valeur par défaut : `source`.
- `NOM_FICHIER_DOCKER_COMPOSE` : Nom du fichier Docker Compose final pour l'instance. Valeur par défaut : `docker-compose.yml`
- `NOM_FICHIER_SERVICE` : Nom du fichier décrivant un service (dans le dossier `REP_SERVICES`). Valeur par défaut : `compose.yml`
- `NOM_PORTAINER` : Nom du conteneur Portainer. Utilisé pour repérer l'état de lancement dudit service. Valeur par défaut : `genese_portainer`
- `PORT_PORTAINER` : Port d'écoute du service Portainer. Valeur par défaut : `4000`
- `PROFIL` : Nom du profil par défaut. Valeur par défaut : `defaut`
- `REP_INSTANCES` : Chemin vers le répertoire où installer les instances générées par le logiciel. Valeur par défaut : `./instances`
- `REP_PROFILS` : Chemin vers le répertoire qui contient les profils à utiliser. Valeur par défaut : `./profils.exemple`
- `REP_SERVICES` : Chemin vers le répertoire qui contient les services à utiliser. Valeur par défaut : `./services.exemple`
- `SOCKET_DOCKER` : Adresse absolue vers le Socket Docker. Valeur par défaut : `/var/run/docker.sock`.

Vous pouvez surcharger les valeurs de ces variables en ligne de commande, par exemple : 

```bash
PORT_PORTAINER=8282 ./genese
```

## Concernant les exemples de services fournis

- `PORT_ADMINER` : Port d'écoute du service Adminer. Si non renseigné, Docker utiliser un port aléatoire disponible

## Générées par l'application

Certaines variables sont générées par l'application, donc non modifiables au lancement de l'application.

En revanche elles peuvent être utilisées dans les scripts - dits déclencheurs - fournis par les services.

Voici une liste non exhaustive des variables disponibles : 

- `BRANCHE_MONSERVICE` : Remplacez **MONSERVICE** par le nom du service sur lequel vous travaillez. Mettez le nom de la branche par laquelle vous souhaitez démarrer l'instance. Imaginons que vous vouliez utiliser la branche `dev` du service **adminer**, faites : `BRANCHE_ADMINER="dev" ./genese -p defaut`
- `ENTETE_DOCKER_COMPOSE` : Modèle de fichier ayant l'entête d'un fichier docker-compose.yml pour les fabriquer
- `FICHIER_DOCKER_COMPOSE` : Adresse absolue du fichier Docker Compoe (docker-compose.yml) utilisé dans l'instance choisie. Par exemple si l'instance est dans le dossier `instance/mon_instance`, cela désigne le fichier `/adresse/absolue/instance/mon_instance/docker-compose.yml`.
- `IMAGE_PORTAINER` : nom de l'image Docker utilisée pour instancer Portainer.
- `LISTE_SERVICES` : tableau contenant la liste des services trouvés dans le profil choisi par l'utilisateur.
- `NOM_INSTANCE` : nom de l'instance (par défaut c'est le nom du profil, sauf si l'utilisateur a choisi un nom spécifique)
- `PROFIL` : nom du profil choisi par l'utilisateur
- `PROGRAMME` : nom de l'application lancée. En théorie devrait se nommer `genese`.
- `REP_BASE` : adresse absolue du répertoire de base dans lequel se trouve l'application. C'est le répertoire où se trouve `genese`.
- `REP_INSTALLATION` : adresse absolue du répertoire dans lequel se trouve une installation du service choisi. Par exemple dans le dossier `instance/defaut/`.
- `REP_MODELES` : Chemin vers le répertoire qui contient les modèles de fichier utilisés comme base pour générer d'autres fichiers. Par exemple `entete.yml` est l'entête des fichiers `docker-compose.yml` qui seront générés pour chaque instance.
- `SOURCE` : dépôt Git où trouver l'application `genese`.


# Fichier CHANGELOG.md

Un fichier [CHANGELOG](./CHANGELOG.md) est disponible pour lister les différences depuis la dernière version.

Pour le générer, veuillez installer [**git-chglog**](https://github.com/git-chglog/git-chglog).

Pour mettre à jour le fichier CHANGELOG.md, il suffit d'exécuter la commande suivante : 

```bash
make changelog
```

# Licence

Ce logiciel est concédé sous [licence EUPL, version 1.2 uniquement](https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12).

# Contact

Le projet est disponible sur [la page Github du projet genese](https://github.com/blankoworld/genese).
