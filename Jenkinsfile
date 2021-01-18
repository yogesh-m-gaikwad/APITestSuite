pipeline {
    agent any
    stages {
      stage('Build') {
        steps {
            echo 'Building...'
            echo "Running ${env.BUILD_ID} ${env.BUILD_DISPLAY_NAME} on ${env.NODE_NAME} and JOB ${env.JOB_NAME}"
            bat 'mvn clean compile -o'
        }
      }
      stage('Test') {
        steps {
            echo 'Testing...'
            bat 'mvn test'
        }
      }
    }
}