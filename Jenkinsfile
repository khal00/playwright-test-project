pipeline {
    // Define the Playwright Docker image as the agent for the whole pipeline
    agent {
        docker {
            image 'pwagent:1.0' 
            args '--ipc=host' 
        }
    }

    stages {
        stage('Checkout') {
            steps {
                // withCredentials([usernamePassword(credentialsId: 'github-acces-t', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_TOKEN')]) {
                // sh 'git clone https://${GIT_USER}:${GIT_TOKEN}@github.com/khal00/playwright-test-project.git .'
                // }
                sh 'echo chekout scm'
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Now that the code is in the workspace, this can run
                sh 'echo install dependecies'
                sh 'npm ci'
            }
        }

        stage('Run Playwright Tests') {
            steps {
                sh 'echo run tests'
                sh 'npx playwright test --reporter=junit,html'
            }
        }

        stage('Publish Reports') {
            steps {
                junit 'test-results/**/*.xml' 
                archiveArtifacts artifacts: 'playwright-report/**/*', fingerprint: true
            }
        }
    }
}
