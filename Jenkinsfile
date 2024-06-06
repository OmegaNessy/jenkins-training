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
                git branch: 'docker-hub-jenkins',
                    credentialsId: '71e7fa01-b3cd-4033-9a78-9f48ffeee941',
                    url: 'https://github.com/OmegaNessy/jenkins-training'
                echo "$IMAGE"
                bat "docker build -t omeganessy/$IMAGE ."

            }
        }
        stage('Push') {
            steps{
                withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                                bat 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                                bat "docker push $DOCKERHUB_USERNAME/${IMAGE}"

                            }
            }
        }
    }
}