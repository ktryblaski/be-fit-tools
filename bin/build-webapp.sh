#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

BEFIT_VERSION=${BEFIT_VERSION:-$(befit_version)}

info "---> Building WEBAPP image <---"
docker build  -t befit-webapp:${BEFIT_VERSION} \
              -f ${BEFIT_WEBAPP}/docker/remote/Dockerfile \
              --build-arg NODE_VERSION=${NODE_VERSION} \
              --build-arg NGINX_VERSION=${NGINX_VERSION} \
              ${BEFIT_WEBAPP}

docker tag befit-webapp:"${BEFIT_VERSION}" befit-webapp
