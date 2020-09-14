@Library('test-lib') _

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

    // triggers {
   	// 	githubPush()
    // }

 //    triggers {
	//   githubPullRequests events: [Open(), commitChanged(), commentPattern('rebuild')], spec: '', triggerMode: 'HEAVY_HOOKS'
	// }

    stages {
        stage("Checkout") {
            steps{
                // checkout(env.GIT_BRANCH)
				script{
					logs.checkout(env.GIT_BRANCH)
					sh """
						ls -la
					"""
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
				}
            }
        }

        stage ('Unit Testing') {
            steps{
                echo "Testing"
                echo env.GIT_BRANCH
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
    	stage ('Integration Testing') {
	     	when {
		        expression {
		          env.BRANCH_NAME ==~ /(PR-*|develop|dit|staging|master).*/
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



def echoerrrr(message) {
	sh "echo Hi this iss ${message}"
}

def checkout(String branch) {
    echo "Checking out branch ${branch}"
    checkout([
        $class: 'GitSCM',
        branches: [
            [
                name: "${branch}"
            ]
        ],
        doGenerateSubmoduleConfigurations: false,
        extensions: [],
        submoduleCfg: [],
        userRemoteConfigs: [
            [
                credentialsId: 'private-repo',
                url: env.GIT_URL
            ]
        ]
    ])
}
