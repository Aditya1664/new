pipeline {
    agent any

    tools {
        jdk 'JDK 11'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKERHUB_USERNAME = 'aditya1664'
        IMAGE_NAME = "docker-pipeline-demo"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USR', passwordVariable: 'DOCKERHUB_PSW')]) {
                    script {
                        // Use a simple if/else block here, though isUnix() would technically work
                        // it's not needed if you're only targeting Windows.
                        // We will use bat for all commands to be safe.
                        bat "docker login -u ${DOCKERHUB_USR} -p ${DOCKERHUB_PSW}"
                        bat "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Docker image build and push succeeded! ✨'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for errors.'
        }
    }
}
