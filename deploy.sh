echo "======================================"
3🚀 DÉBUT DU DÉPLOIEMENT AUTOMATIQUE
echo "======================================"

# 1. Aller dans le dossier du projet
cd ~/flask_oracle_project

# 2. Récupérer la dernière version du code
git pull origin main

# 3. Supprimer l'ancienne version de l'application obsolète
docker compose down

# 4. Rebuild sans cache pour intégrer les modifs de app.py
docker compose build --no-cache

# 5. Relancer le cluster en arrière-plan
docker compose up -d

# 6. Nettoyage des images intermédiaires suspendues
docker image prune -f

echo "======================================"
echo "✅ INFRASTRUCTURE MISE À JOUR ET ÉQUILIBRÉE !"
echo "======================================"