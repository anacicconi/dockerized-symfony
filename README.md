Docker Symfony SQL starter
====

This is a development environment for a project using Symfony and SQL based on Docker. Just follow the steps and you should have a Symfony app up and running.

**1) Make a copy of the .env-example file, rename it to .env and fill the values**

```cp .env-example .env```

**2) Run the script**

```bash run.sh```

**3) Browse the site!**

```Eg: http://localhost:8080```

## Requirements:

#### Install Docker

https://docs.docker.com/engine/installation/

#### Install Docker Compose

https://docs.docker.com/compose/install/

#### Install Symfony Installer

https://symfony.com/doc/current/setup.html#creating-symfony-applications

## What will be installed:

Two Docker container servers. One Apache server containing a Symfony application and one SQL server. The Apache server will use the Symfony version defined on the .env file. The PHP version used is the 7.0. The SQL server can be a MySQL or a MariaDB. By default, it's a MariaDB 10.1.

## The environment variables:

Some of them already have a default value but feel free to change it.

#### Dockerfile configuration

```
SITE_NAME: the name that will be used for the Apache Virtual Host but also for your Symfony project.

SERVER_ADMIN: the email of the person responsible for the server.

SERVER_LOCALE: the locale installed on the server (locale-gen). Default: en_US.UTF-8

APACHE_LOG_DIR: the directory where the Apache logs will be kept. Default: /var/log/apache2

SYMFONY_VERSION: the version of symfony that will be installed. Default: 3.3
```

#### App configuration

```
APP_CONTAINER_NAME: the name of the container that will be created by Docker for the app.

APP_EXTERNAL_PORT: the port where the site will be running on the host. Eg: http://localhost:8080
```

#### Database configuration

```
SQL_IMAGE: the image used to create the SQL server. It can work with MySQL or MariaDb. Default: mariadb:10.1

SQL_CONTAINER_NAME: the name of the container that will be created by Docker for the SQL.

DATABASE_INTERNAL_PORT: the port where the SQL will be running inside the container. Default: 3306

DATABASE_EXTERNAL_PORT: the port where the SQL will be accessible on the host.

DATABASE_INTERNAL_VOLUME: the directory where the SQL files are saved inside the container. Default: /var/lib/mysql

DATABASE_EXTERNAL_VOLUME: the directory where the SQL files are saved on the host. It's useful to keep the database changes when the container is restarted.

DATABASE_NAME_TAG: the tag to the database name according to the server used. Default: MYSQL_DATABASE

DATABASE_NAME_VALUE: the database name.

DATABASE_USER_TAG: the tag to the database user according to the server used. Default: MYSQL_USER

DATABASE_USER_VALUE: the database user.

DATABASE_PASSWORD_TAG: the tag to the database password according to the server used. Default: MYSQL_PASSWORD

DATABASE_PASSWORD_VALUE: the database password.

DATABASE_ROOT_PASSWORD_TAG: the tag to the database root password according to the server used. Default: MYSQL_ROOT_PASSWORD

DATABASE_ROOT_PASSWORD_VALUE: the database root password.

DATABASE_COMMAND: some command to be launched when the SQL container is created.
```

Obs1: after Symfony install, this message will appear. If you want your site running on the 8000 port, this port must be set as APP_EXTERNAL_PORT in the .env file.

```
* Run your application:
        1. Execute the php bin/console server:start command.
        2. Browse to the http://localhost:8000 URL.
```

Obs2: in order to connect the Symfony app to the database server, use the values defined in the .env file. The database_host, however, is "database". It's an alias defined on the docker container.

```
parameters:
    database_host: database
    database_port: 3306
    database_name: my-project
    database_user: admin
    database_password: admin
```
