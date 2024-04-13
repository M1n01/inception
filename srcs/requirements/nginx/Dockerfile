FROM debian:bullseye-slim

RUN apt update && apt install -y nginx openssl --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=JP/ST=Tokyo/O=42Tokyo/CN=minabe.42.fr" \
    -keyout /etc/nginx/ssl/minabe.42.fr.key \
    -out /etc/nginx/ssl/minabe.42.fr.crt

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
