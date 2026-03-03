pipeline {
    agent any
    
    tools {
        // These names MUST match what you configured in Jenkins 'Global Tool Configuration'
        maven 'maven3' 
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                // This pulls the code you showed in your screenshots
                git 'https://github.com/harshika369/jenkinsproj.git'
            }
        }

        stage('Build with Maven') {
            steps {
                // This command creates the .war file
                sh 'mvn clean package'
            }
        }

        stage('Verify Artifact') {
            steps {
                // This shows you the result in the Jenkins UI
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
        }
    }
}
