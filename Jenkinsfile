pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
	      stage('Label') {
            steps {
                sh "git tag build_${env.BUILD_NUMBER}"
                sh "git push origin build_${env.BUILD_NUMBER}"
            }
        }
    }
}
