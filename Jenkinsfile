pipeline {
    agent any

    stages {
          stage('checkout') {
            steps {
                   git branch: 'Ansible-minikube', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git'
            }
          }
        

           stage('ansible-minikube-installation') {
              steps {
                    ansiblePlaybook credentialsId: 'test', disableHostKeyChecking: true, installation: 'Ansible', inventory: '/var/lib/jenkins/workspace/AWS-project-minikube/inventory.ini', playbook: '/var/lib/jenkins/workspace/AWS-project-minikube/playbook2.yaml'
                    ansiblePlaybook credentialsId: 'test', disableHostKeyChecking: true, installation: 'Ansible', inventory: '/var/lib/jenkins/workspace/AWS-project-minikube/inventory.ini', playbook: '/var/lib/jenkins/workspace/AWS-project-minikube/playbook_k8s.yaml'
              }
           }

        //    stage('ansible-minikube-deployment') {
        //       steps {
        //           ansiblePlaybook credentialsId: 'test', disableHostKeyChecking: true, installation: 'Ansible', inventory: '/var/lib/jenkins/workspace/AWS-project-minikube/inventory.ini', playbook: '/var/lib/jenkins/workspace/AWS-project-minikube/playbook_k8s.yaml'  
        //       }
        //    }
        }
}
    


