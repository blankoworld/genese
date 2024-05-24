#!/usr/bin/env bash
#
# hook_post_docker.sh
#

# Installation des dépendances composer
docker run --rm -v ${INSTALL_DIR}/memory_game:/app --user $(id -u):$(id -g) composer install --ignore-platform-reqs
# Compilation du fichier CSS
docker run --rm -v ${INSTALL_DIR}/memory_game:/data codycraven/sassc sources/style.scss > ${INSTALL_DIR}/memory_game/memory.css
