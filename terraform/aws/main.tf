
# Terraform sample for provider setup
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "dr_backup" {
  bucket = "my-dr-backup-bucket"
}
