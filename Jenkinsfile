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
                sh 'whoami'
                sh 'sudo -u root ansible-playbook -i /var/lib/jenkins/workspace/pipe1 /var/lib/jenkins/workspace/pipe1/playbook.yaml'
            }
        }
        
    }
}
