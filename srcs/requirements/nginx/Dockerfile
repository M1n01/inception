FROM debian:bullseye-slim

RUN apt update && apt install -y nginx openssl --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

WORKDIR /etc/nginx

COPY ./tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["tools/docker-entrypoint.sh"]

EXPOSE 443
