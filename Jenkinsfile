pipeline {
    agent any

    tools {
        // This references the JDK installation you configured in Jenkins.
        jdk 'JDK 11'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Jenkins automatically clones the repo where it finds the Jenkinsfile.
                echo 'Cloning the repository from GitHub...'
            }
        }

        stage('Compile') {
            steps {
                echo 'Compiling the Java application...'
                // Use the 'javac' command to compile the Main.java file.
                sh 'javac Main.java'
            }
        }

        stage('Run Application') {
            steps {
                echo 'Running the Java application...'
                // Use the 'java' command to run the compiled class file.
                sh 'java Main'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up the workspace...'
                // Remove the generated .class file after the run is complete.
                sh 'rm Main.class'
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
