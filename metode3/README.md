# Docker container amb Mysql Server instal·lat  
Per generar logs massivament utilitzarem un container de docker amb **Mysql Server** i un script de python. El script simplement es connectarà al Mysql Server del container i farà queries que generaran logs. A continuació, us explicaré detalladament tots els passos a fer.  

Per entendre millor el funcionament de script, la generació de logs i el fitxer de log llegiu aquesta [documentció](docker_mysql/README.md).  

## Instruccions 
Abans de començar amb següents pasos, cloneu aquest [repositori](https://github.com/iamsunil/generate_logs.git). Si ja heu fet previament no cal.  
    
		# git clone https://github.com/iamsunil/generate_logs.git  

### Pas 1  
Accedir al directori del repositori generat per git clone.  
  
		# cd generate_logs  
I després accedim al directori apropiat. Aquest pas és important per què hi ha el Dockerfile que utilitzarem postriorment per crear el imatge.  

		# cd metode3/docker_mysql  

### Pas 2  
Crear l'imatge apartir del Dockerfile 

		# docker build --rm -t <image_tag>/mysql .
Verificar la creació del imatge.  

		# docker images
### Pas 3  
Crear el container apartir del imatge generat previament i posar-ho a la marxa.  

		# docker run \
			--name <container_name> \
			--publish=3306:3306 \
			--tty=true \
			--interactive=true \
			<image_tag>/mysql \
			/bin/bash  
### Pas 4  
Engegar el Mysql Server. 
		
		# /usr/bin/mysqld_safe &  
Comprovar si ha generat un procés o no.

		# ps ax  
Deixem el container i mysql server funcionant.    
### Pas 5  
Des de altre terminal, accedir al directori /path/to/generate_logs/metode3.  

		# cd /path/to/generate_logs/metode3  
		
Executar el script [mysql_logGen.py](mysql_logGen.py).  
		# ./mysql_logGen.py  
### Pas 6  
Tornar al container i verifacar la generació de logs.  

		# tail -f /var/log/queries.log   

