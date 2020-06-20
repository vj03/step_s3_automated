pipeline {
  agent any
  parameters {
        string(defaultValue: "", description: '', name: 'CLIENT_ID')
        choice(choices: "CREATE\nDESTROY", description: '', name: 'OPERATION')
        choice(choices: "stage\nprod", description: '', name: 'ENV')
        choice(choices: "demo\n25\n50\n75\n100\n150\n200\n250\n300\n350\n400\n450\n500\n600\n700\n800\n900\n1000", description: '', name: 'INGESTION_PER_DAY')
        string(defaultValue: "", description: '', name: 'CLIENT_NAME')
        string(defaultValue: "", description: '', name: 'CLIENT_CODE')
        string(defaultValue: "", description: '', name: 'BILLING_CODE')
        string(defaultValue: "", description: '', name: 'CIC_OWNER')
        string(defaultValue: "", description: '', name: 'CIC_CSAM')
        string(defaultValue: "", description: '', name: 'CIC_CONTRACT_ID')
        string(defaultValue: "", description: '', name: 'CIC_CONTRACT_EXPIRY')
        string(defaultValue: "", description: '', name: 'CIC_PROJECT')
        string(defaultValue: "", description: '', name: 'CIC_DECOMMISSION_DATE')
        string(defaultValue: "", description: '', name: 'REQUESTED_BY')
        string(defaultValue: "", description: '', name: 'REQUESTED_AT')
        string(defaultValue: "", description: '', name: 'WBS_CODE')
        string(defaultValue: "master", description: '', name: 'BRANCH')
       }

   stages {
     stage("Checking the code") {
       steps {
          sh 'echo "Code checkout"'
          checkout([$class: 'GitSCM', branches: [[name: '*/${BRANCH}']], 
          doGenerateSubmoduleConfigurations: false, extensions: [], 
          submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'vjitwani-GitLab', url: 'git@10.61.65.144:vjitwani/sssp-indexer-s3.git']]])
        }
      }
    stage("Infrastructure Operation") {
      steps {
        wrap([$class: 'BuildUser']) {
          script {
            if ( params.OPERATION == 'CREATE') {
              sh """
                cd $WORKSPACE/ca-central-1/${ENV} && terraform init -backend-config=key=buckets/${CLIENT_ID} && \
                terraform apply --auto-approve -var="client_id=${CLIENT_ID}" \
                  -var="ingestion_rate=${INGESTION_PER_DAY}" \
                  -var="client_name=${CLIENT_NAME}" \
                  -var="client_code=${CLIENT_CODE}" \
                  -var="wbs=${WBS_CODE}" \
                  -var="billing_code=${BILLING_CODE}" \
                  -var="cic_owner=${CIC_OWNER}" \
                  -var="cic_csam=${CIC_CSAM}" \
                  -var="cic_contract_id=${CIC_CONTRACT_ID}" \
                  -var="cic_contract_expiry=${CIC_CONTRACT_EXPIRY}" \
                  -var="cic_project=${CIC_PROJECT}" \
                  -var="cic_decommission_date=${CIC_DECOMMISSION_DATE}" \
                  -var="request_by=${REQUESTED_BY}" \
                  -var="request_at=${REQUESTED_AT}" \
                  -var="deployed_by=$BUILD_USER_ID" \
                   """
               }
 	          else if ( params.OPERATION == 'DESTROY' ) {
              sh """
                cd $WORKSPACE/ca-central-1/${ENV} && \ terraform init -backend-config="key=buckets/${CLIENT_ID}" && \
                terraform destroy --auto-approve -var="client_id=${CLIENT_ID}" \
                  -var="ingestion_rate=${INGESTION_PER_DAY}" \
                  -var="client_name=${CLIENT_NAME}" \
                  -var="client_code=${CLIENT_CODE}" \
                  -var="wbs=${WBS_CODE}" \
                  -var="billing_code=${BILLING_CODE}" \
                  -var="cic_owner=${CIC_OWNER}" \
                  -var="cic_csam=${CIC_CSAM}" \
                  -var="cic_contract_id=${CIC_CONTRACT_ID}" \
                  -var="cic_contract_expiry=${CIC_CONTRACT_EXPIRY}" \
                  -var="cic_project=${CIC_PROJECT}" \
                  -var="cic_decommission_date=${CIC_DECOMMISSION_DATE}" \
                  -var="request_by=${REQUESTED_BY}" \
                  -var="request_at=${REQUESTED_AT}" \
                  -var="deployed_by=$BUILD_USER_ID" \
                 """
              }
           }
        }
     }
   }
 }
}