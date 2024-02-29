pipeline {
    agent {
        docker {image 'maven:latest'}
        args '-v $HOME/.m2:/root/.m2'
    }
    tools {
        // Define the Maven tool
        maven 'maven'
    }
    
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
                    sh "mvn -f discovery-server/pom.xml clean install"
                }
            }
        }
    }
}
