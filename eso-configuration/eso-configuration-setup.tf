module "eso_configuration" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/orchestrator-eso-config.git?ref=v1.0.0"

  aws_region               = var.region
  eso_namespace            = var.eso_namespace
  eso_service_account_name = var.eso_service_account_name
  refresh_interval         = var.refresh_interval
  external_secrets         = var.external_secrets
}
