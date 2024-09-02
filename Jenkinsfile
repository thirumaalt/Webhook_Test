pipeline {
    agent any

    stages {
        stage('Test Parameter') {
            steps {
                echo "Parameter 'servers' is: ${params.servers}"
                echo "Environment variable 'SERVERS' is: ${env.SERVERS}"
            }
        }
    }
}
