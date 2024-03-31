FROM alpine:latest

RUN apk update && apk add --no-cache \
    php7 php7-fpm php7-opcache php7-mysqli php7-session \
    php7-gd php7-iconv php7-json php7-mcrypt php7-curl \
    php7-xml php7-phar php7-zip php7-ctype php7-pdo php7-pdo_mysql \
    php7-mbstring php7-soap php7-posix php7-ldap php7-dom

RUN mkdir /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]
