pipeline {
  agent{
     label 'jenkins_agent1'
  }
  stages {
    //create the docker agent with name here


    // stage('GitCheckout') {
    //   steps {
    //     checkout scm
    //   //   checkout(
    //   //     [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ChanduReddy123/MySampleJava.git']]])
    //    }
    // }
    // stage('Build and Deploy in test ENV'){
    //   steps {
    //   sh'''
    //   TotalWebservers=`docker container ls -a | grep webserver | wc -l`
    //   if [ $TotalWebservers -gt 0 ]; then docker container rm -f webserver;fi
    //   docker build -t chanduredy/mybuilder .
    //   mkdir -p $WORKSPACE/artifacts
    //    docker run --rm --network chandu --name webserver -p 8888:8080 -d  chanduredy/mybuilder
    //    docker cp webserver:/usr/local/tomcat/webapps/chandu.war $WORKSPACE/artifacts
    //
    //   '''
    //   }
    // }
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
      steps {
        sh'''
        TotalWebservers=`docker container ls -a | grep webserver | wc -l`
        if [ $TotalWebservers -gt 0 ]; then docker container rm -f webserver;fi
         docker run -d --rm --network chandu --name webserver -p 8888:8080 -v $WORKSPACE/../JavaApplication@2/SpringMVCSecurityXML/target:/usr/local/tomcat/webapps/ tomcat:alpine
         touch "thisishost"
        '''
      }
    }
    stage('Test Env Approval')
    {

      steps {
        input('Are we good to deploy in Prod environment')
        //kill the container
      }

    }
    stage('CopyArtifacts') {
      agent{
        docker {
            image 'maven:3-alpine'
            args '-v /home/ubuntu/.m2:/root/.m2'
            label 'jenkins_agent1'
        }
      }
      steps {
        //use that container name
        archiveArtifacts artifacts: '**/*.war', fingerprint: true
        //copyArtifacts filter: '*.war', fingerprintArtifacts: true, projectName: 'JavaApplication', selector: lastSuccessful()
      }
    }
    stage('Deploy') {
      agent { label 'master'}
      steps {
      //  input('this is going to be deployed')
      sh'''
        echo "this is $WORKSPACE"
        pwd
        cd /var/lib/jenkins/jobs/$JOB_NAME/builds/$BUILD_NUMBER/archive/artifacts/
        ls

        '''
      }
    }
    stage('Conformation')
    {
      steps {
        sh'''
        curl ipconfig.io
        echo "application is deployed in `curl ipconfig.io`"
        echo "`curl ipcofig.io`:8888"
        '''
      }
    }
    }

  }
