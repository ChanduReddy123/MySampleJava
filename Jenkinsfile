

pipeline{
    agent any
    libraries {
                lib('environment@master')
              }

    stages{
        stage('prepare') {
            steps{
                            script {
                                     echo $params
                                    CheckCommit(action: 'check')
                                    }
            }
         }
        stage('Building'){
            steps{
            script{
                    echo "Building the application"
            }
            }
        }
       
    }
    post { always  {  CheckCommit(action: 'postProcess') } } 

}


