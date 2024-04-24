pipeline {
    agent any
    tools {
        maven "Maven3"
        jdk "Java"
    }
    
    stages {
        stage('Build Maven Project') {
            steps {
                script {
                    // Checkout Git repository
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[url: 'https://github.com/ayowilfred95/java-automation-app.git']]
                    ])
                    
                    // Run Maven build
                    sh 'mvn clean install'
                }
               
            }
        }
          stage('Build Docker Image') {
                steps {
                    script {
                        sh "docker build -t ayowilfred95/devops-integration:2.0 ."
                    }
                }
            }
        stage("Push Docker image to Dockerhub") {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpassword')]) {
                    sh "docker login -u ayowilfred95 -p ${dockerhubpassword}"
                    }
                    sh "docker push ayowilfred95/devops-integration:2.0"
                }
            }
        }
    }
}






// we can use git clone instead of git checkout
// the first pipeline used git checkout
// checkout the first script

// pipeline {
//     agent any
//     tools {
//         maven "Maven3"
//         jdk "Java"
//     }
    
//     stages {
//         stage('Clone Repository') {
//             steps {
//                 // Use git command to clone the repository
//                 sh 'git clone https://github.com/ayowilfred95/java-automation-app.git'
//             }
//         }
        
//         stage('Build Maven Project') {
//             steps {
//                 script {
//                     // Run Maven build
//                     sh 'mvn clean install'
//                 }
//             }
//         }
        
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh "docker build -t ayowilfred95/devops-integration ."
//                 }
//             }
//         }
        
//         stage("Push Docker image to Dockerhub") {
//             steps {
//                 script {
//                     withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpassword')]) {
//                         sh "docker login -u ayowilfred95 -p ${dockerhubpassword}"
//                     }
//                     sh "docker push ayowilfred95/devops-integration"
//                 }
//             }
//         }
//     }
// }

