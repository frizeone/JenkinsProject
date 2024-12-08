pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Set Permissions') {
            steps {
                sh 'chmod +x build.sh run-tests.sh deploy.sh mvnw'
            }
        }
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
