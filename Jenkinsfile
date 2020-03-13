pipeline {
  agent none
  stages {
    agent any
    stage('Fix the permission issue') {
      steps {
        sh 'sudo chown root:jenkins /run/docker.sock'
      }
    }

    stage('Build App') {
      agent { 
        docker {
          image 'maven:3.6.3-jdk-8'
          args '-v /root/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn -B -DskipTests clean package'
      }
    }

    stage('Buil Docker') {
      agent any
      steps {
        sh 'docker build .'
        sh 'docker run versia/prueba1 '   
      } 
    } 
  }
}
