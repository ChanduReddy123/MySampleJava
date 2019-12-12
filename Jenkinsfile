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
           
            steps{
                    sh """
                        echo "$isStartedByUser"
                    """
            }
        }
        stage("WebHook"){
            steps {
                sh '''
                    echo "this is webhook"
                    '''
            }
        }
        
        }
       
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


