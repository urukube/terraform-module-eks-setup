module "eks_essential_addons" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/terraform-module-essential-addons.git?ref=v1.0.1"

  # Basic Cluster Info
  env    = var.env
  bu_id  = var.bu_id
  app_id = var.app_id

  # Essential Addons - Values from remote state
  cluster_name                       = data.terraform_remote_state.eks_infra.outputs.cluster_name
  cluster_endpoint                   = data.terraform_remote_state.eks_infra.outputs.cluster_endpoint
  cluster_certificate_authority_data = data.terraform_remote_state.eks_infra.outputs.cluster_certificate_authority_data
  cluster_oidc_provider_arn          = data.terraform_remote_state.eks_infra.outputs.cluster_oidc_provider_arn
  cluster_oidc_issuer_url            = data.terraform_remote_state.eks_infra.outputs.cluster_oidc_issuer_url

  vpc_id                    = data.terraform_remote_state.eks_infra.outputs.vpc_id
  cluster_service_ipv4_cidr = data.terraform_remote_state.eks_infra.outputs.cluster_service_cidr

  tags = var.tags
}
