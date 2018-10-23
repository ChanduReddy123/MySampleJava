pipeline {
  agent none
  stages {
    stage('Build') {
      agent{
        //use the name of docker
      docker {
          image 'maven:3-alpine'
          args '-v /home/ubuntu/.m2:/root/.m2'
          label 'jenkins_agent1'
      }
    }
        steps {
        //  checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ChanduReddy123/javasample.git']]])
            sh '''
            cd SpringMVCSecurityXML
            mvn clean package
            touch "thisisjenkinsrunner1"
            '''
        }
    }
    stage('Deploy into container') {
      agent { label 'jenkins_agent1'}
      steps {
        sh'''
        TotalWebservers=`docker container ls -a | grep webserver | wc -l`
        if [ $TotalWebservers -gt 0 ]; then docker container rm -f webserver;fi
         docker run -d --rm --network chandu --name webserver -p 8888:8080 -v $WORKSPACE/../JavaApplication@2/SpringMVCSecurityXML/target:/usr/local/tomcat/webapps/ tomcat:alpine
         touch thisishost
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
            agent {
              docker {
                image 'maven:3-alpine'
                label 'jenkins_agent1'
              }
            }
            steps {
              archiveArtifacts artifacts: '**/*.war', fingerprint: true
            }

        }
        stage('Kill container') {
          agent { label 'jenkins_agent1'}
          steps {
            sh'''
            docker container rm -f webserver
            '''
          }
        }
      }
    }
    stage('Deployment') {
      agent { label 'master'}
      steps {
//        input('this is going to be deployed')
withCredentials([sshUserPrivateKey(credentialsId: 'Tomcat', keyFileVariable: 'KEY', passphraseVariable: '', usernameVariable: 'USERNAME')]) {
    // some block
}

        sh'''

          scp -i $KEY /var/lib/jenkins/jobs/$JOB_NAME/builds/$BUILD_NUMBER/archive/SpringMVCSecurityXML/target/*.war $USERNAME@10.0.0.94:/var/lib/tomcat8/webapps/chandu.war
       '''
      }
    }
    }

  }
