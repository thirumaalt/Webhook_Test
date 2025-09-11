pipeline {
  agent { label 'ansible' } // pick an agent where ansible + ssh keys are available
  parameters {
    string(name: 'servers', defaultValue: 'all', description: 'Inventory group or host limit for ansible --limit')
  }

  environment {
    SERVERS = "${params.servers}"
    // Example to show how you'd reference a credential ID if needed:
    // SSH_KEY = credentials('jenkins-ssh-key-id')   // Jenkins secret text / SSH cred usage example
  }

  options {
    timestamps()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }

  stages {
    stage('Prepare / Debug') {
      steps {
        echo "BUILD_ID=${env.BUILD_ID}"
        echo "WORKSPACE=${env.WORKSPACE}"
        echo "BRANCH=${env.BRANCH_NAME}"
        echo "Parameter 'servers' => '${params.servers}'"
        echo "Env SERVERS => '${env.SERVERS}'"

        // Extra debug info (remove in production)
        sh '''
          echo "Whoami:"
          whoami
          echo "Effective user id:"
          id
          echo "List workspace:"
          ls -la "${WORKSPACE}"
        '''
      }
    }

    stage('List') {
      steps {
        sh 'ls -lrt'
      }
    }

    stage('Deploy') {
      steps {
        script {
          if (!params.servers?.trim()) {
            error "Parameter 'servers' is empty. Provide a value (e.g. 'all' or 'host1,host2' or 'web*')"
          }
        }

        // Use WORKSPACE rather than hardcoded path
        sh """
          sudo -u ansible ansible-playbook -i "${WORKSPACE}/inventory" \
            "${WORKSPACE}/playbook.yaml" --limit "${env.SERVERS}"
        """
      }
    }
  }

  post {
    success { echo "Deploy finished (SUCCESS)" }
    failure {
      echo "Deploy failed - check console output"
      // optionally add notifications here
    }
  }
}
