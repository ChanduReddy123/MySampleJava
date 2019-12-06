

pipeline{
    agent any
    libraries {
            lib('environment@master')
                }

    stages{
        stage("A"){
            
            steps{
                 withCredentials([sshUserPrivateKey(credentialsId: 'PEM', keyFileVariable: 'pem')]) {
                     script {
                         def env = test('master')
                         
                        sh '''
                        echo ${env}
                        echo $env
                        ls
                        echo "not at all" > 1
                        cat 1
                        

                        #scp -i $pem -o StrictHostKeyChecking=no 1 ubuntu@34.208.103.36:~
                        #ssh -i $pem  -o StrictHostKeyChecking=no  ubuntu@34.208.103.36 'cat 1'
                    '''
                     }
            }
            }

        }
    }

}
