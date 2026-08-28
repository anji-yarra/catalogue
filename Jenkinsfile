@Library('jenkins-shared-library') _

def configMap = [
    project: "roboshop",
    component: "catalogue"
]

nodejsEKSPipeline(configMap)

/*Use this condition when you work with feature branches and want to skip the pipeline for main branch.*/

/* if (env.BRANCH_NAME.equalsIgnoreCase('main')) {
    echo "This is the main branch. Skipping the pipeline."
} else {
    nodejsEKSPipeline(configMap)
} */

/* testPipeline(configMap) */