pipeline {
    agent {
        label 'agent1'
    }
    
    stages {
        stage('Update kubeconfigfile'){
            steps{
                withAWS(credentials: "Amazon creds", region: "eu-central-1"){
                    sh 'aws eks update-kubeconfig --region eu-central-1 --name devopscc'
                }
            }
        }
        stage('Create resources'){
            steps{
                withAWS(credentials: "Amazon creds", region: "eu-central-1"){
                    sh 'kubectl create -f eks-yml/mysql.yml'
                    sh 'kubectl create -f eks-yml/php.yml'
                    sh 'kubectl create -f eks-yml/phpmyadmin.yml'
                }
            }
        }
        
    }
}