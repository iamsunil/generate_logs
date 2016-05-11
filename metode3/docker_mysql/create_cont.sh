#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció: 



# Nom a posar al nou container
CONT_NAME='mysql12_cont'

# Crear un container apartir del imatge creat anteriorment 
docker create \
		--name $CONT_NAME \
		--log-driver=journald \
		--publish=3306:3306 \
		--tty=true \
		--interactive=true \
		cont12_mysql/mysql  \
		
