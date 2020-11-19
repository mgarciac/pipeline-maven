pipeline {
   agent any

   environment {
      PASS=credentials('PASS_DOCKER_HUB')
   }

   stages {
      stage('Build') {
         steps {
            sh '''
               echo Building the JAR
               ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
               echo Building the docker image using the JAR
               ./jenkins/build/build.sh
               '''
         }

         post {
            success {
               archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
            }
         }
      }
      stage('Test') {
         steps {
            sh '''
               echo Testing the Java App
               ./jenkins/test/mvn.sh mvn test
               '''
         }

         post {
            always {
               junit 'java-app/target/surefire-reports/*.xml'
            }
         }
      }
      stage('Push') {
         steps {
            sh '''
               echo Pushing the image to Docker Hub mgarciac88
               ./jenkins/push/push.sh
               '''
         }
      }
      stage('Deploy') {
         steps {
            sh '''
               echo Deploying...
               ./jenkins/deploy/deploy.sh
               '''
         }
      }
   }
}