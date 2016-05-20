# Mysql Dockerfile 

*Built on : Docker version 1.9.1 Run on: Docker version 1.9.1 Tested on : Docker version 1.9.1*

## Descripció dels fitxers 

### [Dockerfile](Dockerfile)  
Aquest fitxer serveix per crear un imatge de docker. Dintre d'aquest és on indicarem com volem el imatge, és a dir, els serveis i eines a instal·lar, les configuracions a fer,... Per entendre millor aquest fitxer al menys s'ha de tenir clar la funció d'aquestes instrucions:

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
Aquest és un script que crea 5 taules i inserta 5000 registres en cada un d'elles respectant la integritat referencial. Farem un import d'auest a la base de dades del container.  

### [my.cnf](my.cnf)  
Aquest és el fitxer de configuració del Mysql Server. He afegit una sèrie de paràmetres nous, en concret:  

* `slow_query_log=on`: Activa els logs dels queries lents, per defecte esta desactivat.  
* `long_query_time=0.005`: El valor es representa en segons. Qualsevol consulta que trigui més d'aquest valor en executar-se es valorarà com *"slow query"*.  
* `slow_query_log_file='/var/log/mysql-slow-queries.log'`: El valor d'aquest paràmetre serà la ubicació del fitxer on volem guardar tots els queries lents.  

Amb aquesta configuració,  tots els logs que generiï el meu script s'aniran a parar al fitxer indicat al `slow_query_log_file`.


# a̶s̶d̶ ̶a̶s̶d̶j̶k̶ ̶a̶s̶d̶
