pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "orsanaw/moh-hello-world-app" // Docker image name
        GITHUB_REPO = "https://github.com/Awawdi/moh-hello-world-app.git" // GitHub repository URL
        DOCKER_REGISTRY = "docker.io" // Dockerhub registry
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone GitHub repository
                git url: "${GITHUB_REPO}", branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                                  usernameVariable: 'DOCKER_USERNAME',
                                                  passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
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
                    echo "Deploying Docker image: ${DOCKER_IMAGE}"

                    sshagent(credentials: ['ec2-ssh-key']) {
                        sh '''
                            ssh -o StrictHostKeyChecking=no ec2-user@34.224.69.46 bash -c "
                                set -x

                                echo \"Pulling Docker image: '"${DOCKER_IMAGE}"'\"

                                docker pull '"${DOCKER_IMAGE}"'

                                # Stop containers using port 80
                                docker ps | grep ':80->' | awk '{print $1}' | xargs -r docker stop

                                # Remove stopped containers using port 80
                                docker ps -a | grep ':80->' | awk '{print $1}' | xargs -r docker rm

                                docker run -d -p 80:5000 '"${DOCKER_IMAGE}"'

                                docker ps
                            "
                        '''
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