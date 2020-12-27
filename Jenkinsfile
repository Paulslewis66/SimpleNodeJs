pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/Paulslewis66/SimpleNodeJs.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("paulslewis66/simplenodejs:${env.BUILD_ID}")
                }
            }
        }
    
 
      stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker') {            
              app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
              }    
           }
      

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "deploy.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
