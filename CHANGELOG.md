# Genese CHANGELOG

Changements effectués sur l'application dans les dernières versions.

# Versions


<a name="v0.1.0"></a>
## v0.1.0 (2022-06-25)

### Fonctionnalités

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

### Factorisation de code

* **Docker:** Extraction vers une bibliothèque séparée
* **Instances:** installer_profil() -> creer_instance()
* **Profils:** Extraction de la suppression des Docker dans une fonction

### Correction de bugs

* **Doc:** Correction de la documentation pour les variables d'env.
* **Docker:** Complétude des variables d'environnement et documentation
* **Instance:** Affichage d'une erreur si dossier Instance non trouvé
* **Profils:** Utilisation d'une variable d'env. pour le répertoire des profils
* **Profils:** Correction mineure sur argument de la fonction decouverte_services

