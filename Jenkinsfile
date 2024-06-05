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
                sh 'docker build -t ${env.BUILD_ID} .'
            }
        }
        stage('Push') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                                sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                                sh 'docker push $BUILD_ID'
                            }
            }
        }
    }
}