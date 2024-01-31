pipeline{
    agent any
    environment{
        DOCKERHUB_USERNAME = "sahar449"
        DOCKERHUB_LOGIN = "docker_hub_login"
        APP_NAME = "helm_python_app"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
    }

    stages{

        stage('Docker build and tag'){
            steps{
                script{
                    sh '''
                        docker build -t $IMAGE_NAME .
                        docker image tag $IMAGE_NAME $IMAGE_NAME:$BUILD_ID
                        '''
                    }
            }
        }
        stage('Docker push to docker-hub'){
            steps{
                script{ 
                        withCredentials([string(credentialsId: 'docker_hub_login', variable: 'docker_hub')]) {
                            sh '''
                                docker login -u sahar449 -p ${docker_hub}
                                docker push $IMAGE_NAME:$BUILD_ID
                             '''
                        }
                    }
                }
            }
        stage('Build Helm'){
            steps{
                script{
                    sh 'helm upgrade python --install helm --set image.tag="$BUILD_ID" '
                }
            }
        }
        stage('Check if the contianer healthly'){
            steps{
                script{
                    sh '''
                        #!/bin/bash
                        curl http://minikube:30000/health
                        if [[ $? == 0 ]];
                        then echo 'The container is healtly'
                        exit 0
                        fi
                        '''
                }
            }
        }
    }
    post {
        success {
            echo 'The container is healtly!'
        }
        failure {
            echo 'failed!'
        }
    }
}