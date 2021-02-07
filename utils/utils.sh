#!/bin/bash

set -e

befit_version() {
  echo $(date +"%Y%m%d__%H%M%S")
}

check_env_variables() {
  err=false

  for env in \
    BEFIT_API \
    BEFIT_WEBAPP
  do
    if [[ -z ${!env} ]]; then
      error "${env} environment variable is not set"
      err=true
    fi
  done

  if [[ ${err} == true ]]; then
   exit 1
  fi
}

check_repos_changes() {
  check_env_variables

  err=false

  for repo in \
    BEFIT_API \
    BEFIT_WEBAPP
  do
    if [[ `git -C ${!repo} status --porcelain` ]]; then
      error "${repo} repository has uncommitted changes"
      err=true
    fi
  done

  if [[ ${err} == true ]]; then
   exit 1
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

  println_colorful ${red} "${message}"
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
