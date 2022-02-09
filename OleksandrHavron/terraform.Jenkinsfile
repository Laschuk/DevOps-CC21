pipeline {
    agent {
        label 'agent1'
    }
    
    stages {
        stage('Terraform init/plan'){
            steps{
                dir('./OleksandrHavron/tf_files') {
                    sh 'terraform init'
                    sh 'terraform plan -out=tfplan -no-color'
                }
            }
        }

        stage('Terraform apply'){
            steps{
                dir('./OleksandrHavron/tf_files') {
                    sh 'terraform apply -auto-approve tfplan -no-color'
                }
            }
        }
    }
}