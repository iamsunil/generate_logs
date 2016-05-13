#!/bin/bash


DELTA='1'

TABLES=(users  likes comments followers)

while true
do
	
	for tab in ${TABLES[@]}
	do
		mysql --host=192.168.1.129 --port=3306  -uroot -pjupiter insta -e "select * from $tab;"
		sleep $DELTA
	done

done

exit 0
