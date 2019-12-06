@Library("environment") _

pipeline{
    agent any
    stages{
        stage("A"){
            steps{
                def env = getEnvironment('master');
                 println($env);
                 withCredentials([sshUserPrivateKey(credentialsId: 'PEM', keyFileVariable: 'pem')]) {
                   
                    sh '''
                        ls
                        echo "not at all" > 1
                        
                        
                        #scp -i $pem -o StrictHostKeyChecking=no 1 ubuntu@34.208.103.36:~
                        #ssh -i $pem  -o StrictHostKeyChecking=no  ubuntu@34.208.103.36 'cat 1'
                    '''
            }
            }

        }
    }

}
