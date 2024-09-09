pipeline {
    agent{
        docker { image 'node:16-alpine' }
        
    }
    stages {
        stage ('test') {
            steps {
                sh 'node --version'
            }
        }
    }
        stage('Terraform init') {
                steps {
                    sh 'terraform init ' // Use -reconfigure if preferred
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan' // Output plan to file
                sh 'terraform show -no-color tfplan > tfplan.txt' // Optional: for human-readable output
                sh 'terraform graph | dot -Tpng > plan.png'
                archiveArtifacts artifacts: 'tfplan.txt, plan.png', allowEmptyArchive: true

            }
        }
    }
