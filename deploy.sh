#!/bin/bash

echo "🚀 Déploiement..."

cd /home/admin/flask_oracle_project

docker compose down

docker compose up -d --build

docker image prune -f

echo "✅ Déploiement terminé"
