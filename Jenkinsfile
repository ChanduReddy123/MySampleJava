pipeline {
  agent{
    agent any
  }
  stages {
    stage('GitCheckout') {
      steps {
        sh'''
         echo 'this is checkout '
        '''
      }
    }
    stage('Build') {
      sh'''
      cd SpringMVCSecurityXML/
      pwd
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
