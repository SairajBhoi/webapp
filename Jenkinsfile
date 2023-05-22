
pipeline {
   
    agent  any
    stages {
            stage('checkout') {
                steps {
                       script{
                           dir("terraform"){
                                   git branch: 'terraform', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git' 
                                   
                           }
                        }
                }
            }
        stage('terraform init') {
                steps {
                       script{
                           dir("terraform"){
                                   sh 'echo "yes" | terraform init'
                           }
                        }
                }
            }
            
            
        stage('terraform plan') {
                steps {
                       script{
                           dir("terraform"){
                                   
                                  sh 'terraform plan'
                           }
                        }
                }
            }    
            
        stage('terraform apply') {
                steps {
                       script{
                           dir("terraform"){
                                   
                                  sh 'terraform apply --auto-approve'
                           }
                        }
                }
            }
          
    }
}
    


