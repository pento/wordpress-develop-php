FROM php:7.3-fpm

##########################################################################
#
# WARNING: This file was generated by update.php. Do not edit it directly.
#
#

# install the PHP extensions we need
RUN set -ex; \
	\
	apt-get update; \
	\
	apt-get install -y --no-install-recommends \
		libjpeg-dev \
		libpng-dev \
		libzip-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd opcache mysqli zip; \
	\
	pecl install xdebug-2.7.2;

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "php", "-a" ]
