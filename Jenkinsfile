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
        sh 'docker -H tcp://localhost:2375 service create -e constraint:node==s92a96xgtcdc0fn797wjikzem 172.50.50.5:5000/authservice:latest'
      }
    }
  }  
}
