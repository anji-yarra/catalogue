pipeline {
    agent {
        label 'ROBOSHOP'
    }
    environment {
        appVersion = ''
        acc_id = '884057990406'
        project = 'roboshop'
        component = 'catalogue'
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
                    // in this block we get aws credentials
                    withAWS(credentials: 'aws-creds', region: 'us-east-1') {
                        sh """
                            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(acc_id).dkr.ecr.us-east-1.amazonaws.com
                            docker build -t $(acc_id).dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion} .
                            docker push $(acc_id).dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${appVersion}
                        """
                    }
                }
            }
        }
    }
}