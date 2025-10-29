pipeline {
    agent any

    stages {
        stage('Pull Code from GitHub') {
            steps {
                echo 'Pulling code from GitHub...'
                git branch: 'feature-munaza', url: 'https://github.com/Munaza-Malik/Devops-new.git'
            }
        }

        stage('Install Dependencies & Test') {
            steps {
                echo 'Installing npm dependencies and running tests...'
                sh '''
                npm install
                npm test
                '''
            }
            post {
                always {
                    junit 'results.xml'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t munazamalik/devops-new:latest .'
            }
        }

        stage('Push to Docker Hub') {
            environment {
                DOCKER_HUB_CREDS = credentials('dockerhub-credentials')
            }
            steps {
                echo 'Pushing image to Docker Hub...'
                sh '''
                echo "$DOCKER_HUB_CREDS_PSW" | docker login -u "$DOCKER_HUB_CREDS_USR" --password-stdin
                docker push munazamalik/devops-new:latest
                '''
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed! Check logs for details.'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
