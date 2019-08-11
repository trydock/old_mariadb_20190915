FROM alpine
LABEL maintainer="TRYDOCK Maintainers <trydock@pulsiot.com>"
ENV DB_DATA_PATH "/var/lib/mysql"
ENV MYSQL_ROOT_PASSWORD "mariadb_root_password"
ENV MYSQL_DATABASE "main"
ENV MYSQL_USER "mariadb_user"
ENV MYSQL_PASSWORD "mariadb_user_password"
ENV DB_SOCKET_PATH "/run/mysqld"
ENV DB_PORT "3306"
ENV MAX_ALLOWED_PACKET "200M"
RUN echo "Installing Mariadb" && \
    apk add --no-cache mariadb mariadb-client mariadb-server-utils bash vim pwgen
ADD manage.sh /manage.sh
EXPOSE $DB_PORT
RUN chmod 755 /manage.sh
ENTRYPOINT ["/manage.sh"]
