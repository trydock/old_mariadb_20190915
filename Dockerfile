FROM alpine
LABEL maintainer="TRYDOCK Maintainers <trydock@pulsiot.com>"
RUN echo "Installing Mariadb" && apk add --no-cache mariadb mariadb-client mariadb-server-utils bash vim
EXPOSE 3306
