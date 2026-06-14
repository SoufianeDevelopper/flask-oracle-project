#!/bin/bash
echo "=== DÉBUT DU DÉPLOIEMENT AUTOMATIQUE ==="

# 1. Se placer dans le bon dossier
cd /home/admin/flask_oracle_project

# 2. Forcer la récupération du nouveau code depuis GitHub
git fetch --all
git reset --hard origin/main # ou master selon ta branche

# 3. Arrêter les anciens conteneurs
docker compose down

# 4. RECONSTRUIRE SANS CACHE (C'est ça qui met à jour app.py !)
docker compose build --no-cache --pull

# 5. Relancer le projet
docker compose up -d --force-recreate

# 6. Nettoyage
docker image prune -f

echo "=== IP INFRASTRUCTURE MISE À JOUR ! ==="