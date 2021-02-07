#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

docker-compose -f ${DIR}/../docker/docker-compose.yml \
           	   -p ${COMPOSE_PREFIX} \
	           stop
