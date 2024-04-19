FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-gd \
    php7.4-zip \
    php7.4-mysqli \
    php7.4-mysql \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) gd zip mysqli pdo_mysql

CMD ["php-fpm7.4", "-F"]
