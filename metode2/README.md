# Crear un servei utilitzant systemd  
A continuació crearem un servei amb el mecanisme que ens facilita el systemd. Un dels avantatges d'utilitzar aquest mètode és que podem administrar el servei, és a dir, opcions de fer-li `start`, `stop`, `restart`,...  

## Instruccions 
Abans de començar amb següents pasos, suggereixo que cloneu aquest [repositori](https://github.com/iamsunil/generate_logs.git) per treballar còmodament. Si ja heu fet previament no cal.  

		# git clone https://github.com/iamsunil/generate_logs.git
### Pas 1 
Accedir al directori del repositori generat per git clone.  
  
		# cd generate_logs  
		# cd scripts  
	   
Dins d'aquest directori verifiqueu l'existencia del script `logGenerator.sh`, ja que la ruta absoluta d'aquest utilitzarem posteriorment al pas 2.  
		
### Pas 2
#### Creació del dimoni 
Crear al /etc/systemd/system/ un fitxer <deamon_name>.service. Atenció !, el valor del variable `ExecStart=` ha de ser la ruta absoluta del script `logGenerator.sh`.  
  
		# cat <<-END > /etc/systemcd/system/<daemon_name>.service  
		[Unit]  
		Description=Massive log generator   
		[Service]  
		Type=simple  
		PIDFile=/var/run/generatelog.pid  
		ExecStart=/path/to/logGenerator.sh  
		[Install]  
		WantedBy=multi-user.target  
	
### Pas 3 
Engegar el servei creat.  
 
		# systemctl daemon-reload  
		# systemctl start <daemon_name>.service  
		# systemctl status <daemon_name>.service  
		
Un cop posat a marxa el servei, verifiqueu la generació del logs executant:  
  
		# journalctl -f  

*Recordeu, que el dimoni ens proporciona les opciones de fer `start`, `stop`, `restrat`,...*
