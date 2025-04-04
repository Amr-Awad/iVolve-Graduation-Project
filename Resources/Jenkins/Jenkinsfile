@Library('jenkins-shared-library') _

pipeline {
    agent {
        label 'agent'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker_token')
        GIT_CREDENTIALS = credentials('github_token')
        DOCKER_IMAGE = "amrawad12/my-springboot-app"
        MANIFEST_REPO = "https://github.com/Amr-Awad/jenkins_updateManifest.git"
        JAR_FILE = "./build/libs/demo-0.0.1-SNAPSHOT.jar"
    }
    stages {
        stage('Unit Test') {
            steps {
                unitTest()
            }
        }
        stage('SonarQube Analysis') {
            steps {
                sonarQubeCheck()
            }
        }
        stage('Build JAR') {
            steps {
                buildJar()
            }
        }
        stage('Build & Verify & Push Image') {
            steps {
                dockerBuildPush()
            }
        }
        stage('Update Manifest') {
            steps {
                updateManifest()
            }
        }
    }
    post {
        always {
            script {
                sh "docker rmi ${env.DOCKER_IMAGE}:jenkins_${BUILD_NUMBER} || true"
                sh "docker rm -f test-container || true"
            }
        }
    }
}