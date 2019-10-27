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
                script {
                 [$class: 'CopyArtifact',
                 projectName: "${jobName}"];
                 }
                }
                }
        stage('Verifying Artifacts') {
            steps {
                echo "${artifactName}"
                echo "${jobName}"
                sh 'ls -l'
            }
        }
    }
}