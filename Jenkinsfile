pipeline{

	// agent {
	//    	label 'staging'
	// }

	agent any

    // triggers {
   	// 	githubPush()
    // }

 //    triggers {
	//   githubPullRequests events: [Open(), commitChanged(), commentPattern('rebuild')], spec: '', triggerMode: 'HEAVY_HOOKS'
	// }

    stages {
    	stage ('Checkout') {
    		steps{
    			echo "Building"
    			checkout([
                    $class: 'GitSCM', 
                    branches: [
                        [
                            name: env.GIT_BRANCH
                        ]
                    ], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [
                        [
                            credentialsId: 'private-repo', 
                            url: 'git@github.com:john-kevin/docker-python-flask.git']
                        ]
                    ])
    		}
    	} 
    	
    	stage ('Unit Testing') {
    		steps{
    			echo "Testing"
    			echo env.GIT_BRANCH
    		}
    	} 

    	stage ('Integration Test Testing') {
	     	when {
		        expression {
		          env.BRANCH_NAME ==~ /(PR-*|develop|dit|staging).*/
		        }
     		}
    		steps{
    			echo "Integration"
    			echo env.GIT_BRANCH
    		}
    	} 

    	stage ('Deploy') {
	     	when {
		        expression {
		          env.BRANCH_NAME ==~ /(develop|dit|staging).*/
		        }
     		}
     		steps {
     			echo "Deploying"
     		}
		}
	  // stage('build docker') {
	  //   steps {
			// sh """
			//     docker stop py-api
			//     docker rm py-api
			// 	bash run.sh
			// """
	  //    echo "${GIT_COMMIT[0..6]}"
	  //    echo "${GIT_COMMIT}"
	  //    tupan('Tupan JONESd!')
	  //   }

	  //   when {
	  //     branch comparator: 'EQUALS', pattern: 'master'
	  //     beforeAgent true
	  //   }
	  // }
	}
    // post {
    //     always {
    //         cleanWs()
    //     }
    // }
}


                       
def tupan(message) {
	sh "echo Hi this iss ${message}"	
}