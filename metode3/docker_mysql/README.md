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

### my.cnf  
Aquest és el fitxer de configuració del Mysql Server.
