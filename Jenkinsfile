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
                // This pulls the code from your repository
                git branch: 'main', url: 'https://github.com/harshika369/jenkinsproj.git'
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
                // This saves the result in the Jenkins UI
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // This sends the .war file to Tomcat on port 9090
                deploy artifacts: 'target/*.war', 
                       contextPath: 'my-web-app', 
                       credentialsId: 'tomcat-creds', 
                       url: 'http://18.205.27.122:9090'
            }
        }
    }
}
