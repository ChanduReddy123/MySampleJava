

pipeline{
    agent any
    libraries {
                lib('environment@master')
              }

    stages{
        stage('prepare') {
                            steps {
                                    CheckCommit action: 'check' 
                                    }
         }
        stage('Building'){
            steps{
                    echo "Building the application"
            }
        }
       
    }
    post { always { steps {  CheckCommit action: 'postProcess' } } } 

}
