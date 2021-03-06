#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh
. ${DIR}/../config

check_env_file
check_env_variables

BEFIT_VERSION=${BEFIT_VERSION:-$(befit_version)}

info "---> Building be-fit-webapp image <---"
docker build  -t befit-webapp:${BEFIT_VERSION} \
              -f $(webapp_path)/docker/remote/Dockerfile \
              $(webapp_path)

docker tag befit-webapp:"${BEFIT_VERSION}" befit-webapp
