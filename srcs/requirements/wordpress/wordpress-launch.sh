# waiting for database to be ready
while ! mariadb -hmariadb -u$ADMIN -p$PASSWORD $DB_NAME; do
  sleep 3
done

# download wordpress
if [ ! -f "index.php" ]; then
	wp core download 
	wp config create --dbname=$DB_NAME --dbuser=$ADMIN --dbpass=$PASSWORD --dbhost=$DB_HOST
	wp core install --url=https://$URL/wordpress --title=$TITLE --admin_user=$ADMIN --admin_password=$PASSWORD --admin_email=$ADMIN_MAIL
	wp user create $USER $USER_MAIL --role=author --user_pass=$PASSWORD
fi