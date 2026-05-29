pipeline {
    agent any

    stages {
        stage('Deploy Docker') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}