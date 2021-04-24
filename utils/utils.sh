#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

befit_version() {
  echo $(date +"%Y%m%d__%H%M%S")
}

api_path() {
  if [[ ! -z ${BEFIT_API} && -d ${BEFIT_API} ]]; then
    echo ${BEFIT_API}
    return 0
  fi

  if [[ -d "${DIR}/../../be-fit-api" ]]; then
    echo "${DIR}/../../be-fit-api"
    return 0
  fi

  error "be-fit-api location can not be found"
  exit 1
}

webapp_path() {
  if [[ ! -z ${BEFIT_WEBAPP} && -d ${BEFIT_WEBAPP} ]]; then
    echo ${BEFIT_WEBAPP}
    return 0
  fi

  if [[ -d "${DIR}/../../be-fit-webapp" ]]; then
    echo "${DIR}/../../be-fit-webapp"
    return 0
  fi

  error "be-fit-webapp location can not be found"
  exit 1
}

check_env_variables() {
  api_path >/dev/null
  webapp_path >/dev/null
}

check_repos_changes() {
  check_env_variables

  err=false

  if [[ `git -C $(api_path) status --porcelain` ]]; then
    error "be-fit-api repository has uncommitted changes"
    err=true
  fi

  if [[ `git -C $(webapp_path) status --porcelain` ]]; then
    error "be-fit-webapp repository has uncommitted changes"
    err=true
  fi

  if [[ ${err} == true ]]; then
   exit 1
  fi
}

check_env_file() {
  if [[ ! -f ${DIR}/../.env ]]; then
    cp ${DIR}/../.env-example ${DIR}/../.env
  fi
}

success() {
  green=$'\e[1;32m'
  message=$1

  println_colorful ${green} "${message}"
}

info() {
  yellow=$'\e[1;33m'
  message=$1

  println_colorful ${yellow} "${message}"
}

error() {
  red=$'\e[1;31m'
  message=$1

  println_colorful ${red} "${message}" >&2
}

println_colorful() {
  color=$1
  message=$2
  default=$'\e[0m'

  println "${color}${message}${default}"
}

println() {
  printf "${1}\n"
}
