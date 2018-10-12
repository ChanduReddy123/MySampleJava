pipeline {
  agent{
    agent { label 'jenkins_agent1'}
  }
  stages {
    stage('GitCheckout') {
      steps {
        checkout(
          [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ChanduReddy123/MySampleJava.git']]])
      }
    }
    stage('Build') {
      sh'''
      cd SpringMVCSecurityXML/
      mvn clean package
      '''
    }
    stage('Listing') {
      sh'''
      cd target/
      ls
      pwd
      '''
    }
  }
}
