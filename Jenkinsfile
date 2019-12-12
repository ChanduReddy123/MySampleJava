def ip="1.2.3.4"
def isStartedByUser = true
if ( currentBuild.rawBuild.getCauses()[0].toString().contains('UserIdCause') ){
    isStartedByUser = false
}
//def user = currentBuild.rawBuild.getCauses()[0].toString()
//def user = currentBuild.rawBuild.toString()
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
                                
                                if( isStartedByUser ) {
                                 echo "manual"   
                                }
                                else{
                                    echo "started by webhook"
                                }
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


