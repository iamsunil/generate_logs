#!/bin/bash
# un script de bash que crea un imatge a partir de dockerfile.
# I crea un container apartir d'aquest.

__mysql_config() {
	
	echo "Configuring MySQL server"
	mysql_install_db
	chown -R mysql:mysql /var/lib/mysql
	/usr/bin/mysqld_safe & 
	sleep 10
}

__start_mysql() {
	echo "Running the start_mysql function."
	mysqladmin -u root password jupiter
	mysql -uroot -pjupiter -e "CREATE DATABASE instagram"
	echo "Importing data to database instagram"
	mysql -uroot -pjupiter instagram < /var/tmp/dump_insta.sql
	echo "Granting privileges to MySQL server user: root"
	mysql -uroot -pjupiter -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'jupiter'; FLUSH PRIVILEGES;"
	mysql -uroot -pjupiter -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'jupiter' WITH GRANT OPTION; FLUSH PRIVILEGES;"
	mysql -uroot -pjupiter -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'jupiter' WITH GRANT OPTION; FLUSH PRIVILEGES;"
	killall mysqld
	sleep 10
}

# Call all functions
__mysql_config
__start_mysql
