FROM alpine:latest

RUN apk update && apk add --no-cache \
    php81 php81-fpm php81-opcache php81-mysqli php81-session \
    php81-gd php81-iconv php81-json php81-curl \
    php81-xml php81-phar php81-zip php81-ctype php81-pdo php81-pdo_mysql \
    php81-mbstring php81-soap php81-posix php81-ldap php81-dom

RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

COPY conf/wp-config.php /var/www/html/

COPY tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]