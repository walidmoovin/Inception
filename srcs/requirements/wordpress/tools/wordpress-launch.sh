if [ ! -d "var/www/html/wordpress" ]; then
	curl -O https://wordpress.org/latest.tar.gz  && mkdir -p /var/www/html && tar -xf latest.tar.gz --directory=/var/www/html
	rm -rf latest.tar.gz
fi