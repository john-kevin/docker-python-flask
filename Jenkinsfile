@Library('ea-jenkins-shared-library') _
def KEV = ''

pipeline{
	// agent {
	//    	label 'staging'
	// }
	agent {
        node{
            label 'master'
            customWorkspace "/var/lib/jenkins/workspace/docker-python-flask/${env.BRANCH_NAME}"
        }
    }

 //    triggers {
	//   githubPullRequests events: [Open(), commitChanged(), commentPattern('rebuild')], spec: '', triggerMode: 'HEAVY_HOOKS'
	// }

    stages {
        stage("Checkout") {
            steps{
                // checkout(env.GIT_BRANCH)
				script{
					// logs.checkout(env.GIT_BRANCH)
					// sh """
					// 	ls -la
					// """
					// BUILD_DATA = logs.initialize(env.GIT_BRANCH)
					// echo "${BUILD_DATA}"
				}

			// sh """
			// 	git diff-tree --name-only HEAD
			// 	git --no-pager diff --name-only origin/${env.GIT_BRANCH} datastore
			// """
            }
        }
        stage("Build") {
            steps{
                echo "BUILD"
				println 'kevin'
				script{
					logs.info 'test from pipeline to lib'
					KEV = logs.printer('kevin')
					echo "${KEV['red']}"
				}
            }
        }
        stage("SonarQube Analysis") {
            steps{
                echo "Sonarqube Analysis"
            }
            post{
                always{
                    echo "***********Done Build"
                }
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
