#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh

check_env_variables
check_repos_changes

info "---> Pulling API <---"
cd ${BEFIT_API}
git checkout master
git pull

info "---> Pulling WEBAPP <---"
cd ${BEFIT_WEBAPP}
git checkout master
git pull
