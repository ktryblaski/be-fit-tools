#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_file
check_env_variables

info "---> Removing existing containers <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
	           --env-file ${DIR}/../.env \
	           rm -f -s

info "---> Removing network <---"
if [[ `docker network ls | grep "${COMPOSE_PREFIX}_befit-network"` ]]; then
  docker network rm "${COMPOSE_PREFIX}_befit-network"
fi

info "---> Removing volume <---"
if [[ `docker volume ls | grep "${COMPOSE_PREFIX}_befit-pg-data"` ]]; then
  docker volume rm "${COMPOSE_PREFIX}_befit-pg-data"
fi
