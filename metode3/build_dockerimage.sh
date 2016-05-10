#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció:  Un script de bash que crea un imatge a partir de dockerfile.
# I crea un container apartir d'aquest


# Nom a posar al nou imatge 
IMAGE_TAG='cont_mysql'

# Nom a posar al nou container
CONT_NAME='mysql_cont'


# Crear l'imatge apartir del Dockerfile 
docker build --rm -t $IMAGE_TAG/mysql . 

# Crear un container apartir del imatge creat anteriorment 
docker run \
		--name $CONT_NAME \
		--publish=3306:3306 \
		--tty=true \
		--interactive=true \
		$IMAGE_TAG/mysql  \
		/bin/bash


