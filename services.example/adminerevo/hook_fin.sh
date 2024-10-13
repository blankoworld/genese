#!/usr/bin/env bash
#
# hook_fin.sh

adminer_port=`docker-compose -f "${DOCKER_COMPOSE_FILEPATH}" port adminer 8080 |cut -d ":" -f 2`

info_msg "Pour accéder à Adminer, allez sur ${BOLD}${RED_COLOR}http://localhost:${adminer_port}/?pgsql=db&username=postgres${DEFAULT_COLOR}"
