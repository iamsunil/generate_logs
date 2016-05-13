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


| Log Type               |                         Information Written to Log                         |  
|------------------------|:--------------------------------------------------------------------------:|  
| Error log              | Problems encountered starting, running, or stopping             mysqld     |  
| General query log      | Established client connections and statements received from clients        |  
| Binary log             | Statements that change data (also used for replication)                    |  
| Relay log              | Data changes received from a replication master server                     |  
| Slow query log         | Queries that took more than             long_query_time seconds to execute |  
| DDL log (metadata log) | Metadata operations performed by DDL statements                            |  

### logs
