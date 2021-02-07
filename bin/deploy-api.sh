#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_variables

info "---> Stopping old API container <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
	           rm -f -s \
               befit-api

${DIR}/build-api.sh

${DIR}/start.sh
