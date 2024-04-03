pipeline {
    agent any
    options{
        skipDefaultCheckout()
    }
    parameters {
    string(name: 'TARGET_ENVIRONMENT', defaultValue: 'dev', description: 'Target environment for deployment (e.g., dev, staging, production)')
    booleanParam(name: 'CLEAN_BUILD', defaultValue: true, description: 'Perform a clean build?')
    choice(name: 'BUILD_TYPE', choices: ['debug', 'release'], description: 'Select build type')
    password(name: 'DEPLOYMENT_PASSWORD', defaultValue: '', description: 'Password for deployment')
    }
    stages{
        stage('test'){
            when {
                expression {
                    params.BUILD_TYPE == 'debug'
                }
            }
            steps{
                script {
                    echo 'it is $param.TARGET_ENVIRONMENT'
                }
            }
        }
        stage('two'){
            when {
                expression {
                    params.BUILD_TYPE == 'release'
                }
            }
            steps {
                script {
                    echo 'it is $params.TARGET_ENVIRONMENT'
                }
            }
        }
    }
}
