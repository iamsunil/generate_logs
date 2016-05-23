# Docker container amb Mysql Server instal·lat  
Per generar logs massivament utilitzarem un container de docker amb **Mysql Server** i un script de python. El script simplement es connectarà al Mysql Server del container i farà queries que generaran logs. A continuació, us explicaré detalladament tots els passos a fer.  

Per entendre millor la creació del container, la generació de logs, el fitxer de log 
i les configuracions del Mysql Server llegiu aquesta [documentació](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/README.md). 

## Instruccions 
Abans de començar amb els següents passos, cloneu aquest [repositori](https://github.com/iamsunil/generate_logs.git). Si ja heu fet prèviament no cal.  
    
		git clone https://github.com/iamsunil/generate_logs.git  

### Pas 1  
Accedir al directori del repositori generat per git clone.  
  
		cd generate_logs  
I després accedim al directori `metode3/docker_mysql`. Aquest pas és important per què el Dockerfile que utilitzarem posteriorment per crear la imatge està dins d'aquest.  

		cd metode3/docker_mysql  

### Pas 2  
Crear la imatge apartir del Dockerfile 

		docker build --rm -t <image_tag>/mysql .
		
Alternativa: 
	
		./build_dockerimage.sh  
		
Verificar la creació de la imatge.  

		docker images  
***`Nota`***  
El script crea la imatge del nom `projecte/mysql`.  
 
### Pas 3  
Crear el container apartir de la imatge generat prèviament  

		docker create \
			--name <container_name> \
			--log-driver=journald \
			--publish=3306:3306 \
			--tty=true \
		    --interactive=true \
			<image_name>   
Alternativa:  

		./create_cont.sh

***`Nota`***  
El script crea el container del nom `mysql_GenLogs`.

### Pas 4  
Engegar el container.
		
		docker start <container_name>

### Pas 5  
*Atenció!, aquest pas és important per que el log driver del container `jourald` només captura els logs del stdout del container i els envia al jourald del sistema*  
Per tant, s'ha de redirigir els logs de MySQL server al estàndard output del container.   

		docker exec -it <container_name> /bin/bash -c "tail -f /var/log/mysqlGeneral.log > /dev/console" &  

### Pas 6  
Des de l'altre terminal, accedir al directori `/path/to/generate_logs/metode3`.  

		cd /path/to/generate_logs/metode3  
		
Executar el script [mysql_logGenerator.py](https://github.com/iamsunil/generate_logs/blob/master/metode3/mysql_logGenerator.py).  

		./mysql_logGenerator.py   

***`Nota`***  
El host on executeu aquest script ha de tenir el MySQL server instal·lat. A més a més, dins d'aquest script heu de 
cambiar el valor de la variable `HOST`.  El valor ha de ser el `ip` del host que tingui el container.
	
### Pas 7  
Verificar si el journald del sistema està rebent els logs del container.  

		# journalctl -fa  

*Atenció!, executar aquest ordre com a superusuari*.

 
