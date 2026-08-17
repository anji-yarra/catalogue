pipeline {
    agent {
        label 'ROBOSHOP'
    }
    stages {
        stage('Read Version') {
            steps {
                script {
                    def packageJson = readJSON file: 'package.json'
                    // Extract the version property
                    appVersion = packageJson.version
                    echo "The application version is: ${appVersion}"
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    sh """
                        npm install
                    """
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh """
                        docker build -t catalogue:${appVersion} .
                    """
                }
            }
        }
    }
}