
# Terraform sample for provider setup
provider "azurerm" {
  region = "us-east-1"
}

resource "azurerm_s3_bucket" "dr_backup" {
  bucket = "my-dr-backup-bucket"
}
