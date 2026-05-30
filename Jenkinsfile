pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/SoufianeDevelopper/flask-oracle-project.git'
            }
        }

        stage('Deploy Docker') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}