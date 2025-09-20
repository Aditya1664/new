pipeline {
    agent any

    tools {
        jdk 'JDK 11' // Ensure this is the correct name from your Jenkins tool configuration
    }

    environment {
        // You must have configured these credentials in Jenkins
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        // Replace with your Docker Hub username
        DOCKERHUB_USERNAME = 'your-dockerhub-username'
        // Use a new, lowercase name for the Java image
        IMAGE_NAME = "java-datetime-app"
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
