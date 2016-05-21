# Mysql Dockerfile 


## Descripció dels fitxers 

### [Dockerfile](Dockerfile)  
Aquest fitxer serveix per crear una imatge de docker. Dintre d'aquest és on indicarem com volem la imatge, és a dir, els serveis i eines a instal·lar, les configuracions a fer,... Per entendre millor aquest fitxer al menys s'ha de tenir clar la funció d'aquestes instruccions:
*Built on : Docker version 1.8.3 Run on: Docker version 1.8.3 Tested on : Docker version 1.8.3*

* `FROM`
* `MAINTAINER`
* `ADD`
* `COPY`
* `RUN`
* `CMD`  

### [config_mysql.sh](config_mysql.sh)  
És un simple script de bash per: 

* Inicialitzar MySQL data directori 
* Assignar el password `jupiter` al usuari `root` del mysql server.  
* Crear un base de dades `instagram`.
* Importar dades al base de dades `instagram`
* Concedir tots els permisos al usuari `root`.  

### [dump_insta.sql](dump_insta.sql)   
Aquest és un script que crea 5 taules i inserta 5000 registres en cada un d'elles respectant la integritat referencial. Farem un import d'aquest a la base de dades del container.  

### [my.cnf](my.cnf)  
Aquest és el fitxer de configuració del Mysql Server. He afegit una sèrie de paràmetres nous, en concret:  

* `general_log=1`: Activa els logs general que per defecte esta desactivat.  
* `general_log_file=/var/log/mysqlGeneral.log`: El valor d'aquest paràmetre serà la ubicació del fitxer on volem guardar tots els logs general.  

Amb aquesta configuració,  tots els logs que generi el meu script s'aniran a parar al fitxer indicat al paràmetre `general_log_file`.

