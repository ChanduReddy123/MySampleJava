def ip="1.2.3.4"
def isStartedByUser = false
if ( currentBuild.rawBuild.getCauses()[0].toString().contains('UserIdCause') ){
    isStartedByUser = true
}
//def user = currentBuild.rawBuild.getCauses()[0].toString()
//def user = currentBuild.rawBuild.toString()
pipeline{
    
    agent any
    libraries {
                lib('environment@master')
              }
    
    stages{
        stage("Manual"){
           when {
               expression { isStartedByUser == false }
           }
            steps{
                    sh """
                        echo "This is in webhook"
                    """
            }
        }
        stage("WebHook"){
            when {
               expression { isStartedByUser == true }
           }
            steps {
                sh '''
                    echo "this is manual"
                    '''
            }
        }
        
        }
       
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


