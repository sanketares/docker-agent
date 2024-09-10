pipeline {
    agent any
    

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git 'https://github.com/sanketares/docker-agent.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('my-terraform-image')
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Run terraform init inside the Docker container
                    docker.image('my-terraform-image').inside {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run terraform plan inside the Docker container
                    docker.image('my-terraform-image').inside {
                        sh 'terraform plan'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up actions, like archiving the build results
            cleanWs()
        }
    }
}
