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
    stage('Build and Deploy in test ENV'){
      steps {
      sh'''
      TotalWebservers=`docker container ls -a | grep webserver | wc -l`
      if [ $TotalWebservers -gt 0 ]; then docker container rm -f webserver;fi
      docker build -t chanduredy/mybuilder .
      mkdir -p $WORKSPACE/artifacts
       docker run --rm --network chandu --name webserver -p 8888:8080 -d  chanduredy/mybuilder
       docker cp webserver:/usr/local/tomcat/webapps/chandu.war $WORKSPACE/artifacts

      '''
      }
    }
    stage('CopyArtifacts') {
      steps {
        archiveArtifacts artifacts: '**/*.war', fingerprint: true
      }
    }
    stage('Deploy') {
      agent { label 'master'}
      steps {
        input('this is going to be deployed')
      sh'''
        echo "this is $WORKSPACE"
        pwd
        '''
      }
    }
    }

  }
