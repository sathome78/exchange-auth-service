node {
    def app
    def server = Artifactory.server 'art-1'
    
    def downloadSpec = """{
        "files": [
            {
                "pattern": "exrates-auth-service/*.jar",
                "target": "exrates-auth-service/"
            }
         ]
    }"""

    stage('Clone repository') {
    checkout scm
    server.download(downloadSpec)
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("roadtomoon/exrates-auth-service")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    /* stage('Push image') {
        }
    } */
}
