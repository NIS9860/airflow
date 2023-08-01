pipeline {
    agent any
    stages{
        stage("Cloning Code"){
            steps{
                echo "Cloning code from Github."
                git url: "https://github.com/NIS9860/airflow.git", branch:"main"
            }
        }
        
        stage("Building Code"){
            steps{
                echo "Building code with docker."
                sh "docker build -t airflow-web-app ."
            }
        }
        
        stage("Pushing Code"){
            steps{
                echo "Pushing code to Dockerhub."
                withCredentials([usernamePassword(credentialsId:"dockerhub",usernameVariable:"dockerUser",passwordVariable:"dockerPass")]){
                sh "docker tag airflow-web-app ${env.dockerUser}/airflow-web-app:latest"
                sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                sh "docker push ${env.dockerUser}/airflow-web-app:latest"
                }
            }
        }
        
        stage("Deploying Containers"){
            steps{
                echo "Deploying container od airflow-mysqldb and airflow-app"
                sh "docker compose up -d"
            }
        }
    }
}
