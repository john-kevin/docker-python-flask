pipeline{
	agent {
	   	label 'staging'
	}
    triggers {
   		githubPush()
    }
	stages {
	  stage('build docker') {
	    steps {
			sh """
			    docker stop py-api
			    docker rm py-api
				bash run.sh
			"""
	     // echo "${GIT_COMMIT[0..6]}"
	     // echo "${GIT_COMMIT}"
	     // tupan('Tupan JONESd!')
	    }

	    when {
	      branch comparator: 'EQUALS', pattern: 'master'
	      beforeAgent true
	    }
	  }
	}
}


                       
def tupan(message) {
	sh "echo Hi this is ${message}"	
}