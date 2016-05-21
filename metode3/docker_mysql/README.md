# Mysql Dockerfile 


## Descripció dels fitxers 

### [Dockerfile](Dockerfile) 
*Built on : Docker version 1.8.3 Run on: Docker version 1.8.3 Tested on : Docker version 1.8.3*

Aquest fitxer serveix per crear una imatge de docker. Dintre d'aquest és on indicarem com volem la imatge, és a dir, els serveis i eines a instal·lar, les configuracions a fer,... Per entendre millor aquest fitxer al menys s'ha de tenir clar la funció d'aquestes instruccions:

* `FROM`
* `MAINTAINER`
* `ADD`
* `COPY`
* `RUN`
* `CMD`  

### [build_dockerimage.sh](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/build_dockerimage.sh)
És un script que crea una imatge de docker apartir d'un Dockerfile. 

### [config_mysql.sh](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/config_mysql.sh)  
És un simple script de bash per: 

* Inicialitzar MySQL data directori 
* Assignar el password `jupiter` al usuari `root` del mysql server.  
* Crear un base de dades `instagram`.
* Importar dades al base de dades `instagram`
* Concedir tots els permisos al usuari `root`.  

### [create_cont.sh](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/create_cont.sh)
És un script que crea un container apatir de una imatge de docker.

### [dump_insta.sql](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/dump_insta.sql)   
Aquest és un script que crea 5 taules i inserta 5000 registres en cada un d'elles respectant la integritat referencial. Farem un import d'aquest a la base de dades del container.  

### [my.cnf](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/my.cnf)  
Aquest és el fitxer de configuració del Mysql Server. He afegit una sèrie de paràmetres nous, en concret:  

* `general_log=1`: Activa els logs general que per defecte esta desactivat.  
* `general_log_file=/var/log/mysqlGeneral.log`: El valor d'aquest paràmetre serà la ubicació del fitxer on volem guardar tots els logs general.  

Amb aquesta configuració, tots els logs que generi el meu script s'aniran a parar al fitxer indicat al paràmetre `general_log_file`.

###  mysqlGeneral.log
És un fitxer per afegir al `/var/log/` del container. El MySQL Server utilitzarà a aquest per escriure els logs.
