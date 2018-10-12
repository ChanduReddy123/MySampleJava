pipeline {
  agent{
    agent { label 'jenkins_agent1'}
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
      '''
    }
    }
    stage('Listing') {
      steps {
        sh'''
        #!/bin/sh
        cd target/
        ls
        pwd
        '''
      }
    }
  }
}
