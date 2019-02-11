pipeline {
  agent any
  stages {
    stage('GitCheckout') {
      steps {
        sh'''
         echo 'this is checkout '
        '''
      }
    }
    stage('Build') {
      steps{
              sh'''
              cd SpringMVCSecurityXML/
              pwd
              '''
        }
    }
    stage('Listing') {
      steps{
          sh'''
         # cd target/
          ls
          pwd
          '''
      }
    }
  }
}
