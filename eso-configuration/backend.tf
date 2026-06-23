# Partial backend configuration
# bucket and key are provided dynamically during terraform init:
#   terraform init -backend-config="bucket=<bucket-name>" -backend-config="key=<tfvars-name>/terraform.tfstate"
terraform {
  backend "s3" {
    # region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
