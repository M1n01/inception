FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    mariadb-client \
    php7.4 \
    php7.4-fpm \
    php7.4-json \
    php7.4-phar \
    php7.4-iconv \
    php7.4-mysqli \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php /var/www/html /var/www/.wp-cli/cache \
    && chown -R www-data:www-data /run/php /var/www/html /var/www/.wp-cli \
    && chmod -R 755 /run/php /var/www/html /var/www/.wp-cli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["docker-entrypoint.sh"]
