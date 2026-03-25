pipeline{
	agent{
		node{
			label "built-in"
		}
	}
	
	stages{
		/* stage("git checkout"){
			steps{
				sh "sudo chown jenkins:jenkins /app"
			git branch: 'master', credentialsId: 'AvinashK98', url: 'https://github.com/AvinashK98/Application.git'
			}
		}
		*/
		stage("Code-Scanner"){
			steps{
					sh """
					mvn clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar \
  						-Dsonar.projectKey=LoginWebApp \
 					    -Dsonar.projectName='LoginWebApp' \
  						-Dsonar.host.url=http://13.201.186.113:9000 \
  						-Dsonar.token=sqp_6ce2d0a84ac5f38bf4de51366f4ba2361c627702
					"""
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
