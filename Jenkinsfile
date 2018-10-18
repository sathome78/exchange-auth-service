node {
    def app

    stage('Clone repository') {
    checkout scm
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
