terraform {
backend "s3" {
    bucket = "xxxxxxxxx"
    encrypt = "true"
    region = "ca-central-1"
    }
}
module "sssp-s3" {
    source = "../../modules/sssp-s3"
    region = "xxxxxx"
    vpc_id = "vpc-xxxxxxx"
    client_id = var.client_id
    ingestion_rate = var.ingestion_rate
    client_name = var.client_name
    client_code = var.client_code
    billing_code =  var.billing_code
    wbs = var.wbs
    cic_owner = var.cic_owner
    cic_csam = var.cic_csam
    cic_contract_id = var.cic_contract_id
    cic_contract_expiry = var.cic_contract_expiry
    cic_project = var.cic_project
    cic_decommission_date = var.cic_decommission_date
    request_by = var.request_by
    request_at = var.request_at
    deployed_by = var.deployed_by
    cic_ip = ["xxxxxx","xxxxxx","xxxxxx","xxxxxx"]
    aws_subnets = ["xxxxx","xxxx","xxxxx","xxxxx"]
}

variable client_id {}
variable ingestion_rate {}
variable client_name {}
variable client_code {}
variable billing_code {}
variable wbs {}
variable cic_owner {}
variable cic_csam {}
variable cic_contract_id {}
variable cic_contract_expiry {}
variable cic_project {}
variable cic_decommission_date {}
variable request_by {}
variable request_at {}
variable deployed_by {}
