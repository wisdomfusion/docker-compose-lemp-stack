# docker-compose-lemp

Docker Compose LEMP Stack, with PHP 7.4, MySQL 8.0, and Redis 6, for PHP applications especially for Laravel projects.

## Before Usage

With this suite of docker orchestration files, I put a prefix before containers' name, `myapp` be default. In this way, all of the containers built with the compose file would come up this a `myapp-` in its title, for example, `myapp-php` and `myapp-nginx`, etc.

Copy `.env.example` to `.env`, and change environment keys in `.env` file:

- APP_NAME
- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD
- MYSQL_ROOT_PASSWORD
- REDIS_PASSWORD

## Start Up

With all of your services defined in your `docker-compose` file, you just need to issue a single command to start all of the containers, create the volumes, and set up and connect the networks:

```sh
docker-compose up -d
```

When you run docker-compose up for the first time, it will download all of the necessary Docker images, which might take a while. Once the images are downloaded and stored in your local machine, Compose will create your containers. The `-d` flag daemonizes the process, running your containers in the background.

Once the process is complete, use the following command to list all of the running containers:

```sh
docker ps
```

## For PHP/Laravel Projects

You can use `docker-compose exec` to set the application key for the Laravel application, or other artison command.

```sh
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan config:cache
```

`composer`, PHP dependency manager, is installed in php container, you can run `docker-compose exec` command to access php container, and perform dependency management using `composer` command.

```sh
docker-compose exec php bash
```

Besides, php cotainer also includes some useful tools, such as `vim`, `git`, `wget`, `curl`.

## Clear Log Files

Before we push changes to Github, clear contents of log files first.

On Windows, double click [clear_log.cmd](./clear_log.cmd) and execute it.

On Linux/macOS, execute command as follows:

```sh
sh ./clear_log.sh
```
