
pipeline {
   
    agent  any
    stages {
            
            stage('ansible-minikube') {
                steps {
                       
                        ansiblePlaybook credentialsId: 'remote-access', installation: 'Ansible', inventory: '/home/ubuntu/ansible/inventory.ini', playbook: '/home/ubuntu/ansible/playbook2.yaml'
                }
            }  
    }
}
    


