FROM alpine
LABEL maintainer="TRYDOCK Maintainers <trydock@pulsiot.com>"
ENV DB_DATA_PATH "/var/lib/mysql"
ENV DB_ROOT_PASS "mariadb_root_password"
ENV DB_USER "mariadb_user"
ENV DB_PASS "mariadb_user_password"
ENV DB_SOCKET_PATH "/run/mysqld"
ENV DB_PORT "3306"
ENV MAX_ALLOWED_PACKET "200M"
RUN echo "Installing Mariadb" && apk add --no-cache mariadb mariadb-client mariadb-server-utils bash vim && mkdir -vp $DB_SOCKET_PATH && chown mysql:mysql $DB_SOCKET_PATH && mysql_install_db --user=mysql --datadir=DB_DATA_PATH
EXPOSE $DB_PORT
CMD ["/usr/bin/mysqld", "--basedir=/usr", "--datadir=$DB_DATA_PATH", "--plugin-dir=/usr/lib/mysql/plugin", "--user=mysql", "--pid-file=$DB_SOCKET_PATH/mysqld.pid", "--socket=$DB_SOCKET_PATH/mysqld.sock", "--port=$DB_PORT"]
