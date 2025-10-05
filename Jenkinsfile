pipeline {
    // Define the Playwright Docker image as the agent for the whole pipeline
    agent {
        docker {
            image 'mcr.microsoft.com/playwright:latest' 
            args '--ipc=host -u root' 
        }
    }

    stages {
        stage('Checkout Code') {
            steps {
                // The 'checkout scm' step automatically pulls the code
                // configured in the job's 'Pipeline' section (see Step 2)
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

        stage('Publish Reports') {
            steps {
                junit 'test-results/**/*.xml' 
                archiveArtifacts artifacts: 'playwright-report/**/*', fingerprint: true
            }
        }
    }
}