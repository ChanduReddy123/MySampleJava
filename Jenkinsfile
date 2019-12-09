

pipeline{
    agent any
    libraries {
            lib('environment@master')
                }

    stages{
        stage("A"){
            
            steps{
                     script {
                         def env = test('master')
                         sh """
                         echo $env
                         """
                     }
            
            }

        }
    }

}
