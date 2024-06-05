pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('DockerHub')
    }

    stages {
        stage('Build') {
            steps {
                git branch: 'docker-hub-jenkins',
                    credentialsId: '71e7fa01-b3cd-4033-9a78-9f48ffeee941',
                    url: 'https://github.com/OmegaNessy/jenkins-training'
                sh 'docker build -t jenkins:$BUILD_ID .'
            }
        }
        stage('Push') {
            steps{
                script{
                docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                    docker.image('jenkins:${BUILD_ID}').push()
                }
                }

            }
        }
    }
}