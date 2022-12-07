FROM alpine:3.15

# install all wordpress requirements, and wp-cli, a tool to manage wordpress installations
RUN apk update && apk upgrade && apk add --no-cache curl mariadb-client php7 php7-fpm php7-phar php7-json php7-mysqli php7-curl php7-iconv php7-pecl-mailparse
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy wordpress config files H->C
RUN mkdir -p /etc/php7/php-fpm.d/

# COPY www.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# copy wordpress launch script H->C
COPY wordpress-launch.sh /tmp/wordpress-launch.sh

WORKDIR /var/www/html/wordpress

# run wordpress launch script
ENTRYPOINT ["sh", "/tmp/wordpress-launch.sh"]