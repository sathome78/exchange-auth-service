pipeline {
  
  agent any
  
   environment {
     ENVIRONMENT = '${EVN}'
    }
  
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.4'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'printenv'
        sh 'docker build --build-arg ENVIRONMENT -t roadtomoon/exrates-auth-service:latest .'
      }
    } 
    stage('Docker pull') {
      agent any
      steps {
        sh 'docker tag roadtomoon/exrates-auth-service:latest localhost:5000/authservice:latest'
        sh 'docker push localhost:5000/authservice:latest'
      }
    } 
    stage('Deploy container') {
      steps {
        sh 'docker -H tcp://localhost:2375 service update --image localhost:5000/authservice:latest auth-service'
      }
    }
  }  
}
