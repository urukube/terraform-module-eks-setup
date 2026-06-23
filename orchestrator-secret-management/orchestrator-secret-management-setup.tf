module "orchestrator_secret_management" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/orchestrator-secret-management.git?ref=v1.2.1"

  secretlist    = var.secretlist
  secret_values = var.secret_values
  tags          = merge(var.tags, { env = var.env })
}
