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

**Prioritat**  
La prioritat és un nombre de 8 bits que indica tant el recurs (tipus d'aparell que ha generat el missatge) com la severitat  
(importància del missatge), nombres de 5 i 3 bits respectivament. Els codis de recurs i severitat els decideix lliurement l'aplicació,  
però se sol seguir una convenció perquè clients i servidors s'entenguen.  

*Codis de recurs*  

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

*Codis de severitat* 

| codi | descripció                            |   |   |   |  
|---|:----------------------------------------:|---|---|---|  
| 0 | Emergència: el sistema està inutilizable |   |   |   |  
| 1 | Alerta: s'ha d'actuar immediatament      |   |   |   |  
| 2 | Crític: condicions crítiques             |   |   |   |  
| 3 | Error: condiciones de error              |   |   |   |  
| 4 | Perill: condicions de perill             |   |   |   |  
| 5 | Avís: normal, però condicions notables   |   |   |   |  
| 6 | Informació: missatges informatius        |   |   |   |  
| 7 | Depuració: missatges de baix nivell      |   |   |   |  

*Càlcul de la prioritat*  
Per a conèixer la prioritat final d'un missatge, s'aplica la següent fórmula:  
`Prioritat = Recurs * 8 + Severitat`  
 
**Capçalera**  
El segon camp d'un missatge syslog, la capçalera, indica tant el temps com el nom de l'ordinador que emet el missatge. Això s'escriu  
en codificació ASCII (7 bits), per tant és text llegible.  
El primer camp, temps, s'escriu en format Mmm dd hh:mm:ss, on Mmm són les inicials del nom del mes en anglès, dd, és el dia del mes,  
i la resta és l'hora. No s'indica l'any.  
Just després ve el nom d'ordinador (hostname), o l'adreça IP si no es coneix el nom. No pot contenir espais, ja que aquest camp acaba quan es troba el següent espai.





