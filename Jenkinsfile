pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                script {
                    sh "chmod u+rx /home/ubuntu"
                    dir("/home/ubuntu/ansible/") {
                        git branch: 'Ansible-minikube', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git'
                    }
                }
            }
        }

        stage('ansible-minikube') {
            steps {
                withCredentials([ansibleSshKey(credentialsId: 'remote-access', keyFileVariable: 'SSH_KEY')]) {
                    ansiblePlaybook installation: 'Ansible', inventory: '/home/ubuntu/ansible/inventory.ini', playbook: '/home/ubuntu/ansible/playbook2.yaml', extras: "-e 'ansible_ssh_private_key_file=${SSH_KEY}'"
                }
            }
        }
    }
}
