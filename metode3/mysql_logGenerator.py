#!/usr/bin/python
#-*- coding: utf-8-*-
# Sunil Shrestha 
# ASIX
# Projecte 2016
# consulta sql

import sys,time 
from subprocess import Popen,  PIPE

# ip del host on volem connectar
HOST="192.168.2.50"

# Executa el pipe/subprocess
command = "mysql --host=%s --port=3306  -uroot -pjupiter instagram" % HOST
pipeData = Popen(command,shell=True,stdout=PIPE, stderr=PIPE,stdin=PIPE)


while True:
	
	selectcmd="delete from likes where id=5060; \n" 
	pipeData.stdin.write(selectcmd)
	selectcmd="update likes set is_deleted=%s; \n" % 1  
	pipeData.stdin.write(selectcmd)
	selectcmd="insert into likes values(5060,current_timestamp,1,2,0) ; \n" 
	pipeData.stdin.write(selectcmd)
	
	time.sleep(1)

pipeData.stdin.write("\q\n")
sys.exit(0)

	
