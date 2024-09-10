pipeline {
    agent {
        docker {
            image 'hashicorp/terraform'
            args '--entrypoint /bin/sh'
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
            // Ensure the cleanWs step runs in a proper node context
            node {
                cleanWs()
            }
        }
    }
}
