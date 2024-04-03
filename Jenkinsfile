pipeline {
    agent any
    options{
        skipDefaultCheckout()
    }
    parameters {
        choice(name: 'king', choices: ['One','Two']), description: 'hello')
    }
    stages{
        stage('test'){
            when {
                expression {
                    params.king == 'One'
                }
            }
            steps{
                script {
                    echo 'it is one'
                }
            }
        }
        stage('two'){
            when {
                expression {
                    params.king == 'Two'
                }
            }
            steps {
                script {
                    echo 'it is two'
                }
            }
        }
    }
}
