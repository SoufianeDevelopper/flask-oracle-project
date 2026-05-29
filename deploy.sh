#!/bin/bash

echo "🚀 Déploiement..."

# PAS de cd vers /home/admin !
# Jenkins est déjà dans le workspace contenant tout le projet

docker compose down
docker compose up -d --build
docker image prune -f

echo "✅ Déploiement terminé"