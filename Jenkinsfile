
pipeline {
   
    agent  any
    stages {
            stage('checkout') {
                steps {
                       script{
                           dir("docker"){
                                   git branch: 'docker', credentialsId: 'github-jenkins', url: 'git@github.com:SairajBhoi/webapp.git' 
                                   
                                 
                           }
                        }
                }
            }
        stage('login') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh ' sudo aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 126681421555.dkr.ecr.ap-south-1.amazonaws.com'
                           }
                        }
                }
            }
        stage('building image') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'sudo docker build -t web-app-repository  -f Docker .'
                           }
                        }
                }
            }
        stage('adding tag') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'sudo docker tag web-app-repository:latest 126681421555.dkr.ecr.ap-south-1.amazonaws.com/web-app-repository:latest'
                           }
                        }
                }
            }
        stage('push to ecr') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'sudo docker push 126681421555.dkr.ecr.ap-south-1.amazonaws.com/web-app-repository:latest'
                                   
                           }
                        }
                }
            }
        
          
    }
}
    


