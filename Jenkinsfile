pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
	    registryUrl 'https://registry.hub.docker.com'
	    registryCredentialsId 'dockerhub'
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
	stage('Create image and push') {
		steps {
			script {

				def customImage = docker.build("mohiulalamprince/test-ropu:${env.BUILD_ID}")

				/* Push the container to the custom Registry */
				customImage.push()
			}
		}
		
	}	
    }
}
