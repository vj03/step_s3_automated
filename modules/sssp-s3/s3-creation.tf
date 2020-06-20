resource "aws_s3_bucket" "sssp-s3" {
  bucket = "${var.client_id}-${var.bucket_append}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

tags = {
        Name = var.client_name
        client_name = var.client_name
        client_code = var.client_code
        billing_code = var.billing_code
        wbs = var.wbs
        cic_owner = var.cic_owner
        cic_csam = var.cic_csam
        cic_contract_id = var.cic_contract_id
        cic_contract_expiry = var.cic_contract_expiry
        cic_service = "SSSP"
        cic_project = var.cic_project
        cic_decommission_date = var.cic_decommission_date
        requested_by = var.request_by
        requested_at = var.request_at
        deployed_at = timestamp()
        deployed_by = var.deployed_by
        region = "ca-central-1"
  }
}

resource "aws_s3_bucket_public_access_block" "sssp-s3-permision" {
  bucket = aws_s3_bucket.sssp-s3.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}