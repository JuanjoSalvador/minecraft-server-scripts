#!/bin/bash

BACKUP=world_$(date +%d-%m-%Y_%H%M).tar.gz

echo "Inciando copia de seguridad puntual..."

tar czf backups/$BACKUP paperspigot/world*/*

aws glacier upload-archive --account-id - --vault-name lookatmyhorse --body $BACKUP > /dev/null

echo "Copia de seguridad puntual: $BACKUP realizada."
