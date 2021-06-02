pipeline { 

    environment { 

        registry = "sgupta0712/hellowhale:latest" 

        registryCredential = 'dockerhub_id' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/Surbhi0712/master.git' 

            }

        } 

        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 
        stage('Deploy App') {
            steps {
               script {
                   kubernetesDeploy(configs: "pods.yml", kubeconfig(credentialsId: '1dfa946a-abd3-4e48-a2b3-c98c43d77327', serverUrl: 'https://127.0.0.1') {
                      // some block
                   }
                )
            }

        }
    }
}
    }   
