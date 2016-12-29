#!groovy​

stage('get code'){ 
  node('generic'){
    git 'https://github.com/marcocaberletti/docker.git'
    stash name: "source", inlude: "./*"
  }
}

stage('create Docker images'){
  parallel(
      "kube-docker-runner" : { build_image('kube-docker-runner') },
      "kube-kubectl-runner": { build_image('kube-kubectl-runner') },
      "kube-maven-runner"  : { build_image('kube-maven-runner') },
      "elasticsearch"      : { build_image('elasticsearch') },
      "kibana"             : { build_image('kibana') },
      )
}

def build_image(image){
  node('docker'){
    unstash "source"
    
    dir(image){
      sh "./build-image.sh"
      sh "./push-image.sh"
    }
  }
}