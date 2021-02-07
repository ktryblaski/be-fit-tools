# socico tools
A set of tools which helps in deploying **be-fit** apps.

## Usage

This repository includes a few bash scripts:
* `build-api.sh` - builds a docker image with **be-fit-api** app
* `build-webapp.sh` - builds a docker image with **be-fit-webapp** app
* `clear.sh` - stops and removes **be-fit** docker compose's instance
* `deploy-api.sh` - stops, builds and deploys **be-fit-api** app
* `deploy-webapp.sh` - stops, builds and deploys **be-fit-webapp** app
* `pull.sh` - pulls **be-fit-api** and **be-fit-webapp** source codes from remote repository
* `setup.sh` - builds **be-fit-api**, **be-fit-webapp** and pulls other necessary docker images
* `start.sh` - starts **be-fit** application
* `stop.sh` - stops **be-fit** application

## Prerequisites
* *nix operating system with bash installed
* docker version >= 20.10.3
* docker-compose version >= 1.26.1