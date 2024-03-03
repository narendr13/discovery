pipeline{
    agent {
        node{
        label 'king'
    }
    }
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
    }
    post {
        success {
            script{
            sh "cp /home/ubuntu/workspace/sample/discovery-server/target/*SNAPSHOT.jar /opt/tomcat/webapps"
            }
        }
    }
}
