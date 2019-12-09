

pipeline{
    agent any
    libraries {
                lib('environment@master')
              }

    stages{
        stage('prepare') {
                            script {
                                    CheckCommit(action: 'check')
                                    }
         }
        stage('Building'){
            script{
                    echo "Building the application"
            }
        }
       
    }
    post { always { steps {  CheckCommit(action: 'postProcess') } } } 

}
