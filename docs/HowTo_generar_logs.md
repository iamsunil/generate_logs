# Generació massiva de logs diversos  
**Autor:** Sunil Shrestha  	
**Curs:** ASIX  
**Centre:** Escola Del Treball  
**Títol del projecte:** Generació massiva de logs diversos

## Introducció 

El meu projecte consisteix en **Generació massiva de logs diversos**, és a dir, 
generar grans volums de logs, de diferents tipus utilitzant algunes eines del sistema o serveis.  
Aquest és un projecte al servei dels meus companys per facilitar-les la generació massiva de logs en els seus projectes.  

Per realitzar aquesta tasca utilitzaré les següents eïnes:  

* Un equip amb GNU Linux (fedora 20)
* Docker 
* MySQL Server
* Python  
* Bash 


## Conceptes bàsiques 

### Syslog  

Syslog és un estàndard utilitzat per la generació, el processament 
i el transport dels logs del sistema. Els missatges de syslog normalment s'envien via **UDP** en text pla pel port 514. 
Però, algunes implementacions del servidor, com **syslog-ng** permeten utilitzar **TCP**, 
i també ofereixen Stunnel perquè les dades viatgin xifrats mitjançant **SSL/TLS**.  

#### Estructura del misstage   
La estructura dels missatges generat pel syslog esten compost per tres parts.  

* Prioritat
* Capçalera  
* Text  

**Prioritat**  

La prioritat és un nombre de 8 bits que indica tant el recurs (tipus d'aparell que ha generat el missatge) com la severitat (importància del missatge), nombres de 5 i 3 bits respectivament.  
Els codis de recurs i severitat els decideix lliurement l'aplicació, però se sol seguir una convenció perquè clients i servidors s'entenguen.  

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

| codi | descripció                            |  
|---|:----------------------------------------:|  
| 0 | Emergència: el sistema està inutilizable |  
| 1 | Alerta: s'ha d'actuar immediatament      |  
| 2 | Crític: condicions crítiques             |  
| 3 | Error: condiciones de error              |  
| 4 | Perill: condicions de perill             |  
| 5 | Avís: normal, però condicions notables   |  
| 6 | Informació: missatges informatius        |  
| 7 | Depuració: missatges de baix nivell      |  

*Càlcul de la prioritat*  
Per a conèixer la prioritat final d'un missatge, s'aplica la següent fórmula:  
`Prioritat = Recurs * 8 + Severitat`  
 
**Capçalera**  

El segon camp d'un missatge syslog, la capçalera, indica tant el temps com el nom de 
l'ordinador que emet el missatge. Això s'escriu en codificació ASCII (7 bits).  
El primer camp, temps, s'escriu en format Mmm dd hh:mm:ss, on Mmm són les inicials 
del nom del mes en anglès, dd, és el dia del mes,i la resta és l'hora. No s'indica l'any. 
Just després ve el nom d'ordinador (hostname), o l'adreça IP si no es coneix el nom. 
No pot contenir espais, ja que aquest camp acaba quan es troba el següent espai.  

**Text**  

Aquest inclourà informació sobre el procés que ha generat l'avís, normalment al principi
 (en els primers 32 caràcters) i acabat per un caràcter no alfanumèric (com un espai, ":" o "["). Després, 
 ve el contingut real del missatge, sense cap caràcter especial.

### Systemd

Systemd és un conjunt de dimonis d'administració dels sistemes, llibreries i eïnes 
per interactuar amb el nucli del sistema operativo **GNU/Linux**. Aquest va ser desenvolupat per 
substituir l'antic sistema d'arrencada d'inici (init). És el procés que s'executa en l'espai d'usuari, 
per tant, és el procés pare de tots els processos fills de l'espai usuari. Systemd està 
dissenyat per proveir un millor entorn de treball per a expressar les dependències del 
servei, permet fer més feina paral·lelament a l'inici del sistema i reduir la sobrecàrrega de la shell.

Aquest té el seu propi sistema de *logging* anomenada  **Journal**. Per tant, l'execució d'un dimoni **syslog** ja no és necessària. 
Per defecte, el systemd emmagatzema els logs a ***/var/log/journal/*** i per consultar-los utilitzarem l'eïna `journalctl`. 


###  Journald
 
Journald és un servei del sistema per recollir i emmagatzemar dades de logs,
introduïdes amb systemd. Això, fa que sigui més fàcil per als administradors de 
sistemes per trobar informació interessant i rellevant entre una quantitat enorme de logs.  
 

### Logs 

Són registres d'activitats d'un sistema, que generalment responen a les següents 5 W.

1. Who
2. What
3. When
4. Where
5. Why  

## Generació de logs diversos massivament

Per generar els logs diversos massivament utilizaré els següents mètodes:

* Mètode 1: Bash script 
* Mètode 2: Systemd service
* Mètode 3: Docker  

### Requirements 

* Un equip amb GNU Linux (fedora 20)
* Docker 
* MySQL Server
* Python  
* Bash 

### Preparació del entorn de treball 

És molt important tenir un entorn de treball adequat per treballar fàcilment i còmodament. Per tant, cloneu aquest [repositori](https://github.com/iamsunil/generate_logs.git).

		# git clone https://github.com/iamsunil/generate_logs.git

### Mètode 1 

Aquest mètode consisteix en generar logs massivament apartir d'un script de bash que simplement utilitza l'ordre `logger` del sistema amb unes opcions especifiques.  

#### Instruccions  
##### Pas 1  
Accedir al directori del repositori generat per git clone.  
  
		cd generate_logs  

I després al directori metode1, on està el script per generar logs.

		cd metode1 

##### Pas 2 
Executar el script.  

		 chmod +x loggenerator.sh  
		./logGenerator.sh  

##### Pas 3 
Verificar com a `superusuari` si els logs s'esten generant correctament.  

		journalctl -f

### Mètode 2 

Aquest mètode consisteix en crear un servei amb el mecanisme que ens facilita el systemd.
El servei simplement utilitzarà el script del mètode 1, és a dir, en arrencar aquest servei, 
s'executarà aquell script i començarà a generar logs massivament fins que li aturem. Un dels avantatges d'utilitzar aquest
mètode és que podem administrar el servei, és a dir,  fer-li `start`, `stop`, `restart`,...  

#### Instruccions 
##### Pas 1 
Accedir al directori /path/to/generate_logs/metode1.  
  
		cd /path/to/generate_logs/metode1 
	   
Dins d'aquest directori verifiqueu l'existencia del script `logGenerator.sh`, ja que la ruta absoluta d'aquest utilitzarem posteriorment al pas 2.  

##### Pas 2
###### Creació del dimoni 
Crear al /etc/systemd/system/ un fitxer <deamon_name>.service. Atenció !, el valor del variable `ExecStart=` ha de ser la ruta absoluta del script `logGenerator.sh`.  
  
		# cat <<-END > /etc/systemd/system/<daemon_name>.service  
		[Unit]  
		Description=Massive log generator   
		[Service]  
		Type=simple  
		PIDFile=/var/run/generatelog.pid  
		ExecStart=/path/to/logGenerator.sh  
		[Install]  
		WantedBy=multi-user.target  
		END  

***`Nota`***  
El Script `logGenerator.sh` ha de tenir els permissos apropiats. Aquest ha de ser accescible pel `systemd`.
 
##### Pas 3 
Engegar el servei creat.  
 
		# systemctl daemon-reload  
		# systemctl start <daemon_name>.service  
		# systemctl status <daemon_name>.service  

Un cop posat a marxa el servei, verifiqueu la generació del logs executant:  
  
		# journalctl -f  

*Recordeu, el dimoni ens proporciona les opciones de fer `start`, `stop`, `restrat`,...*


### Mètode 3

Per generar els logs massivament utilitzarem un container de docker amb **Mysql Server** instal·lat i un script de python. 
El script simplement es connectarà al Mysql Server del container i farà queries que generaran logs. 
A continuació, us explicaré detalladament tots els passos a fer.  

Per entendre millor la creació del container, la generació de logs, el fitxer de log 
i les configuracions del Mysql Server llegiu aquesta [documentació](https://github.com/iamsunil/generate_logs/blob/master/metode3/docker_mysql/README.md).  

#### Instruccions 
##### Pas 1  
Accedir al directori del repositori generat per git clone.  
  
		cd generate_logs  
I després accedim al directori `metode3/docker_mysql`. Aquest pas és important per què el Dockerfile que utilitzarem postriorment per crear el imatge está dins d'aquest.  

		cd metode3/docker_mysql  

##### Pas 2  
Crear l'imatge apartir del Dockerfile 

		docker build --rm -t <image_tag>/mysql .
		
Alternativa: 

		./build_dockerimage.sh  

Verificar la creació del imatge.  

		docker images  
***Nota***  
El script crea el imatge del nom `projecte/mysql`.  
 
##### Pas 3  
Crear el container apartir del imatge generat previament.  

		docker create \
			--name <container_name> \
			--log-driver=journald \
			--publish=3306:3306 \
			--tty=true \
		    --interactive=true \
			<image_name>   
Alternativa:  

		./create_cont.sh

***Nota***  
El script crea el container del nom `mysql_GenLogs`.

##### Pas 4  
Engegar el container.
		
		docker start <container_name>

##### Pas 5  
*Atenció!, aquest pas és important per que el log driver del container `jourald` només captura els logs del stdout del container i els envia al jourald del sistema*  
Per tant, s'ha de redirigir els logs de MySQL server al standard output del container.   

		docker exec -it <container_name> /bin/bash -c "tail -f /var/log/mysql-slow-queries.log > /dev/console" &  

##### Pas 6  
Des de l'altre terminal, accedir al directori `/path/to/generate_logs/metode3`.  

		cd /path/to/generate_logs/metode3  

Executar el script [mysql_logGen.py](https://github.com/iamsunil/generate_logs/blob/master/metode3/mysql_logGenerator.py).  

		./mysql_logGenerator.py   

***Nota***  
	El host on executeu aquest script ha de tenir el MySQL server instal·lat. 
### Pas 7  
Verificar si el journald del sistema està rebent els logs del container.  

		# journalctl -fa  
		
*Atenció!, executar aquest ordre com a superusuari*.
