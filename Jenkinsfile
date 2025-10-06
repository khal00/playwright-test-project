pipeline {
    // Define the Playwright Docker image as the agent for the whole pipeline
    agent {
        docker {
            image 'mcr.microsoft.com/playwright:latest' 
            args '--ipc=host -u root -v $(pwd):/usr/src/app   -w /usr/src/app' 
        }
    }

    stages {
        stage('Checkout') {
            steps {
                // withCredentials([usernamePassword(credentialsId: 'github-acces-t', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_TOKEN')]) {
                // sh 'git clone https://${GIT_USER}:${GIT_TOKEN}@github.com/khal00/playwright-test-project.git .'
                // }
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Now that the code is in the workspace, this can run
                sh 'npm ci'
            }
        }

        stage('Run Playwright Tests') {
            steps {
                sh 'npx playwright test --reporter=junit,html'
            }
        }

        // stage('Publish Reports') {
        //     steps {
        //         junit 'test-results/**/*.xml' 
        //         archiveArtifacts artifacts: 'playwright-report/**/*', fingerprint: true
        //     }
        // }
    }
}