def ip="1.2.3.4"
//def isStartedByUser = currentBuild.rawBuild.getCause(hudson.model.Cause$UserIdCause) != null
//def user = env.BUILD_USER
pipeline{
    agent any
    libraries {
                lib('environment@master')
              }
    
    stages{
        stage('prepare') {
            steps{
                            script {
                                    //CheckCommit(action: 'check')
                                
                                       sh """
                                      
                                       echo "change author = ${CHANGE_AUTHOR}"
                                       
                                       """
                                    }
            }
         }
        stage('Building'){
            steps{
            script{
                    sh '''
                        echo $ip
                   '''
            }
            }
        }
       
    }
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


