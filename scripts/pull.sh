#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh

check_env_variables
check_repos_changes

info "---> Pulling be-fit-api <---"
git -C $(api_path) checkout master
git -C $(api_path) pull origin master

info "---> Pulling be-fit-webapp <---"
git -C $(webapp_path) checkout master
git -C $(webapp_path) pull origin master
