pipeline {
    agent {
        node {
            label 'slave-2'
            customWorkspace '/mnt/build'
        }
    }

    tools {
        maven 'maven'
        git 'git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/AvinashK98/Application.git'
            }
        }


        stage('maven-Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker image build') {
            steps {
                sh 'chmod 666 /var/run/docker.sock'
                sh 'docker build -t avinashk98/my_app:1.0 .'
            }
        }

        stage('Image push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerID', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                    sh "docker push avinashk98/my_app:1.0"
                }
            }
        }
    }
}
