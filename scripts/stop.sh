#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_file
check_env_variables

info "---> Stopping containers <---"
docker-compose -f ${DIR}/../docker/docker-compose.yml \
           	   -p ${COMPOSE_PREFIX} \
           	   --env-file ${DIR}/../.env \
	           stop
