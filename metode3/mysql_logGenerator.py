#!/usr/bin/python
#-*- coding: utf-8-*-
'''
# consulta sql
# -----------------------------------------------------------------
# Escola del treball de Barcelona
# ASIX Hisi2 M06-ASO UF2NF1-Scripts
# @edt Curs 2015-2015  Gener 2015
# -----------------------------------------------------------------
'''
import sys,time 
from subprocess import Popen,  PIPE

# Executa el pipe/subprocess
command = "mysql --host=192.168.2.50 --port=3306  -uroot -pjupiter instagram"
pipeData = Popen(command,shell=True,stdout=PIPE, stderr=PIPE,stdin=PIPE)
list_tables = ["users","posts","likes","comments","followers"]

while True:
	for table in list_tables:
		selectcmd="delete from likes where id=5060; \n" 
		pipeData.stdin.write(selectcmd)
		selectcmd="update likes set is_deleted=%s; \n" % 1  
		pipeData.stdin.write(selectcmd)
		selectcmd="insert into likes values(5060,current_timestamp,1,2,0) ; \n" 
		pipeData.stdin.write(selectcmd)
		
		time.sleep(1)

pipeData.stdin.write("\q\n")
sys.exit(0)

