pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        /*stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }*/
	stage("Build image") {
            steps {
		
		sh 'docker ps'
		script {
                    myapp = docker.build("mohiulalamprince/test-ropu:${env.BUILD_ID}")
		}
            }
        }
        stage("Push image") {
            steps {
		script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
		}
            }
        }       
    }
}
