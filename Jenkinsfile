pipeline {
  agent none
  stages {
    stage('Fix the permission issue') {
      agent any
      steps {
        sh 'sudo chown root:jenkins /run/docker.sock'
      }
    }

    stage('Build') {
      agent {
        docker {
          image 'maven:3.6.3-jdk-8'
          args '-v /root/.m2:/root/.m2'
        }

      }
      steps {
        sh 'ls -lsa'
        sh 'mvn -B -DskipTests clean package'
      }
    }

    stage('run') {
      steps {
        sh './mvnw com.google.cloud.tools:jib-maven-plugin:dockerBuild -Dimage=versia/pruebas'
      }
    }

  }
}