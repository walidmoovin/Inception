# check if the database is already running
if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql

	# initialize database, and creates a directory for mariadb data
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi
	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE $WORDPRESS_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 < $tfile
	rm -f $tfile
fi