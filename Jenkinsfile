pipeline {
	def app
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
        }
        stage('Create Jar') { 
            steps {
                sh 'mvn clean install' 
            }
        }

       stage('Build image') {

           app = docker.build("mohiulalamprince/test-ropu")
       }

       stage('Push image') {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
          }
       }
    }
}
