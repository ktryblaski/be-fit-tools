#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_variables

${DIR}/build-webapp.sh

info "---> Stopping existing be-fit-webapp container <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
	           rm -f -s \
               befit-webapp

${DIR}/start.sh
