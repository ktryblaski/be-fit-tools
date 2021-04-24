#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

${DIR}/build-api.sh
${DIR}/build-webapp.sh

${DIR}/stop.sh
${DIR}/start.sh
