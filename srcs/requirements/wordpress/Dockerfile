# sample dockerfile for wordpress

FROM php:fpm-alpine
RUN docker-php-ext-install mysqli
COPY --from=wordpress:latest /usr/src/wordpress /var/www/html
COPY ./conf/wp-config.php /var/www/html
