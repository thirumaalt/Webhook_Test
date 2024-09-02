pipeline {
    agent any

    environment {
        SERVERS = "${params.servers}" // Correctly set environment variable from parameter
    }

    stages {
        stage('List') {
            steps {
                echo 'Hello World'
                sh 'ls -lrt'
            }
        }
        stage('Deploy') {
            steps {
                sh 'whoami'
                echo "Parameter 'servers' is: ${params.servers}" // Debugging output
                echo "Environment variable 'SERVERS' is: ${env.SERVERS}" // Debugging output
                
                // Using double quotes for proper variable interpolation
                sh """
                   sudo -u ansible ansible-playbook -i /var/lib/jenkins/workspace/pipe1/inventory \
                   /var/lib/jenkins/workspace/pipe1/playbook.yaml --limit ${env.SERVERS}
                   """
            }
        }
    }
}
