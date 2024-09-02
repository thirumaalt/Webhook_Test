pipeline {
    agent any
    ENVIRONMENT {
        SERVERS = ${servers}
    
    }
    

    stages {
        stage('List') {
            steps {
                echo 'Hello World'
                sh 'ls -lrt'
                
            }
        }
        stage('deploy'){
            steps{
                sh 'whoami'
                sh 'sudo -u ansible ansible-playbook -i /var/lib/jenkins/workspace/pipe1/inventory /var/lib/jenkins/workspace/pipe1/playbook.yaml --limit $SERVERS'
            }
        }
        
    }
}
