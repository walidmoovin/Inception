FROM alpine:3.15

# install nginx and openssl
RUN apk update && apk upgrade && apk add --no-cache nginx openssl
RUN mkdir /etc/nginx/ssl

# request a certificate of size 2048 bits and validity of 365 days, then puts it in /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/CN=best-inception"

# copy nginx config from host to container
COPY nginx.conf /etc/nginx/http.d/default.conf

# daemon off is for running nginx in foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]