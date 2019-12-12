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
        stage("Testing"){
            steps{
                 if( isStartedByUser ) {
                                    sh """
                                        echo 'This is manual'
                                        """
                                }
                                else{
                                    sh """
                                    echo 'started by webhook'
                                    """
                                }
            }
        }
        }
       
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


