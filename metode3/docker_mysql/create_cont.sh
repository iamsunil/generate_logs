#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció: Un script que crear un container amb les opcions especifiques apartir d'un imatge de docker.



# Nom a posar al nou container
CONT_NAME='mysql_GenLogs'

# Crear un container apartir d'un imatge del docker
docker create \
		--name $CONT_NAME \
		--log-driver=journald \
		--publish=3306:3306 \
		--tty=true \
		--interactive=true \
		projecte/mysql  \
		
