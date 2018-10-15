pipeline {
  agent{
     label 'jenkins_agent1'
  }
  stages {
    stage('GitCheckout') {
      steps {
        checkout scm
      //   checkout(
      //     [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ChanduReddy123/MySampleJava.git']]])
       }
    }
    stage('build'){
      steps {
      sh'''
      TotalWebservers=`docker container ls -a | grep webserver | wc -l`
      docker build -t chanduredy/mybuilder .
       docker run --rm --network chandu --name webserver -p 8888:8080 -d chanduredy/mybuilder

      '''
      }
    }
    stage('CopyArtifacts') {
      steps {
        archiveArtifacts artifacts: '**/*.war', fingerprint: true
      }
    }
    stage('Deploy') {
      agent {
              label 'master'
          }
          steps {
            withCredentials([sshUserPrivateKey(credentialsId: 'Tomcat', keyFileVariable: 'SECRETFILE', passphraseVariable: '', usernameVariable: 'USERNAME')]) {
              script{
                  echo "hello"
                }
        }

      }
    }

  }
}
