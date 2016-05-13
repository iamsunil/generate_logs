# Docker container amb Mysql Server instal·lat  
Per generar logs massivament utilitzarem un container de docker amb **Mysql Server** i un script de python. El script simplement es connectarà al Mysql Server del container i farà queries que generaran logs. A continuació, us explicaré detalladament tots els passos a fer.  

Per entendre millor el funcionament de script, la generació de logs i el fitxer de log llegiu aquesta [documentció](docker_mysql/README.md).  

## Instruccions 
Abans de començar amb els següents passos, cloneu aquest [repositori](https://github.com/iamsunil/generate_logs.git). Si ja heu fet previament no cal.  
    
		git clone https://github.com/iamsunil/generate_logs.git  

### Pas 1  
Accedir al directori del repositori generat per git clone.  
  
		cd generate_logs  
I després accedim al directori `metode3/docker_mysql`. Aquest pas és important per què el Dockerfile que utilitzarem postriorment per crear el imatge está dins d'aquest.  

		cd metode3/docker_mysql  

### Pas 2  
Crear l'imatge apartir del Dockerfile 

		docker build --rm -t <image_tag>/mysql .
Verificar la creació del imatge.  

		docker images
### Pas 3  
Crear el container apartir del imatge generat previament i posar-lo a la marxa.  

		docker create \
			--name <container_name> \
			--publish=3306:3306 \
			--tty=true \
			--interactive=true \
			<image_tag>/mysql 
			  
### Pas 4  
Engegar el container.
		
		docker start <container_name>

### Pas 5  
Des de altre terminal, accedir al directori `/path/to/generate_logs/metode3`.  

		cd /path/to/generate_logs/metode3  
		
Executar el script [mysql_logGen.py](mysql_logGen.py).  

		./mysql_logGen.py   
### Pas 6  
Connectar al container i verificar la generació de logs.  

		docker exec -it <container_name> /bin/bash  
		
		tail -f /var/log/mysql-slow-queries.log   

