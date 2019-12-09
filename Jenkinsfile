

pipeline{
    agent any
    libraries {
                lib('environment@master')
              }

    stages{
        stage('prepare') {
                            steps {
                                    ciSkip action: 'check' 
                                    }
         }
        stage('Building'){
            steps{
                    echo "Building the application"
            }
        }
       
    }
    post { always { steps {  ciSkip action: 'postProcess' } } } 

}
