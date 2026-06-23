# Region is automatically picked from AWS_REGION env var set by aws-actions/configure-aws-credentials
provider "kubectl" {
  host                   = data.terraform_remote_state.eks_infra.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_infra.outputs.cluster_certificate_authority_data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.eks_infra.outputs.cluster_name]
  }
}
