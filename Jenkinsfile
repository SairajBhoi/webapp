pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                sh 'chmod -R 777 /var/lib/jenkins/workspace/AWS-project-minikube'
                checkout scm
            }
        }

        stage('ansible-minikube') {
            steps {
                dir('/var/lib/jenkins/workspace/AWS-project-minikube') {
                    sh 'chmod -R 777 /home/ubuntu/ansible'
                    ansiblePlaybook credentialsId: 'remote-access', installation: 'Ansible', inventory: '/home/ubuntu/ansible/inventory.ini', playbook: '/home/ubuntu/ansible/playbook2.yaml'
                }
            }
        }
    }
}

