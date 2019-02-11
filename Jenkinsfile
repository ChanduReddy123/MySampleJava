pipeline {
  agent master
  stages {
    stage('Build') {
      
        steps {
        //  checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ChanduReddy123/javasample.git']]])
            sh '''
            echo "this is in build stage"
            '''
        }
    }
    stage('Deploy into container') {

      steps {
        sh'''
        echo "this is in Deploy"
        '''
      }
    }
    stage('Test Env Approval')
    {
      agent { label 'master'}

      steps {
        input('Are we good to deploy in Prod environment')
        //kill the container
      }

    }
    stage('cleaning agent') {
      parallel{
        stage('copy')
        {
            steps {
              echo "copy the artifacts "
            }

        }
        stage('Kill container') {
          steps {
            sh'''
            echo "kill the contianer "
            '''
          }
        }
      }
    }
    stage('Deploying to Prod server') {
      agent { label 'master'}
      steps {
        sh'''
        echo "Depoly to prod server"
        '''
      }
    }
    }

  }
