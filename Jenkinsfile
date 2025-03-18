properties([disableConcurrentBuilds()])
pipeline {
    agent{
        docker { image 'node:22.14.0-alpine3.21' }  
    }
    options{
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr:'10'))
        timestamps()
    }
    stages {
        stage('Build') {
            steps {
                echo "create docker image $BUILD_NUMBER "
                dir ('./'){
                    sh 'docker build -t jcalc:0.$BUILD_NUMBER . '
                }
                
            }
        }
        stage('Run') {
            steps {
                echo "Deploing ..."
                sh 'docker stop jcalc && docker rm jcalc && docker run -d --name jcalc -p 80:80 jcalc:0.$BUILD_NUMBER'                                
            }
        }
    }
}
