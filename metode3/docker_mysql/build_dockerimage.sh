#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció:  start a container and execute a command on it 



# Nom a posar al nou imatge 
IMAGE_TAG='projecte/mysql'

# Crear l'imatge apartir del Dockerfile 
docker build --rm -t $IMAGE_TAG . 

