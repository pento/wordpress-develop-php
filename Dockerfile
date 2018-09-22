FROM php:fpm-alpine

# install the PHP extensions we need
RUN set -ex; \
	apk --no-cache add \
		jpeg-dev \
		libpng-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli;
