# EspoCRM docker image

* docker and docker-compose installed, see [docker installation manual](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository).

## Run

1. Start mysql and espoCRM container by using the docker-compose command.

``` sh

#!/bin/bash

ESPOCRM_BASE_DIR="/var/lib/espocrm"

sudo mkdir -p $ESPOCRM_BASE_DIR/db/{data,import}
sudo mkdir -p $ESPOCRM_BASE_DIR/espocrm-data

sudo cp -r ./importdb/*.* $ESPOCRM_BASE_DIR/db/import/

sudo chown -R www-data:www-data $ESPOCRM_BASE_DIR/espocrm-data

ESPO_PROJECT_URL=<mydomain.com> MYSQL_ROOT_PASSWORD=<myrootpw> MYSQL_DATABASE=<mydb> MYSQL_USER=<myuser> MYSQL_PASSWORD=<mypw> docker-compose -f docker-compose_development.yml up --build
```

The compose file (```docker-compose_development.yml```) maps the directory ```/var/lib/espocrm/db``` to the mysql container and the directory ```/var/lib/espocrm/espocrm-data``` to the espocrm container.

## EspoCRM configuration

1. Open http://localhost:8888/install for a first time setup of EspoCRM.
2. in the db connection screen, use the container name of the mysql database incl. port as hostname, e.g. ```espocrmdockerized_db_1:3306```

## Adjustments by Benjamin A./Deinhofer M.

* made docker-compose_development.yml parametrizable from external script via environment variables.
* use one common base path for db and espocrm
* docker_compose.yml is removed, because this image is not pulished on DockerHub
* Debian stable instead of Ubuntu (version pinned)
* PHP7
* Added importdb fold, all SQL files are imported to the DB
* Added ALTER USER for supporting mysql_native authentication (EspoCRM needs this)
