# Présentation

Ce dépôt a pour but de fournir un outil qui permette de faciliter la création d'un script qui automatise la génération d'un nouvel environnement pour votre projet.

Il s'appuie sur Docker Compose pour cela. La finalité est d'avoir un dossier contenant un environnement neuf pour votre projet avec un fichier docker-compose.yml qui lance les différents services nécessaires à celui-ci.

Même s'il permet de faciliter cette génération, il ne fait pas tout !

En effet, vous décrivez chaque service que vous utilisez dans un dossier à cet effet. Puis vous crééez une configuration qui liste les services nécessaires. Et enfin vous utilisez la commande de base pour générer en quelques minutes votre environnement.

C'est un outil initialement fait pour des développeurs d'application, afin de leur faciliter la création d'un nouvel environnement de travail à chaque nouveau ticket, pour chaque développeur, pour chaque projet.

Un exemple est donné dans les dossiers `configs.example` et `services.example`.

# Fonctionnalités

* Création automatisée de conteneurs Docker reliés entre eux
* Génération d'un fichier docker-compose.yml à partir de dossiers standardisés
* Téléchargement automatique des dépôts Git pour les projets ciblés
* Utilisation de fichiers de configs pour décrire les « dépendances » d'un projet (config)
* Héritage possible d'une configuration à l'autre
* Lancement d'une instance unique de Portainer pour la gestion des « stacks » générées
* Choix possible d'un nom de stack pour chaque « projet » (config) qu'on lance
* Affichage en couleur de la procédure d'installation d'un projet (config)
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

Ce fichier `.env` va contenir la configuration de l'application, notamment concernant la localisation du répertoire contenant les configs et du répertoire contenant les services.

# Utilisation

La commande de base initie l'affichage d'une aide : 

```
bash genese
```

Options disponibles : 

- `-h`, `--help` : Affichage de l'aide contextuelle
- `-i`, `--instance` : Liste des instances installées
- `-l`, `--liste` : Liste des configs disponibles
- `-n`, `--nom` : Nom donné à l'instance à créer. Par défaut le même nom que la configuration
- `-c <nom>`, `--config <nom>` : Utilise la configuration `<nom>` comme base de déploiement
- `-s <nom>`, `--supprime <nom>` : Supprime l'instance `<nom>`

# Installation et utilisation en une seule fois

Petite astuce intéressante pour déployer un environnement en une seule fois : 

```bash
mkdir test
cd test
wget -q -O - "https://raw.githubusercontent.com/blankoworld/genese/develop/genese" |bash -s -- -c default
```

Cette commande va télécharger la dernière version du logiciel dans le répertoire `test` et lancer l'installation de la configuration par défaut.

C'est de cette manière qu'on permet d'avoir un outil intéressant pour des installations en un seul coup.

# Variables d'environnement

## Concernant l'application

L'utilisation de variables d'environnement permettent de personnaliser le comportement de l'outil.

- `POST_DOCKER_HOOK_NAME` : Nom du fichier contenant les commandes effectuées **après** le lancement de tous les conteneurs Docker. Le fichier doit se trouver dans l'un des services utilisés. Par exemple dans `./services/postgres14/hook_post_docker.sh`. Valeur par défaut : `hook_post_docker.sh`
- `FINAL_INSTALLATION_HOOK_NAME` : Nom du fichier contenant des commandes à lancer à la fin de l'installation d'une instance. Il doit se trouver dans le dossier d'un service utilisé. Par exemple dans `./services/adminer/hook_fin.sh`. Valeur par défaut : `hook_fin.sh`
- `PRE_DOCKER_HOOK_NAME` : Nom du fichier listant les actions à effectuer **avant** le lancement des conteneurs Docker. Ce fichier doit se trouver dans l'un des services utilisés. Par exemple dans `./services/postgres14/hook_pre_docker.sh`. Valeur par défaut : `hook_pre_docker.sh`
- `EXTRAS_DIRNAME` : Nom du dossier contenant les fichiers qu'on souhaite déposer dans le répertoire d'une instance. Ce dossier se trouve dans les services pour lesquels on souhaite écraser quelques fichiers. Valeur par défaut : `extras`. Chaque fichier et dossier dans ce répertoire se retrouvera dans la destination finale.
- `REPO_FILENAME` : Nom du fichier situé dans un répertoire service et décrivant la branche et le dépôt à utiliser pour charger d'éventuels fichiers du service. Valeur par défaut : `source`.
- `DOCKER_COMPOSE_FILENAME`: final Docker Compose filename for the instance. Default value: `docker-compose.yml`
- `SERVICE_FILENAME`: Filename describing a service (in `SERVICES_DIR` folder). Default value: `compose.yml`
- `PORTAINER_NAME` : Nom du conteneur Portainer. Utilisé pour repérer l'état de lancement dudit service. Valeur par défaut : `genese_portainer`
- `PORTAINER_PORT` : Port d'écoute du service Portainer. Valeur par défaut : `4000`
- `CONFIG` : Nom du fichier config par défaut. Valeur par défaut : `default`
- `INSTANCES_DIR` : Chemin vers le répertoire où installer les instances générées par le logiciel. Valeur par défaut : `./instances`
- `CONFIGS_DIR` : Chemin vers le répertoire qui contient les configs à utiliser. Valeur par défaut : `./configs.example`
- `SERVICES_DIR` : Chemin vers le répertoire qui contient les services à utiliser. Valeur par défaut : `./services.example`
- `DOCKER_SOCKET`: Absolute address to Docker socket. Default value: `/var/run/docker.sock`.

Vous pouvez surcharger les valeurs de ces variables en ligne de commande, par exemple : 

```bash
PORTAINER_PORT=8282 ./genese
```

## Concernant les exemples de services fournis

- `ADMINER_PORT`: listening port for Adminer service. If not filled in, Docker uses a random available port.

## Générées par l'application

Some variables are generated by the application, so they cannot be modified at the start of the application.

On the other hand, they can be used in scripts - called hooks - provided by the services.

Here is a non-exhaustive list of available variables: 

- `MYSERVICE_BRANCH`: Replace **MYSERVICE** with the name of the service you are working on. Enter the name of the branch by which you want to start the instance. Imagine you wanted to use the `dev` for the **adminer** service, do : `ADMINER_BRANCH="dev" ./genese -c default`
- `DOCKER_COMPOSE_HEADER_PATH`: Path from the template used to start all docker-compose.yml files.
- `DOCKER_COMPOSE_FILEPATH`: Docker Compose file (docker-compose.yml) absolute path used in a given instance. For example if the instance is in the `instance/my_instance` folder this means the file is: `/absolute/address/instance/my_instance/docker-compose.yml`.
- `PORTAINER_IMAGE`: Docker image used for portainer
- `SERVICES_LIST`: table with list of services found in choosen user configuration.
- `INSTANCE_NAME`: instance name (by default the value is those from the config name choosed by user. Except if user gave a specific name)
- `CONFIG`: config. name choosen by user
- `PROGRAM`: Application name. By default: `genese`
- `BASE_DIR`: absolute path for base directory in which `genese` is.
- `INSTALL_DIR`: absolute path in which all instances would be installed. In example in `instance/default/` folder.
- `TEMPLATES_DIR`: path where templates are. In example `header.yml` (for `docker-compose.yml` header) would be in it.
- `SOURCE`: initial repository where `genese` application is.

# Fichier CHANGELOG.md

A [CHANGELOG](./CHANGELOG.md) file is available to list differences since last version.

To generate it, install [**git-chglog**](https://github.com/git-chglog/git-chglog).

To update it, execute the following command: 

```bash
make changelog
```

# License

This software is granted under [EUPL license, version 1.2 only](https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12).

# Contact

This project is available under [genese project Github page](https://github.com/blankoworld/genese).
