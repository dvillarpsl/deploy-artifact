pipeline {
    agent {
        docker {
            image 'goforgold/build-container:latest'
        }
    }
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
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'ada90a34-30ef-47fb-8a7f-a97fe69ff93f',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
            sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer/packer.json'
        }
      }
    }
    }
}