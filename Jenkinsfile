pipeline {
  def server = Artifactory.server 'art-1'
  
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
      stage('Docker Build') {
      agent any
      steps {
        def buildInfo = rtDocker.push 'roadtomoon/exrates-auth-service:latest', 'http://172.50.50.9:8081/artifactory/docker-local/'
      }   
    }
    stage('Deploy container') {
      steps {
        sh 'docker -H tcp://172.50.10.115:2375 service update --image roadtomoon/exrates-auth-service:latest'
      }
    }
  }  
}
