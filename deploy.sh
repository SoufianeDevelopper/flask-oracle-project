#!/bin/bash
echo "🚀 Déploiement..."

# Arrêter anciens containers
docker compose down

# Rebuild l’image avec le nouveau code
docker compose build

# Lancer en background
docker compose up -d

# Nettoyer les images inutilisées
docker image prune -f

echo "✅ Déploiement terminé"