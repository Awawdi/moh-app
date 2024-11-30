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
                git url: "${GITHUB_REPO}", branch: 'master'
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                                  usernameVariable: 'DOCKER_USERNAME',
                                                  passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        // Login to DockerHub using credentials stored in Jenkins
                        sh """
                        docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                        docker push ${DOCKER_IMAGE}
                        """
                    }
                }
            }
        }


        stage('Deploy to EC2') {
            steps {
                script {
                    sshagent(credentials: ['ec2-ssh-key']) {
                        sh """
                        ssh -o StrictHostKeyChecking=no ec2-user@34.224.69.46 << EOF
                        docker pull ${DOCKER_IMAGE}

                        # Stop any existing container running on port 80
                        docker ps | grep ':80->' | awk '{print \$1}' | xargs -r docker stop || true

                        # Remove any existing container running on port 80
                        docker ps -a | grep ':80->' | awk '{print \$1}' | xargs -r docker rm || true

                        docker run -d -p 80:80 ${DOCKER_IMAGE}
                        EOF
                        """
                    }
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