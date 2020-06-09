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
    	stage ('Build') {
    		steps{
    			echo "Building"
    		}
    	} 
    	
    	stage ('Testing') {
    		steps{
    			echo "Testing"
    			echo env.GIT_BRANCH
    		}
    	} 

    	stage ('Deploy') {
    		steps{
    			script{
    				echo "Deployable"
  					// BRANCH_NAME  = env.GIT_BRANCH

  					// if (BRANCH_NAME == 'master' || BRANCH_NAME == 'staging') {
  					// 	echo "Deploy"
  					// }
		  		}
    		}
		    when {
		      branch comparator: 'EQUALS', pattern:  'master'
		      beforeAgent true
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
}


                       
def tupan(message) {
	sh "echo Hi this iss ${message}"	
}