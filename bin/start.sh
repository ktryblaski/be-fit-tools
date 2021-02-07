#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

export POSTGRES_VERSION

info "---> Checking .env file <---"
if [[ ! -f ${DIR}/../.env ]]; then
    cp ${DIR}/../.env-example ${DIR}/../.env
fi

info "---> Starting containers <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
	           -p ${COMPOSE_PREFIX} \
 	           --env-file ${DIR}/../.env \
               up --detach --quiet-pull --remove-orphans
