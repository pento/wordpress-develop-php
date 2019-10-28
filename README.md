# wordpress-develop-php

PHP images for the WordPress local development environment. 

## Supported tags and respective `Dockerfile` links

* [`7.3-fpm`](https://github.com/pento/wordpress-develop-php/blob/7.3-fpm/Dockerfile)
* [`7.2-fpm`](https://github.com/pento/wordpress-develop-php/blob/7.2-fpm/Dockerfile)
* [`7.1-fpm`](https://github.com/pento/wordpress-develop-php/blob/7.1-fpm/Dockerfile)
* [`7.0-fpm`](https://github.com/pento/wordpress-develop-php/blob/7.0-fpm/Dockerfile)
* [`5.6-fpm`](https://github.com/pento/wordpress-develop-php/blob/5.6-fpm/Dockerfile)
* [`5.5-fpm`](https://github.com/pento/wordpress-develop-php/blob/5.5-fpm/Dockerfile)
* [`5.4-fpm`](https://github.com/pento/wordpress-develop-php/blob/5.4-fpm/Dockerfile)
* [`5.3-fpm`](https://github.com/pento/wordpress-develop-php/blob/5.3-fpm/Dockerfile)
* [`5.2-fpm`](https://github.com/pento/wordpress-develop-php/blob/5.2-fpm/Dockerfile)

## Configuration

This image supports XDEBUG by default to enable it, all you have to do is pass the `LOCAL_PHP_XDEBUG` environment variable with `true`.

## How to use this image

### Create a `Dockerfile` in your PHP project

```Dockerfile
FROM wordpressdevelop/php:7.3-fpm
COPY . /var/www/html
```
Then, run the commands to build and run the Docker image:

```bash
$ docker build -t my-wp-app .
$ docker run -it --rm --name my-running-wp-app my-wp-app --env LOCAL_PHP_XDEBUG=true
```

### Create a `docker-compose.yml` file in your PHP project

For larger projects it's easier to create a compose file and mount your files.

```yml
version: "3.7"

services:

  wordpress:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/var/www/html
    environment:
      LOCAL_PHP_XDEBUG: true
    ports:
      - 9000:9000
```
