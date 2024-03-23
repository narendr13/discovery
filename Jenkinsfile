pipeline{
    agent any
tools {
  maven 'maven'
}
options {
preserveStashes()
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
                stash includes: '*/', name: 'myFiles'
            }
        }
        stage ('copy'){
            steps{
                script{
                    sh 'cp /var/lib/jenkins/jobs/sample/builds/${BUILD_NUMBER}/**/myFiles.* /var/lib/jenkins/workspace/'
                    unstash 'myFiles' 
                    cleanWs()
                }
            }
        }
        
        }
        }

