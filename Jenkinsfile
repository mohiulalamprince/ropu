pipeline {
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
	stage('Create image and push') {
		steps {
		    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

			def customImage = docker.build("mohiulalamprince/test-ropu:${env.BUILD_ID}")

			/* Push the container to the custom Registry */
			customImage.push()
		    }
		}
		
	}	
    }
}
