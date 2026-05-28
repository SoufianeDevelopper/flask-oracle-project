pipeline {
    agent any

    stages {

        stage('Deploy Docker') {

            steps {

                sh '''
                cd /home/admin/flask_oracle_project
                ./deploy.sh
                '''

            }
        }
    }
}
