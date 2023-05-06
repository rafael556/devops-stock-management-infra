pipeline {
    stages {
        stage('create EKS Cluster') {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform apply --auto-approve"
                }
            }
        }
        stage('Deploy EKS') {
            steps {
                script {
                    sh "aws eks update-kubeconfig --name <cluster-name>"
                    sh "kubectl apply -f nginx-deployment.yaml"
                    sh "kubectl apply -f nginx-service.yaml"
                }
            }
        }
    }
}