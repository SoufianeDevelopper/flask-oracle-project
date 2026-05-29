pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yaml'
    }

    stages {

        stage('Preparation') {
            steps {
                echo "Workspace actuel : ${env.WORKSPACE}"
                sh 'ls -la'          // Vérifie que tous les fichiers sont là
                sh 'chmod +x deploy.sh'  // Rends ton script exécutable si besoin
            }
        }

        stage('Deploy Docker') {
            steps {
                // Exécute le script de déploiement depuis le workspace
                sh './deploy.sh'
            }
        }

        stage('Post-deploy check') {
            steps {
                echo "Vérification rapide : containers Docker"
                sh 'docker ps -a'
            }
        }
    }

    post {
        success {
            echo 'Déploiement terminé avec succès ✅'
        }
        failure {
            echo 'Le déploiement a échoué ❌'
        }
    }
}