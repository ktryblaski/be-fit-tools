#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_befit_env_variables

BEFIT_VERSION=${BEFIT_VERSION:-$(befit_version)}

info "---> Building API image <---"
docker build  -t befit-api:${BEFIT_VERSION} \
              -f ${BEFIT_API}/docker/remote/Dockerfile \
              --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} \
              ${BEFIT_API}

docker tag befit-api:${BEFIT_VERSION} befit-api
