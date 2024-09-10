pipeline {
    agent {
        docker { image 'hashicorp/terraform' }
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    try {
                        sh 'terraform init' // Use -reconfigure if needed
                    } catch (Exception e) {
                        error "Terraform init failed: ${e.message}"
                    }
                }
            }
        }
        stage('Plan') {
            steps {
                script {
                    try {
                        sh 'terraform plan -out=tfplan' // Output plan to file
                        sh 'terraform show -no-color tfplan > tfplan.txt' // Optional: for human-readable output
                        sh 'terraform graph | dot -Tpng > plan.png'
                        archiveArtifacts artifacts: 'tfplan.txt, plan.png', allowEmptyArchive: true
                    } catch (Exception e) {
                        error "Terraform plan or graph failed: ${e.message}"
                    }
                }
            }
        }
    }
}
