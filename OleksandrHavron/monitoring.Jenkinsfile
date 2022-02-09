pipeline {
    agent {
        label 'agent1'
    }

    environment{
        DD_SITE = credentials('datadog-site')
        DD_API_KEY = credentials('datadog-key')

        AWS_REGION = creadentials('aws_region')
        CLUSTER_NAME = creadentials('cluster_name')
    }
    
    stages {
        stage('Update kubeconfigfile'){
            steps{
                withAWS(credentials: "Amazon creds", region: "eu-central-1"){
                    sh 'aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME'
                }
            }
        }
        stage('Deploy datadog'){
            steps{
                sh 'helm install datadog-agent -f values.yaml --set datadog.site=$DD_SITE --set datadog.apiKey=$DD_AP_KEY datadog/datadog'
            }
        } 
    }
}