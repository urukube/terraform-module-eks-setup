module "argocd_configuration" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/argocd-configuration.git?ref=v1.2.0"

  github_org               = var.github_org
  github_token_secret_name = var.github_token_secret_name
  github_token_secret_key  = var.github_token_secret_key
}
