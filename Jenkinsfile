
pipeline {
   
    agent  any
    stages {
            stage('checkout') {
                steps {
                       script{
                           dir("/home/ubuntu/ansible/"){
                                   git branch: 'Ansible-minikube', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git' 
                           }
                        }
                }
            }
            stage('ansible-minikube') {
                steps {
                       
                        ansiblePlaybook credentialsId: 'remote-access', installation: 'Ansible', inventory: '/home/ubuntu/ansible/inventory.ini', playbook: '/home/ubuntu/ansible/playbook2.yaml'
                }
            }  
    }
}
    


