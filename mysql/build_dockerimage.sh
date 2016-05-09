#!/bin/bash
#

IMAGE_TAG='cont_mysql'
CONT_NAME='mysql_cont'


# Crear l'imatge apartir del Dockerfile 
docker build --rm -t $IMAGE_TAG/mysql . 

# Crear un container apartir del imatge creat anteriorment 
docker run \
		--name $CONT_NAME \
		--publish=3306:3306 \
		--tty=true \
		--interactive=true \
		sunilshrestha/project_mysql  \
		/bin/bash


