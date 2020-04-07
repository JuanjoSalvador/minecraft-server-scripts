#!/bin/bash

screen -S minecraft -p 0 -X stuff "say EL SERVIDOR SE DESCONECTARÁ EN 10 MINUTOS^M"
sleep 5m

screen -S minecraft -p 0 -X stuff "say EL SERVIDOR SE DESCONECTARÁ EN 5 MINUTOS^M"
sleep 4m

screen -S minecraft -p 0 -X stuff "say EL SERVIDOR SE DESCONECTARÁ EN 1 MINUTO^M"
sleep 50

for i in 10 9 8 7 6 5 4 3 2 1; do
	screen -S minecraft -p 0 -X stuff "say EL SERVIDOR SE DESCONECTARÁ EN ${i} SEGUNDOS^M"
	sleep 1s
done

screen -S minecraft -p 0 -X stuff "stop^M"

BACKUP=world_$(date +%d-%m-%Y).tar.gz

tar czf backups/$BACKUP paperspigot/world*/*

screen -S minecraft -p 0 -X stuff "./start-server.sh^M"

aws glacier upload-archive --account-id - --vault-name lookatmyhorse --body $BACKUP > /dev/null

echo "Copia de seguridad $BACKUP realizada."
