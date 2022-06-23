# Présentation

Ce dépôt a pour but de fournir un outil qui automatise la génération d'un nouvel environnement pour votre projet.

Il s'appuie sur Docker Compose pour cela. La finalité est d'avoir un dossier contenant un environnement neuf pour votre projet avec un fichier docker-compose.yml qui lance les différents services nécessaires à celui-ci.

Même s'il permet de faciliter cette génération, il ne fait pas tout !

En effet, vous décrivez chaque service que vous utilisez dans un dossier à cet effet. Puis vous crééez un profil qui liste les services nécessaires. Et enfin vous utilisez la commande de base pour générer en quelques minutes votre environnement.

C'est un outil initialement fait pour des développeurs d'application, afin de leur faciliter la création d'un nouvel environnement de travail à chaque nouveau ticket, pour chaque développeur, pour chaque projet.

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

# Utilisation

La commande de base initie l'affichage d'une aide : 

```
bash genese
```

Options disponibles : 

- `-h`, `--help` : Affichage de l'aide contextuelle
- `-i`, `--instance` : Liste des instances installées
- `-l`, `--liste` : Liste des profils disponibles
- `-p <profil>`, `--profil <profil>` : Utilise le profil `<profil>` comme base de déploiement

# Variables d'environnement

## Concernant l'application

L'utilisation de variables d'environnement permettent de personnaliser le comportement de l'outil.

- `NOM_FICHIER_SERVICE` : Nom du fichier décrivant un service (dans le dossier `REP_SERVICES`). Valeur par défaut : `description.yml`
- `PROFIL` : Nom du profil par défaut. Valeur par défaut : `defaut`
- `REP_INSTANCES` : Chemin vers le répertoire où installer les instances générées par le logiciel. Valeur par défaut : `./instances`
- `REP_PROFILS` : Chemin vers le répertoire qui contient les profils à utiliser. Valeur par défaut : `./profils`
- `REP_SERVICES` : Chemin vers le répertoire qui contient les services à utiliser. Valeur par défaut : `./services`

## Concernant les exemples de services fournis

- `PORT_ADMINER` : Port d'écoute du service Adminer. Si non renseigné, Docker utiliser un port aléatoire disponible

# Licence

Ce logiciel est concédé sous [licence EUPL, version 1.2 uniquement](https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12).

# Contact

Le projet est disponible sur [la page Github du projet genese](https://github.com/blankoworld/genese).
