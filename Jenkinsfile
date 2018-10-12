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
        '''
      }
    }
    stage('CopyArtifacts') {
      steps {
        copyArtifacts filter: 'SpringMVCSecurityXML/target/SpringMVCSecurityXML.war', fingerprintArtifacts: true, projectName: 'JavaApplication', selector: lastSuccessful()
      }
    }
  }
}
