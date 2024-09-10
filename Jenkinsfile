pipeline {
    agent {
        docker {
            image 'hashicorp/terraform'
            args '--entrypoint /bin/sh' // Add entrypoint argument here
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sanketares/docker-agent.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Run terraform init inside the Docker container
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run terraform plan inside the Docker container with the specified entrypoint
                    docker.image('hashicorp/terraform').inside('--entrypoint /bin/sh') {
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
