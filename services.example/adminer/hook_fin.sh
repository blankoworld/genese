#!/usr/bin/env bash
#
# hook_fin.sh

adminer_port=`docker-compose -f "${FICHIER_DOCKER_COMPOSE}" port adminer 8080 |cut -d ":" -f 2`

msg_info "Pour accéder à Adminer, allez sur ${GRAS}${COULEUR_ROUGE}http://localhost:${adminer_port}/?pgsql=db&username=postgres${COULEUR_DEFAUT}"
