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
                                       #echo "build id is ${BUILD_ID}"
                                       #echo "git branch is ${GIT_BRANCH}"
                                       #echo "git commit is ${GIT_COMMIT}"
                                       #echo "git commiter is ${GIT_COMMITTER_NAME}"
                                       #echo "git author name ${GIT_AUTHOR_NAME}"
                                       printenv
                                       
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


