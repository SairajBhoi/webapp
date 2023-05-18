pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                   git branch: 'Ansible-minikube', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git'
                }
            }
        }

        stage('ansible-minikube') {
            steps {
                    ansiblePlaybook credentialsId: 'remote-access', installation: 'Ansible', inventory: '/var/lib/jenkins/workspace/AWS-project-minikube/inventory.ini', playbook: '/var/lib/jenkins/workspace/AWS-project-minikube/playbook2.yaml'
                }
        }
 }
    


