FROM alpine:3.15

# install mariadb
RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client bash

# copy the script to create the database
COPY ./tools/database-launch.sh ./database-launch.sh

# run database launch script
ENTRYPOINT ["bash", "database-launch.sh"]
