FROM alpine:3.15

# install mariadb
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

# copy the script to create the database
COPY database-launch.sh /tmp/database-launch.sh

# run database launch script
ENTRYPOINT ["sh", "/tmp/database-launch.sh"]
