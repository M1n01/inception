FROM debian:bullseye-slim

RUN apt update && apt install -y php7.4 php7.4-fpm php7.4-mysql curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY . /var/www/html

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
