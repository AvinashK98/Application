pipeline{
	agent{
		node{
			label "built-in"
			customWorkspace "/app"
		}
	}
	
	stages{
		stage("git checkout"){
			steps{
				sh "chown jenkins:jenkins /app"
			git branch: 'master', credentialsId: 'AvinashK98', url: 'https://github.com/AvinashK98/Application.git'
			}
		}
		
		stage("Docker Image Build"){
			steps{
						sh "docker build -t avinashk98/webapp:v1 ."				
			}
		}
		
		stage("Docker Login"){
			steps{
				sh "docker login -u avinashk98 -p Docker@9087"
			}
		}
		
		stage("Pushing Image to Registry"){
			steps{
				sh "docker push avinashk98/webapp:v1"
			}
		}
		
		stage("Container Deployment"){
			steps{
					sh """
						docker run -dp 90:8080 --name webapp --network mynet avinashk98/webapp:v1
						docker run -dp 3306:3306 --name db -v vol:/var/lib/mysql --network mynet -e MYSQL_ROOT_PASSWORD=12345678 mysql:latest
					
					"""
			}
		}
		
		
	}
}
