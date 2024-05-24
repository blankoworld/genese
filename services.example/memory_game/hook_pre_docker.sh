#!/usr/bin/env bash
#
# hook_pre_docker.sh de memory_game
#
# Va copier le contenu du dossier base_de_donnees vers bdd du répertoire
# d'installation de base.
# Ceci car nous avons le service MySQL qui fait un montage de volume du
# dossier ${INSTALL_DIR}/bdd.
#
# Puis adaptation du fichier GestionScores.php pour changer ID/MDP, car le
# service mysql propose un autre id/mdp

# Copie de la BDD
cp -r "${INSTALL_DIR}/memory_game/base_de_donnees" "${INSTALL_DIR}/bdd"

# Changement des id/mdp
old="${INSTALL_DIR}/memory_game/sources/Modeles/GestionScores.php" 
new="${INSTALL_DIR}/memory_game/sources/Modeles/GestionScores.php.new"
cat "${old}"|sed -e 's/mot_de_passe = ".*"/mot_de_passe = "admin"/' -e 's/base = ".*"/base = "test"/' > "${new}"
cp "${new}" "${old}" && rm "${new}"
