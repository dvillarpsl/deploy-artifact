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
                 step ([$class: 'CopyArtifact',
                 projectName: 'movie-analyst-api',
                 filter: "**/*.tgz",
                 target: 'package']);
             }
         }
        }
    stage('Create Packer AMI') {
        steps {
          withCredentials([
            usernamePassword(credentialsId: 'ada90a34-30ef-47fb-8a7f-a97fe69ff93f', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ]) {
            sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer/packer.json'
        }
      }
    }
    }
}