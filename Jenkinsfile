pipeline {
    agent any
         stages {
             stage("code download"){
                   steps{
                      git 'https://github.com/intelliqittrainings/maven.git'
                 }
             }
             stage("build the code"){
                   steps{
                      sh 'mvn package'
                 }
             }
             stage("copy artifact to jenkins job"){
                  steps{
                      sh 'cp -r /home/ubuntu/.jenkins/workspace/endtoend/webapp/target/webapp.war /home/ubuntu/.jenkins/workspace/endtoend'
                  }
             }
             stage("design and build Dockerfile"){
                 steps {
                     sh 'ls -la'
                     sh 'docker build -t myimage .'
                     sh 'docker tag myimage venkatasundeep/myimage'
                     sh 'docker login -u venkatasundeep -p Sandeep@2023'
                     sh 'docker push venkatasundeep/myimage'
                     
                 }
             }
             
         }
}
