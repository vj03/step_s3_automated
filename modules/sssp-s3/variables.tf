variable region {}
variable tf-version {
    default = "2.0"
}
variable ami_id {}
variable key_name {}
variable vpc_id {}
variable cic_ip {}
variable ingestion_rate {}

variable client_name {}
variable role {
  default = "splunk-indexer-role"
}
variable policy {
  default = "splunk-indexer-policy"
}
variable sg {
  default = "splunk-indexer-sg"
}
variable client_code {}
variable billing_code {}
variable client_id {}
variable wbs {}
variable cic_owner {}
variable cic_csam {}
variable cic_contract_id {}
variable cic_contract_expiry {}
variable cic_service {
  default = "SSSP"
}
variable cic_project {}
variable cic_decommission_date {}
variable request_by {}
variable request_at {}
variable aws_subnets {}
variable deployed_by {}
variable bucket_append {
  default = "sssp-indexer-data"
}