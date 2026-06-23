module "orchestrator_custom_addons" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/orchestrator-custom-addons.git?ref=v1.2.0"

  # Org info
  env    = var.env
  bu_id  = var.bu_id
  app_id = var.app_id
  tags   = var.tags

  # Cluster info — sourced from eks_infra remote state
  cluster_name                       = data.terraform_remote_state.eks_infra.outputs.cluster_name
  cluster_endpoint                   = data.terraform_remote_state.eks_infra.outputs.cluster_endpoint
  cluster_certificate_authority_data = data.terraform_remote_state.eks_infra.outputs.cluster_certificate_authority_data
  cluster_oidc_provider_arn          = data.terraform_remote_state.eks_infra.outputs.cluster_oidc_provider_arn
  cluster_oidc_issuer_url            = data.terraform_remote_state.eks_infra.outputs.cluster_oidc_issuer_url

  # Platform config
  domain_url = var.domain_url

  # Addon toggles
  enable_istio      = var.enable_istio
  enable_kiali      = var.enable_kiali
  enable_argocd     = var.enable_argocd
  enable_prometheus = var.enable_prometheus
  enable_eso        = var.enable_eso
  enable_ecr        = var.enable_ecr
  enable_crossplane = var.enable_crossplane

  # Addon versions
  istio_version                   = var.istio_version
  kiali_version                   = var.kiali_version
  argocd_version                  = var.argocd_version
  prometheus_version              = var.prometheus_version
  eso_helm_version                = var.eso_helm_version
  crossplane_version              = var.crossplane_version
  crossplane_provider_aws_version = var.crossplane_provider_aws_version
}
