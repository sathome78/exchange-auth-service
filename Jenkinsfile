pipeline {
  
  agent any
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t roadtomoon/exrates-auth-service:latest .'
      }
    } 
    stage('Deploy container') {
      steps {
        sh 'docker -H tcp://1ip-172-50-10-115:2375 service create roadtomoon/exrates-auth-service:latest'
      }
    }
  }  
}
