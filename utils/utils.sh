#!/bin/bash

set -e

check_befit_env_variables() {
  if [[ -z ${BEFIT_API} ]]; then
    error "BEFIT_API environment variable is not set"
  fi

  if [[ -z ${BEFIT_WEBAPP} ]]; then
    error "BEFIT_WEBAPP environment variable is not set"
  fi

  if [[ (-z ${BEFIT_API}) || (-z ${BEFIT_WEBAPP}) ]]; then
    exit 1
  fi
}

check_befit_api_variable() {
  if [[ -z ${BEFIT_API} ]]; then
    error "BEFIT_API environment variable is not set"
    exit 1
  fi
}

check_befit_webapp_variable() {
  if [[ -z ${BEFIT_WEBAPP} ]]; then
    error "BEFIT_WEBAPP environment variable is not set"
    exit 1
  fi
}

check_repos_have_no_changes() {
  check_befit_env_variables

  start_pwd=$(pwd)
  should_exit_1=false

  cd ${BEFIT_API}
  if [[ `git status --porcelain` ]]; then
    error "API repository has uncommitted changes"
    should_exit_1=true
  fi

  cd ${BEFIT_WEBAPP}
  if [[ `git status --porcelain` ]]; then
    error "WEBAPP repository has uncommitted changes"
    should_exit_1=true
  fi

  cd ${start_pwd}

  if [[ ${should_exit_1} == true ]]; then
   exit 1
  fi
}

println() {
  printf "${1}\n"
}

success() {
  green=$'\e[1;32m'
  end=$'\e[0m'

  println "${green}${1}${end}"
}

info() {
  yellow=$'\e[1;33m'
  end=$'\e[0m'

  println "${yellow}${1}${end}"
}


error() {
  red=$'\e[1;31m'
  end=$'\e[0m'

  println "${red}${1}${end}"
}

befit_version() {
    echo $(date +"%Y%m%d__%H%M%S")
}
