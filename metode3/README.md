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
Crear el container apartir del imatge generat previament.  

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
Redirigir els logs de MySQL al standard output del container.
*Atenció!, aquest pas és important per que el log driver del container `jourald` només captura els logs del stdout del container i els envia al jourald del sistema*  

		docker exec -it mysql12_cont /bin/bash -c "tail -f /r/log/mysql-slow-queries.log > /dev/console"  

### Pas 6  
Des de l'altre terminal, accedir al directori `/path/to/generate_logs/metode3`.  

		cd /path/to/generate_logs/metode3  
		
Executar el script [mysql_logGen.py](https://github.com/iamsunil/generate_logs/blob/master/metode3/mysql_logGenerator.py).  

		./mysql_logGenerator.py   
 
### Pas 7  
Verificar si el journald del sistema està rebent els logs del container.  

		# journalctl -fa  
		
*Atenció!, executar aquest ordre com a superusuari*

 
