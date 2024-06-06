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
                bat 'docker build -t $DOCKERHUB_USERNAME/jenkinss$BUILD_ID .'
            }
        }
        stage('Push') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                                bat 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                                bat 'docker push $DOCKERHUB_USERNAME/jenkins:$BUILD_ID'
                            }
            }
        }
    }
}