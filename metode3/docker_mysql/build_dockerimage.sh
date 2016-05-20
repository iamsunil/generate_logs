#!/bin/bash
# Autor: Sunil Shrestha 
# Curs: ASIX 
# Centre: Escola Del Treball
# Descripció:  Un script de bash que crea un imatge a partir de dockerfile.



# Nom a posar al nou imatge 
IMAGE_TAG='projecte/mysql'

# Crear l'imatge apartir del Dockerfile 
docker build --rm -t $IMAGE_TAG/mysql . 

