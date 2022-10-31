FROM alpine:3.15

# install all wordpress requirements
RUN apk update && apk upgrade && apk add --no-cache curl mariadb-client php7 php7-fpm php7-phar php7-json php7-mysqli php7-curl php7-iconv php7-pecl-mailparse

# copy wordpress config files H->C
COPY wp-conf.php .
COPY www.conf /etc/php7/php-fpm.d/www.conf

# copy wordpress launch script H->C
COPY wordpress-launch.sh /tmp/wordpress-launch.sh

# run wordpress launch script
ENTRYPOINT ["sh", "/tmp/wordpress-launch.sh"]