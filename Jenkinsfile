@Library('jenkins-shared-library') _

def configMap = [
    project: "roboshop",
    component: "catalogue"
]

if (env.BRANCH_NAME.equalsIgnoreCase('main')) {
    echo "This is the main branch. Skipping the pipeline."
} else {
    nodejsEKSPipeline(configMap)
}

/* testPipeline(configMap) */