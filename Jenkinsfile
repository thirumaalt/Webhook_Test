pipeline {
    agent any

    stages {
        stage('List') {
            steps {
                echo 'Hello World'
                sh 'ls -lrt'
                
            }
        }
        stage('deploy'){
            steps{
                runAnsible()
            }
        }
        
    }
}
