pipeline {
    agent any

    tools {
        jdk 'JDK 11' // Ensure this is the correct name configured in Jenkins
    }

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling the Java application...'
                // Use 'bat' for Windows command prompt
                bat 'javac Main.java'
            }
        }

        stage('Run Application') {
            steps {
                echo 'Running the Java application...'
                // Use 'bat' for Windows command prompt
                bat 'java Main'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up the workspace...'
                // Use 'bat' with the 'del' command for file deletion on Windows
                bat 'del Main.class'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Build and run succeeded! ✨'
        }
        failure {
            echo 'Build failed. Please check the logs.'
        }
    }
}
