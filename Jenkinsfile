pipeline {
    agent { dockerfile true }
    parameters {
        string(defaultValue: '', description: 'The artifact to deploy', name: 'artifactName')
        string(defaultValue: '', description: 'The job', name: 'jobName')
        string(defaultValue: '', description: 'The build', name: 'buildNumber')
    }
    stages {
        stage('Pull artifact') {
            steps {
                copyArtifacts filter: '${params.userFlag}', fingerprintArtifacts: true, projectName: '${params.jobName}', selector: specific('${params.buildNumber}')
                sh 'ls -l ${params.userFlag}'
                }
                }
    }
}