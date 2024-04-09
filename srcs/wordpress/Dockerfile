FROM debian:bullseye-slim

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends \
		php-fpm \
		php-mysqli \
		mariadb-client \
		curl \
		ca-certificates \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /run/php

ENV WP_PATH=/var/www/html

RUN set -x \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir -p ${WP_PATH} \
	&& wp core download --allow-root --path=${WP_PATH}

COPY ./conf/wp-config.php ${WP_PATH}/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
