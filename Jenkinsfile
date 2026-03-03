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
                archiveArtifacts artifacts: 'target/my-webapp.war', followSymlinks: false
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Ensure the URL is 9090 and the war file matches your screenshot
                deploy adapters: [tomcat9(credentialsId: 'tomcat-creds', path: '', url: 'http://18.205.27.122:9090')], 
                       contextPath: 'my-webapp', 
                       war: 'target/my-webapp.war'
            }
        }
    }
}
