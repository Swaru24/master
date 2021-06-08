node{
    
    stage("Git Clone"){
        git credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/Surbhi0712/master.git'
    }
    
    stage("Build Docker image"){
        sh "docker build -t sgupta0712/myweb ."
    }
    
    stage("Docker Push"){
        withCredentials([string(credentialsId: 'DOCKER_HUB_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
        sh "docker login -u sgupta0712 -p ${DOCKER_HUB_CREDENTIALS}"
    }
        sh "docker push sgupta0712/myweb "
    }
    /** 
    stage("Deploy Application in K8S Cluster"){
         kubernetesDeploy(
             configs: 'pods.yml',
             kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
             enableConfigSubstitution: true
             
        )
        
    } 
    **/
    
    stage("Deploy To kubernetes cluster"){
        sh 'kubectl apply -f pods.yml'
    }

    
}
