pipeline{
    agent any
tools {
  maven 'maven'
}
    stages{
        stage ('checkout'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/narendr13/discovery.git']])
                }
            }
        }
        stage ('king2'){
            steps{
                script{
                    def mvnHome = tool 'maven'
                    def mvnCmd = "${mvnHome}/bin/mvn"
                    sh "${mvnCmd} -f discovery-server/pom.xml clean install"
                }
            }
        }
        stage ('image build'){
            steps {
                // Fetch the Dockerfile from GitHu
                script {
                    sh "docker build -t king ."
            }
        }
    }
    post {
        success {
            script{
            sh "echo jenkins | sudo -S systemctl enable jenkins && sudo cp /var/lib/jenkins/workspace/sample/discovery-server/target/*SNAPSHOT.jar /opt/"
            }
        }
    }
    }
}
