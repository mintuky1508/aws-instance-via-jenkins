pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')  
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mintuky1508/aws-instance-via-jenkins.git'
            }
        }
        
        stage('Init Terraform') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Plan Terraform') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            steps {
                input message: 'Do you want to apply the Terraform plan?'
                bat 'terraform apply -auto-approve'
            }
        }
    }
}
