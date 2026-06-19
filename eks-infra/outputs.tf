output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks_infra.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = module.eks_infra.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with your cluster."
  value       = module.eks_infra.cluster_certificate_authority_data
}

output "cluster_oidc_provider_arn" {
  description = "The ARN of the OIDC Provider for the EKS cluster"
  value       = module.eks_infra.cluster_oidc_provider_arn
}

output "cluster_oidc_issuer_url" {
  description = "The URL of the OIDC Issuer for the EKS cluster"
  value       = module.eks_infra.cluster_oidc_issuer_url
}

output "cluster_service_cidr" {
  description = "The CIDR block for Kubernetes services"
  value       = module.eks_infra.cluster_service_cidr
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}
