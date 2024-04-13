FROM debian:bullseye-slim

RUN apt update && apt install -y php7.4 php7.4-fpm php7.4-mysqli php7.4-phar php7.4-iconv mariadb-client curl && \
    rm -rf /var/lib/apt/lists/*

ENV WP_PATH=/var/www/html/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p $WP_PATH && \
    adduser -u 82 -D -S -G www-data www-data && \
    mkdir -p $WP_PATH && \
    wp core download --path=$WP_PATH --allow-root && \
    chown -R www-data:www-data /var/www/html/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

WORKDIR /var/www/html/wordpress
COPY ./entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
