#!/bin/bash
set -e

echo "🚀 Déploiement..."

docker compose down
docker image prune -af
docker compose build --no-cache
docker compose up -d

echo "✅ Déploiement terminé"