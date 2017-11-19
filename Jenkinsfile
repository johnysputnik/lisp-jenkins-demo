pipeline {
    agent sbcl-agent 

    stages {

        stage('Test') {
            steps {
                echo 'Testing..'
                sh "sbcl --load test.lisp"
                step([$class: "TapPublisher", testResults: "**/tests.tap"])
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'coverage-report/cover-index.html', reportName: 'Coverage Report', reportTitles: ''])
            }
        }
        stage('Build') {
            steps {
                echo 'Building..'
                sh "sbcl --load build.lisp"
            }
        }
	      stage('Label') {
            steps {
                echo 'Labeling....'
                sh "git tag build_${env.BUILD_NUMBER}"
                sh "git push origin build_${env.BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            deleteDir()
        }
        success {
            slackSend color: "#00FF00", message: "Build Complete: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }
        failure {
            slackSend color: "#FF0000", message: "Build Failed: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }
    }

    options {
        buildDiscarder(logRotator(numToKeepStr:'10'))
        timeout(time: 60, unit: 'MINUTES')
    }
}
