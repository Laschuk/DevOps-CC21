pipeline {
    agent {
        label 'agent1'
    }
    
    stages {
        stage('Terraform init'){
            steps{
                dir('./OleksandrHavron/tf_files') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform destroy'){
            steps{
                dir('./OleksandrHavron/tf_files') {
                    sh 'terraform apply -destroy -auto-approve -no-color'
                }
            }
        }
    }
}