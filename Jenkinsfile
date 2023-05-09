
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
                                   
                                   sh ' aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 126681421555.dkr.ecr.ap-south-1.amazonaws.com'
                           }
                        }
                }
            }
        stage('building image') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'docker build -t web-app-repo -f Docker .'
                           }
                        }
                }
            }
        stage('adding tag') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'docker tag web-app-repo:latest 126681421555.dkr.ecr.ap-south-1.amazonaws.com/web-app-repo:latest'
                           }
                        }
                }
            }
        stage('push to ecr') {
                steps {
                       script{
                           dir("docker"){
                                   
                                   sh 'docker push 126681421555.dkr.ecr.ap-south-1.amazonaws.com/web-app-repo:latest'
                           }
                        }
                }
            }
        
          
    }
}
    


