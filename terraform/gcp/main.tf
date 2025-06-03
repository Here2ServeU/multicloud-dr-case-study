
# Terraform sample for provider setup
provider "google" {
  region = "us-east-1"
}

resource "google_s3_bucket" "dr_backup" {
  bucket = "my-dr-backup-bucket"
}
