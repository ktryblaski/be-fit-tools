#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

info "---> Stopping old WEBAPP container <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
	           rm -f -s \
               befit-webapp

${DIR}/build-webapp.sh

${DIR}/start.sh
