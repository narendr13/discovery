pipeline {
    agent any
    
    stages {
        stage('integration') {
            steps {
                script {
                    // Use the checkout step directly
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: '*/master']],
                        userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/narendr13/discovery.git']]
                    ])
                } // Missing closing brace here
            }
        }
        stage('build') {
            steps {
                script {
                    def mvnHome = tool 'Maven'
                    def mvnCmd = "${mvnHome}/bin/mvn"
                    sh "${mvnCmd} -f discovery-server/pom.xml clean install"
                }
            }
        }
    }
}
