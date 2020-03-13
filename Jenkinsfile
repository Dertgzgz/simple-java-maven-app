pipeline {
  agent none
  stages {
    
    stage('Fix the permission issue') {
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
      def app
      agent { 
        docker {
          image 'maven:3.6.3-jdk-8'
          args '-v /root/.m2:/root/.m2'
        }
      } 
      steps {
        app = docker.build("versia/prueba1")
      }
    } 
  }
}
