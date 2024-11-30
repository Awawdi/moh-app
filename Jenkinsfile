pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "orsanaw/moh-hello-world-app" // Set the Docker image name
        GITHUB_REPO = "https://github.com/Awawdi/moh-hello-world-app.git" // GitHub repository URL
        DOCKER_REGISTRY = "docker.io" // Docker registry (DockerHub in this case)
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git url: "${GITHUB_REPO}", branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to DockerHub
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"

                    // Push the Docker image to DockerHub
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                script {
                    // Add SSH command to deploy the Docker container to your EC2 instance
                    sh """
                    ssh -i /path/to/your/aws/moh-kp.pem ec2-user@<EC2_PUBLIC_IP> <<EOF
                    docker pull ${DOCKER_IMAGE}
                    docker run -d -p 80:80 ${DOCKER_IMAGE}
                    EOF
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
