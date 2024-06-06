pipeline {
    agent any
    environment {
        NAME = 'myapp'
        VERSION = "${env.BUILD_ID}-${env.GIT_COMMIT}"
        IMAGE = "${NAME}:${VERSION}"
    }

    stages {
        stage('Build') {
            steps {
                bat "docker build -t omeganessy/$IMAGE ."

            }
        }
        stage('Push') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                                bat "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                                bat "docker push $DOCKERHUB_USERNAME/${IMAGE}"
                            }
            }
        }
    }
}