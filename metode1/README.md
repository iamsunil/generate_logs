# Generació massiva de logs diversos amb un script de bash  
Aquest mètode consisteix en utilitzar un script de bash que generiï logs massivament fent servir simplement l'ordre `logger` del sistema amb unes opcions especifiques.  

## Instruccions  
### Pas 1  
Descarregueu el script [logGenerator.sh](logGenerator.sh).  

### Pas 2 
Executar el script.  

		# chmod +x loggenerator.sh  
		# ./logGenerator.sh  

### Pas 3 
Verificar si els logs s'esten generant correctament.  

		# journalctl -f
