#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_variables

BEFIT_VERSION=${BEFIT_VERSION:-$(befit_version)}

info "---> Building API image <---"
docker build  -t befit-api:${BEFIT_VERSION} \
              -f ${BEFIT_API}/docker/remote/Dockerfile \
              ${BEFIT_API}

docker tag befit-api:${BEFIT_VERSION} befit-api
