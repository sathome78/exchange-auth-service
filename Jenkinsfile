pipeline {
  agent none
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
      agent any
      steps {
        sh 'docker-17 -H tcp://172.50.10.115:2375 service update --image roadtomoon/exrates-auth-service:latest'
      }
    }
  }
}
