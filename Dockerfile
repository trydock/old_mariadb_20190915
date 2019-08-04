FROM alpine
LABEL maintainer="TRYDOCK Maintainers <trydock@pulsiot.com>"
RUN echo "Installing Mariadb" && apk add --no-cache mariadb mariadb-client mariadb-server-utils bash vim
EXPOSE 3306
CMD ["/usr/bin/mysqld", "--basedir=/usr", "--datadir=/var/lib/mysql", "--plugin-dir=/usr/lib/mysql/plugin", "--user=mysql", "--pid-file=/run/mysqld/mysqld.pid", "--socket=/run/mysqld/mysqld.sock", "--port=3306"]
