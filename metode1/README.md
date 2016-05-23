# Generació massiva de logs diversos amb un script de bash  
Aquest mètode consisteix en generar logs massivament apartir d'un script de bash que simplement utilitza l'ordre `logger` del sistema amb unes opcions especifiques.  

## Instruccions  
### Pas 1  
Descarregueu el script [logGenerator.sh](https://github.com/iamsunil/generate_logs/blob/master/metode1/logGenerator.sh).  

### Pas 2 
Executar el script.  

		# chmod +x loggenerator.sh  
		# ./logGenerator.sh  

### Pas 3 
Verificar si els logs s'estén generant correctament.  

		# journalctl -f
