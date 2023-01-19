pipeline {
    agent any
  
     //create dockerhub credential in github with your dockerhub Username and Password/Token
    environment {
      DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/adeoyedewale/Backend.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                //sh 'npm run build'
            }
        }
	    
        stage('Dockerize') {
            steps {
                sh "docker build -t febfun/app:${BUILD_NUMBER} ."
            }
        }
        //stage('Publish') {
        //    steps {
         //       sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
         //       sh "docker tag your-nodejs-app $DOCKER_USERNAME/your-nodejs-app:$BUILD_NUMBER"
         //       sh "docker push $DOCKER_USERNAME/your-nodejs-app:$BUILD_NUMBER"
            //}
        stage('Login') {
		
              steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username febfun --password-stdin'    
              }
		    }

        stage('Push') {

              steps {
                 sh 'docker push febfun/app:${BUILD_NUMBER}'
              }
        }
		}
	
    post {
        always {
	cleanWs()
      	sh 'docker logout'
        }
   }
}
