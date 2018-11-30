pipeline {
  
  agent any
  
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.4'
        }
      }
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Upload to Atrtifactory') {
           steps {
              script { 
                 def server = Artifactory.server 'art-1'
                 def uploadSpec = """{
                    "files": [{
                       "pattern": "target/authorization-service.jar",
                       "target": "exrates-auth-service/"
                    }]
                 }"""

                 server.upload(uploadSpec) 
               }
            }
        }
    stage('Docker Build') {
      agent any     
      steps {
        sh 'docker build --build-arg ENVIRONMENT -t roadtomoon/exrates-auth-service:$ENVIRONMENT .'
      }
    } 
    stage('Docker pull') {
      agent any
      steps {
        sh 'docker tag roadtomoon/exrates-auth-service:$ENVIRONMENT localhost:5000/authservice:$ENVIRONMENT'
        sh 'docker push localhost:5000/authservice:$ENVIRONMENT'
      }
    } 
    stage('Deploy container') {
      steps {
        sh 'docker -H tcp://localhost:2375 service update --image localhost:5000/authservice:$ENVIRONMENT $ENVIRONMENT-auth-service'
      }
    }
  }  
}
