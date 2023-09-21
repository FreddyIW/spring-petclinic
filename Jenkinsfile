pipeline {
    agent any
    
    tools {
        jdk 'jdk'
        maven 'maven'
    }
    
    environment {
        SONARQUBE_SCANNER_HOME = tool 'sonarqube-scanner'
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/FreddyIW/spring-petclinic.git'
            }
        }
        /*
        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }
        */
        stage('OWASP Scan') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ ', odcInstallation: 'dependency-check'
                //dependencyCheck additionalArguments: '--scan ./ --format HTML', odcInstallation: 'dependency-check'
                //dependencyCheckPublisher pattern: 'dependency-check-report.xml'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage('SonarQube') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh ''' $SONARQUBE_SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=PetClinic \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=PetClinicProjectKey1 '''
                }
            }
        }
        /*
        stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
        */
        /*
        stage('Docker Build and Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh "docker build -t petclinic -f docker/Dockerfile ."
                        sh "docker tag petclinic freddyiw/my-pet-clinic-2:latest"
                        sh "docker push freddyiw/my-pet-clinic-2:latest"
                    }
                }
            }
        }
        */
        
    }
}
