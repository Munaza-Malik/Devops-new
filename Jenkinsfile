pipeline {
    agent {
        docker {
            image 'node:20'   // official Node.js image
            args '-u root:root' // run as root to allow docker commands
        }
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = "munazamalik/devops-new" // change to your Docker Hub repo
    }

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
                sh 'npm install'
                sh 'npm test'
                junit 'results.xml'  // publish test results
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully! Docker image pushed to Docker Hub.'
        }
        failure {
            echo 'Pipeline failed! Check logs for details.'
        }
    }
}
