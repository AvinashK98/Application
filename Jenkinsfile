pipeline{
	agent{
		node{
			label "built-in"
		}
	}
	environment{
		DOCKER_IMG="avinashk98/webapp:${BUILD_NUMBER}"
		
	}
			
		stage("Docker Image Build"){
			steps{
						sh "docker build -t ${DOCKER_IMG} ."				
			}
		}
		
		stage("Docker Login"){
			steps{
				withCredentials([usernamePassword(credentialsId: 'docker-creds', 
                                          passwordVariable: 'DOCKER_PASS', 
                                          usernameVariable: 'DOCKER_USER')]) {
            
            // Use the variables to log in. Jenkins will mask the password with '****'
            sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
			}
		}
		
		stage("Pushing Image to Registry"){
			steps{
				sh "docker push ${DOCKER_IMG}"
			}
		}
		
		stage("Container Deployment"){
			steps{
					sh """
						docker compose down || true
						docker compose pull
						docker compose up -d					
					"""
			}
		}
		
		
	}
}
