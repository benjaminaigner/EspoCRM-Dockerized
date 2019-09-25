# Requirements

* create a folder "espocrm_data" with owner www-data:www-data
* create a folder ".data" for DB
* Adjust passwords in importdb/nativeauthentication **AND** docker-compose_development.yml

# Installation

* `docker-compose -f docker-compose_development.yml up`
* Open `http://localhost:8888/install` for the initial wizard

# EspoCRM installation

* Use DB container name as hostname (e.g., "espocrmdockerized_db_1"
* Default settings for DB connection: DB: "espocrm", user: "espo", pw: "secret2" (CHANGE THIS!)

# Adjustments by Benjamin A.:

* docker_compose.yml is removed, because this image is not pulished on DockerHub
* Debian stable instead of Ubuntu (version pinned)
* PHP7
* Added importdb fold, all SQL files are imported to the DB
* Added ALTER USER for supporting mysql_native authentication (EspoCRM needs this)
