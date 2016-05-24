#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció:  start a container and execute a command on it 



# Nom del container
CONT_NAME='mysql_GenLogs'

#ENgegar el container 
docker start $CONT_NAME 
 
# redirigir els logs del fitxer al stdout del container
docker exec $CONT_NAME /bin/bash -c "tail -f /var/log/mysqlGeneral.log > /dev/console" &  
