#!/bin/bash
set -e

mysql_install_db --user=root --datadir=/var/lib/mysql

TEMP_FILE='/tmp/mysql-first-time.sql'
cat > "$TEMP_FILE" <<-EOSQL
	DELETE FROM mysql.user ;
	CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
	GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
	DROP DATABASE IF EXISTS test ;
	FLUSH PRIVILEGES ;
EOSQL

set -- "$@" --init-file="$TEMP_FILE"

chown -R mysql:mysql /var/lib/mysql
