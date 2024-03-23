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
        
        stage ('Deploy'){
            steps{
                    sshagent(['k8s']) {
                        sh "echo hello"
                        //sh "scp -o StrictHostKeyChecking=no service.yaml deployment.yaml ubuntu@100.24.53.137:/home/ubuntu/"
                        //sh "ssh ubuntu@100.24.53.137 kubectl apply -f . --validate=false"
                        //script{
                            //try{
                                //sh "ssh ubuntu@100.24.53.137 kubectl apply -f . --validate=false"
                            //}
                            //catch(error){
                                //sh "ssh ubuntu@100.24.53.137 kubectl create -f . --validate=false"
                            //}
                        //}
                    }
            }
        }
        }
        }

