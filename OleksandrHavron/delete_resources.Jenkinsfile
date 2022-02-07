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
        stage('Delete resources'){
            steps{
                withAWS(credentials: "Amazon creds", region: "eu-central-1"){
                    sh 'kubectl delete -f mysql.yml'
                    sh 'kubectl delete -f php.yml'
                    sh 'kubectl delete -f phpmyadmin.yml'
                }
            }
        }
    }
}