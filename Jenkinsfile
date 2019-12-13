def ip="0.0.0.0"

def getBranch(){
 return scm.branches[0].name
}
def getIP(){
                         if ( BRANCH_NAME == "master" ){
                          ip = ${env.Development}
                         }
                         else{
                              ip = "2.34.5"
                         }
}
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
        stage("Webhook"){
//           when {
//               expression { isStartedByUser == false }
 //          }
            
             
            steps{
              script{
                //echo "${BRANCH_NAME}"
               def result = getIP()
                    sh """
                        echo "This is in webhook"
                        echo "${result}"
                    """
              }
            }
        }


        //we need to use or condition for manual and changeset  with or codition 
        stage("Anomaly"){
            when {
                    anyOf {
                                expression { isStartedByUser == true };
                                changeset "./Anomaly.txt"

                    }
            }
            steps {
                sh '''
                    echo "this is manual"
                    echo "this is anomaly"
                    '''
            }
        }

        stage("Risk"){
            when {
                    anyOf {
                                expression { isStartedByUser == true };
                                changeset "./Risk.txt"

                    }
            }
            steps {
                sh '''
                    echo "this is manual"
                    echo "this is Risk"
                    '''
            }
        }
        
        }
       
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


