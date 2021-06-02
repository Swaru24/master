pipeline {
    agent any
    environment{
        DOCKER_TAG = getDockerTag()
    }
    stages{
        stage('Build Docker Image'){
            steps{
                sh "docker build . -t sgupta0712/my-Firstapp:${DOCKER_TAG} "
            }
        }
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "docker login -u sgupta0712 -p ${dockerHubPwd}"
                    sh "docker push sgupta0712/my-Firstapp:${DOCKER_TAG}"
                }
            }
        }
        stage('Deploy to DevServer'){
            steps{
                sshagent (credentials: ['dev-server']) {
				    script{
					    sh returnStatus: true, script: 'ssh ubuntu@13.126.143.0 docker rm -f my-Firstapp'
						def runCmd = "docker run -d -p 8080:8080 --name=my-Firstapp kammana/nodeapp:${DOCKER_TAG}"
						sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.143.0 ${runCmd}"
					}
				}
            }
        }
    }
}

def getDockerTag(){
    def tag  = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
