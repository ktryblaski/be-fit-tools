# be-fit-tools
A set of tools which helps in deploying **be-fit** applications.

## Usage

The repository includes a few bash scripts:

* `clear` - removes all **be-fit** containers, networks and volumes
* `deploy` - re/deploys (builds, stops and starts) all **be-fit** applications
* `pull` - pulls the newest versions of **be-fit-api** and **be-fit-webapp** from remote repository
* `start` - starts **be-fit** containers
* `stop` - stops **be-fit** containers

## Prerequisites
* Unix operating system with bash support
* Docker version >= 20.10.3
* Docker Compose version >= 1.26.1
