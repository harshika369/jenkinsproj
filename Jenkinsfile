pipeline {
    agent any
    
    tools {
        maven 'maven3' 
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/harshika369/jenkinsproj.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // This corrected structure uses 'war' and 'adapters'
                deploy adapters: [tomcat9(credentialsId: 'tomcat-creds', path: '', url: 'http://18.205.27.122:9090')], 
                       contextPath: 'my-web-app', 
                       war: 'target/*.war'
            }
        }
    }
}
