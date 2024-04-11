FROM debian:bullseye-slim

RUN apt update && apt install -y php7.3 php7.3-fpm php7.3-mysql curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY . /var/www/html

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]
