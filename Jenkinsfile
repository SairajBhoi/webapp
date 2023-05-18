pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                dir('/home/ubuntu/ansible'){
                   sh 'chmod -R 777 /home/ubuntu/ansible'
                   git branch: 'Ansible-minikube', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git'
                }
            }
        }

        stage('ansible-minikube') {
            steps {
                dir('/home/ubuntu/ansible') {
                //     sh 'chmod -R 777 /home/ubuntu/ansible'
                    ansiblePlaybook credentialsId: 'remote-access', installation: 'Ansible', inventory: '/home/ubuntu/ansible/inventory.ini', playbook: '/home/ubuntu/ansible/playbook2.yaml'
                }
            }
        }
    }
}

