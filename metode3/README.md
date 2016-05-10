# Docker container amb Mysql Server instal·lat  
Per generar logs massivament utilitzarem un container de docker amb **Mysql Server** i un script de python. El script simplement es connectarà al Mysql Server del container i farà queries que generaran logs. A continuació, us explicaré tot el pasos a fer detalladament.  

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

		# docker build --rm -t <image_tag>/mysql --file=Dockerfile  
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



Dins d'aquest directori verifiqueu l'existencia del script `logGenerator.sh`, ja que la ruta absoluta d'aquest utilitzarem posteriorment al pas 2.  
