#!/bin/bash
databases=`mysql --user=$MYSQLUSER --password=$MYSQLPASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "phpmyadmin" ]] && [[ "$db" != "mysql" ]] ; then
  	echo "Dumping database: $db"
	mysqldump --user=$MYSQLUSER --password=$MYSQLPASSWORD $db > $BACKUPDIR/backtemp/`date +%Y-%m-%dtime%T`.$db.sql
    fi
done
