#!/bin/bash

set -e

DIR=$( dirname $0 )

. ${DIR}/../utils/utils.sh

check_env_variables
check_repos_changes

info "---> Pulling API <---"
git -C $(api_path) checkout master
git -C $(api_path) pull origin master

info "---> Pulling WEBAPP <---"
git -C $(webapp_path) checkout master
git -C $(webapp_path) pull origin master
