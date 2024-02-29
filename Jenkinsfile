pipeline {
    agent any
    
    stages {
        stage('integration') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/narendr13/discovery.git']])

            }
        }
        stage('build'){
            steps{
                script{
                    def mvnHome = tool 'Maven'
                    def mvnCmd = "${mvnHome}/bin/mvn"
                    sh "${mvnCmd} -f discovery-server/pom.xml clean install"
                }

            }
        }
    }
}
}
