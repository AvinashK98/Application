pipeline{

            agent {
                     node {
                            label 'built-in'
                            customWorkspace '/mnt/build'
                         }
                    }

            tools{
                maven 'maven'
                git 'git'
            }

            stages{
                stage('Checkout'){
                    steps{
                        git branch: 'master', url: 'https://github.com/AvinashK98/Application.git'
                    }
                }
                stage ('CLEAN_OLD_M2') {
			     steps {
				    sh "rm -rf /home/saccount/.m2/repository"
                 }
			}
                stage('maven-Build'){
                    steps{
                    sh 'mvn clean install'
                }
                 }
                stage('Docker image build'){
                    steps{
                    sh 'docker build -t avinashk98/my_appl:1.0 .'
                }
            }

            stage('Image push to DockerHub'){
                    steps{
                    sh 'docker push avinashk98/my_appl:1.0'
                }
            }

            }
            
      }


            
