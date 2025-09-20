pipeline {
    agent any

    tools {
        jdk 'JDK 11' // Ensure this is the correct name from your Jenkins tool configuration
    }

    environment {
        // You must create these credentials in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        // Replace with your Docker Hub username
        DOCKERHUB_USERNAME = 'aditya1664'
        // Use a lowercase name for the image
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
                // This step is critical for pushing the image to Docker Hub
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USR', passwordVariable: 'DOCKERHUB_PSW')]) {
                    // Check if a running on a Windows or Linux machine
                    if (isUnix()) {
                        sh "docker login -u ${DOCKERHUB_USR} -p ${DOCKERHUB_PSW}"
                        sh "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    } else {
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
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}
