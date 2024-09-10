pipeline {
    agent {
        docker { image 'hashicorp/terraform:latest' }
    }
     environment {
        GITHUB_TOKEN = credentials('git-token')
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout Terraform code from version control
              git branch: 'main', url: 'https://github.com/your-repo/terraform-code.git'
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    try {
                        dir('terraform-directory') { // Specify your Terraform directory if needed
                            sh 'terraform init' // Use -reconfigure if needed
                        }
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
                        dir('terraform-directory') { // Specify your Terraform directory if needed
                            sh 'terraform plan -out=tfplan' // Output plan to file
                            sh 'terraform show -no-color tfplan > tfplan.txt' // Optional: for human-readable output
                            sh 'terraform graph | dot -Tpng > plan.png'
                        }
                        archiveArtifacts artifacts: 'tfplan.txt, plan.png', allowEmptyArchive: true
                    } catch (Exception e) {
                        error "Terraform plan or graph failed: ${e.message}"
                    }
                }
            }
        }
    }
}
