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
                dockerImage = "narendra98/myrep"  
                REGISTRY_CREDENTIALS = credentials('Docker-cred')
            }
            steps {
                // Fetch the Dockerfile from GitHu
                script {
                    sh "docker build -t ${dockerImage} ."
                    withDockerRegistry(credentialsId: 'Docker-cred', url: 'https://index.docker.io/v1') {
                        def dockerImage = docker.image("${dockerImage}")
                        dockerImage.push()
            }
        }
        }
        }
    }
}

