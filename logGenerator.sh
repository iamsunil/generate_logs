#!/bin/bash
# 
facilities='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23'
levels='0 1 2 3 4 5 6 7'

while true
do
	random_message=$(tr -dc "[:alpha:]" < /dev/urandom | head -c 15)
	for fct in $facilities 
	do 
		for lvl in $levels 
		do 
			random_message=$(tr -dc "[:alpha:]" < /dev/urandom | head -c 15)
			logger -p $fct.$lvl $random_message
			sleep 0.1
		done
	done
	
 done
