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

            post {
                 success {
                         slackSend color: "#00FF00", message: "Build Complete: ${env.JOB_NAME} ${env.BUILD_NUMBER}""
                 }
        
                 failure {
                         slackSend color: "FF0000", message: "Build Failed to Complete: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
                 }
            }
        }
    }
}
