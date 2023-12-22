pipeline {
    agent any
    stages {
        stage('checkout git branch') {
            steps {
                checkout scm
            }
        }
        stage('docker build image') {
            steps {
                sh "docker build -t bsanket666/practiceproject:v${env.BUILD_NUMBER} -f Dockerfile ."
            }
        }
        stage ('docker push to image repository') {
            steps {
                sh "docker push bsanket666/practiceproject:v${env.BUILD_NUMBER}"
            }
        }
        stage ('update helm release') {
           steps {
               sh "kubectl apply -f deployment.yaml"
           }            
        }  
    }
}
