Helm Python Application CI/CD Pipeline
This project automates the Continuous Integration and Continuous Deployment (CI/CD) process for a Python application using Jenkins, Docker, Helm, and Nexus. The Jenkins pipeline builds a Docker image, pushes it to Docker Hub, deploys or upgrades the application in Kubernetes using Helm, and then packages and pushes the Helm chart to a Nexus repository.

Prerequisites
Jenkins server with Docker, Helm, and curl installed.
Access to a Kubernetes cluster (like Minikube) for deploying the application.
Docker Hub account for storing Docker images.
Nexus repository for storing Helm charts.
Pipeline Overview
The Jenkins pipeline is defined in a Jenkinsfile and consists of the following stages:

Docker Build and Tag: Builds a Docker image for the Python application and tags it with the build ID.
Docker Push to Docker Hub: Pushes the tagged Docker image to Docker Hub.
Install/Upgrade Helm: Deploys or upgrades the Python application in Kubernetes using Helm, setting the image tag to the current build ID.
Check if the Container is Healthy: Checks the health of the deployed container by sending a request to its health endpoint.
Package and Push Helm to Nexus: Packages the Helm chart with the current build ID as its version and pushes it to a Nexus repository.
Setup Instructions
Jenkins Configuration
Ensure Jenkins has the Docker, Helm, and curl tools installed.
Configure the DOCKERHUB_USERNAME and DOCKERHUB_LOGIN credentials in Jenkins.
Add docker_hub_login and nexus_new credentials in Jenkins credentials store.
Docker Hub
Create a Docker Hub repository to store your Docker images.
Use the same repository name as the APP_NAME in the Jenkinsfile.
Nexus Repository
Setup a Nexus repository to store your Helm charts.
Ensure it's accessible from your Jenkins server and Kubernetes cluster.
Kubernetes Cluster
Have a Kubernetes cluster ready and accessible from your Jenkins server.
Configure kubectl or helm on your Jenkins server to communicate with your Kubernetes cluster.
Usage
To use this pipeline:

Push the Jenkinsfile to your project's repository.
Create a new Jenkins Pipeline job and point it to your repository.
Run the pipeline job to start the CI/CD process.
