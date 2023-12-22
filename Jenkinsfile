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
        stage ('update deployment') {
           steps {
               sh "kubectl apply -f deployment.yaml"
           }            
        } 
              stage ('update image') {
           steps {
               sh "kubectl set image deploy/practice-nj practice-nj=bsanket666/practiceproject:v${env.BUILD_NUMBER}"
           }            
        }
    }
}
