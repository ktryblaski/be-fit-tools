#!/bin/sh

# # # # # # # #
BE_FIT_VERSION=$(date +"%H%M%S_%d%m%Y")

POSTGRES_VERSION=12.3
DB_HOST=db
DB_PORT=5432
DB_NAME=be-fit
DB_USERNAME=postgres
DB_PASSWORD=qwerty123456

NODE_VERSION=13.12-alpine
NGINX_VERSION=1.17.9-alpine

MAVEN_VERSION=3.6.3-jdk-8-slim
OPENJDK_VERSION=8u262-slim

COMPOSE_PREFIX="be-fit"
# # # # # # # #

echo "\n--- --- ---> Creating .env file <--- --- ---"
: > .env
{
  echo "BE_FIT_VERSION=${BE_FIT_VERSION}"
  echo "POSTGRES_VERSION=${POSTGRES_VERSION}"
  echo "DB_USERNAME=${DB_USERNAME}"
  echo "DB_PASSWORD=${DB_PASSWORD}"
  echo "DB_NAME=${DB_NAME}"
}  >> .env

echo "\n--- --- ---> Building webapp <--- --- ---"
docker build  -t be-fit-webapp:"${BE_FIT_VERSION}" \
              -f ../be-fit-webapp/docker/image/Dockerfile \
              --build-arg NODE_VERSION=${NODE_VERSION} \
              --build-arg NGINX_VERSION=${NGINX_VERSION} \
              ../be-fit-webapp

echo "\n--- --- ---> Building api <--- --- ---"
docker build  -t be-fit-api:"${BE_FIT_VERSION}" \
              -f ../be-fit-api/docker/image/Dockerfile \
              --build-arg MAVEN_VERSION=${MAVEN_VERSION} \
              --build-arg OPENJDK_VERSION=${OPENJDK_VERSION} \
              --build-arg DB_HOST=${DB_HOST} \
              --build-arg DB_PORT=${DB_PORT} \
              --build-arg DB_NAME=${DB_NAME} \
              --build-arg DB_USERNAME=${DB_USERNAME} \
              --build-arg DB_PASSWORD=${DB_PASSWORD} \
              ../be-fit-api

echo "\n--- --- ---> Stopping and/or removing probably existing containers <--- --- ---"
docker-compose rm -f -s

echo "\n--- --- ---> Starting containers <--- --- ---"
docker-compose -p $COMPOSE_PREFIX up -d --remove-orphans