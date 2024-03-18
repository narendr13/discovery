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
            environment{
                dockerImage = "narendra98/king:${BUILD_NUMBER}"  
                REGISTRY_CREDENTIALS = credentials('Docker-cred')
            }
            steps {
                // Fetch the Dockerfile from GitHu
                script {
                    sh "docker build -t ${dockerImage} ."
                     docker.withRegistry('https://index.docker.io/v1/', "Docker-cred") {
                         docker.image(dockerImage).push()
                     }
                    //withDockerRegistry(credentialsId: 'Docker-cred', url: 'http://index.docker.io') {
                        
                    }
            }
        }
        stage ('Deploy'){
            steps{
                    sshagent(['k8s']) {
                        sh "scp -o StrictHostKeyChecking=no service.yaml deployment.yaml ubuntu@34.207.72.157:/home/ubuntu/"
                        sh "ssh ubuntu@34.207.72.157 kubectl apply -f . --validate=false"
                        //script{
                            //try{
                                //sh "ssh ubuntu@34.207.72.157 kubectl apply -f . --validate=false"
                            //}
                            //catch(error){
                                //sh "ssh ubuntu@34.207.72.157 kubectl create -f . --validate=false"
                            //}
                        //}
                    }
            }
        }
        }
        }

