#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

BEFIT_VERSION=$(befit_version)
export POSTGRES_VERSION

${DIR}/build-api.sh
${DIR}/build-webapp.sh

info "---> Pulling non existing images <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
 	           --env-file ${DIR}/../.env \
               pull --include-deps befit-db
