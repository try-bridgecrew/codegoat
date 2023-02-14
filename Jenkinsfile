pipeline {
    agent any

    environment {
        PRISMA_API_URL="https://api.eu.prismacloud.io"
    }

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }


    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            checkout scm
                        }
                    }
                }
            }
        stage('Checkov') {
            steps {
                withCredentials([string(credentialsId: 'PC_USER', variable: 'pc_user'),string(credentialsId: 'PC_PASSWORD', variable: 'pc_password')]) {
                    script {
                        docker.image('bridgecrew/checkov:latest').inside("--entrypoint=''") {
                          unstash 'source'
                          try {
                              sh 'checkov -d . --use-enforcement-rules -o cli -o junitxml --output-file-path console,results.xml --bc-api-key \$\{pc_user}::\$\{pc_password} --repo-id  jamcg/codegoat --branch main'
                              junit skipPublishingChecks: true, testResults: 'results.xml'
                          } catch (err) {
                              junit skipPublishingChecks: true, testResults: 'results.xml'
                              throw err
                          }
                        }
                    }
                }
            }
        }

        stage('Plan') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                dir('drift') {
                  sh 'terraform init -input=false'
                  sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'
                  sh "terraform plan -input=false -out tfplan "
                  sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
               not {
                    equals expected: true, actual: params.destroy
                }
           }
           
                
            

           steps {
                dir('drift') {
                    script {
                        def plan = readFile 'tfplan.txt'
                        input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                    }
                }
           }
       }

        stage('Apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                dir('drift') {
                  sh "terraform apply -input=false tfplan"
                }
            }
        }
        
        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
        
            steps {
                dir('drift') {
                sh "terraform destroy --auto-approve"
                }
            }
        }
    }
    options {
        preserveStashes()
        timestamps()
    }
}