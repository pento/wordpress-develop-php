FROM php:fpm

# install the PHP extensions we need
RUN set -ex; \
	apt-get update; \
	apt-get -y --no-install-recommends \
		libjpeg-dev \
		libpng-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache zip;
