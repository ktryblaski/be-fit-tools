#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_variables

${DIR}/build-api.sh

info "---> Stopping existing be-fit-webapp container <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
	           rm -f -s \
               befit-api

${DIR}/start.sh
