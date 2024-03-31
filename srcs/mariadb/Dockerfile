FROM alpine:latest

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /run/mysqld && \
    chmod 777 /run/mysqld && \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } > /etc/my.cnf

EXPOSE 3306

COPY tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
