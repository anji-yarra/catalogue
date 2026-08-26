@Library('jenkins-shared-library') _

def configMap = [
    projectName: "roboshop",
    componentName: "catalogue"
]

if (env.BRANCH_NAME.equalsIgnoreCase('main')) {
    echo "This is the main branch. Skipping the pipeline."
} else {
    nodejsEKSPipeline(configMap)
}

/* testPipeline(configMap) */