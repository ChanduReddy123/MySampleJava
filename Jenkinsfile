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
    stage('Build') {
      steps {
      sh'''
      #!/bin/sh
      cd SpringMVCSecurityXML/
      mvn clean package
      pwd
      export name=ChanduReddy123
      echo $name
      '''
    }
    }
    stage('Listing') {
      steps {
        sh'''
        #!/bin/sh
        cd SpringMVCSecurityXML/target/
        ls
        pwd
        echo $name
        '''
      }
    }
    stage('CopyArtifacts') {
      steps {
        archiveArtifacts artifacts: '**/*.war', fingerprint: true
      }
    }
    stage('Deploy') {
      steps {
        sh '''
        pwd
        ls
        '''
      }
    }

  }
}
