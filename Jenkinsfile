pipeline {
    agent any
    
    stages {

      stage('Checkout Source') {
      steps {
        git url:'https://github.com/febfun1/Jenkins-k8-deployment.git', branch:'main'
            }
        }       

        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Package') {
            steps {
                sh 'docker build -t my-nodejs-app .'
                sh 'docker push my-nodejs-app'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl set image deployment/my-nodejs-app my-nodejs-app=my-nodejs-app:latest'
                sh 'kubectl rollout status deployment/my-nodejs-app'
            }
        }
        stage('Rollback') {
            steps {
                sh 'kubectl rollout undo deployment/my-nodejs-app'
                sh 'kubectl rollout status deployment/my-nodejs-app'
            }
        }
    }
}
