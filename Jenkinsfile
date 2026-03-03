pipeline {
    agent any
    
    tools {
        // Confirm these match 'Manage Jenkins' -> 'Tools'
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
                // This saves the war file so you can see it in the Jenkins UI
                archiveArtifacts artifacts: 'target/my-webapp.war', followSymlinks: false
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // The contextPath will be the end of your URL (e.g., /my-webapp)
                deploy adapters: [tomcat9(credentialsId: 'tomcat-creds', path: '', url: 'http://18.205.27.122:9090')], 
                       contextPath: 'my-webapp', 
                       war: 'target/my-webapp.war'
            }
        }
    }
}
