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
    }
}