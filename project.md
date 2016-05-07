# Generació massiva de logs diversos 

## Introducció 

El meu projecte consisteix en **Generació massiva de logs diversos**, és a dir, generar grans volums de logs, de diferents tipus  
utilitzant algunes eines del sistema o serveis. Aquest és un projecte al servei dels meus companys per facilitar-les la generació  
massiva de logs en els seus projectes.  

Per realitzar aquesta tasca utilitzaré les següents eines:  

* Un equip amb GNU Linux (fedora 20)
* Docker 
* Mysql Server
* Python  
* Bash

## 1. Conceptes bàsiques 

### 1.1 Syslog  

Syslog és un estàndard(protocol, servei) utilitzat per la generació, el processament i el transport de missatges  
de registre del sistema, és a dir, els logs del sistema. Els missatges de syslog normalment s'envien via **UDP** en text pla pel  
port 514. Pero, algunes implementacions del servidor, com **syslog-ng** permeten utilitzar **TCP**, i també ofereixen Stunnel perquè  
les dades viatgin xifrats mitjançant **SSL/TLS**.  

#### 1.1.1 Estructura del misstage   
La estructura dels missatges generat pel syslog esten compost per tres parts :  
`may 07 18:19:52 localhost.localdomain systemd[1]: Started Fingerprint Authentication Daemon.`  

* Prioritat
* Capçalera  
* Text  

##### Prioritat   

| codi  | descripció                         |  
|----|:-------------------------------------------:|  
| 0  | Mensajes del kernel                         | 
| 1  | Mensajes del nivel de usuario               |  
| 2  | Sistema de correo                           |  
| 3  | Demonios de sistema                         |  
| 4  | Seguridad/Autorización                      |  
| 5  | Mensajes generados internamente por syslogd |  
| 6  | Subsistema de impresión                     |  
| 7  | Subsistema de noticias sobre la red         |  
| 8  | Subsistema UUCP                             |  
| 9  | Demonio de reloj                            |  
| 10 | Seguridad/Autorización                      |  
| 11 | Demonio de FTP                              |  
| 12 | Subsistema de NTP                           |  
| 13 | Inspección del registro                     |  
| 14 | Alerta sobre el registro                    |  
| 15 | Demonio de reloj                            |  
| 16 | Uso local 0                                 |  
| 17 | Uso local 1                                 |  
| 18 | Uso local 2                                 |  
| 19 | Uso local 3                                 |  
| 20 | Uso local 4                                 |  
| 21 | Uso local 5                                 |  
| 22 | Uso local 6                                 |  
| 23 | Uso local 7                                 |  





