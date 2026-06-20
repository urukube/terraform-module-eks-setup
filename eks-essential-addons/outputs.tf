output "cluster_autoscaler_iam_role_arn" {
  description = "ARN of the IAM role for Cluster Autoscaler"
  value       = module.eks_essential_addons.cluster_autoscaler_iam_role_arn
}

output "cluster_autoscaler_release_name" {
  description = "Name of the Cluster Autoscaler Helm release"
  value       = module.eks_essential_addons.cluster_autoscaler_release_name
}

output "vpc_cni_iam_role_arn" {
  description = "ARN of the IAM role for VPC CNI"
  value       = module.eks_essential_addons.vpc_cni_iam_role_arn
}

output "vpc_cni_release_name" {
  description = "Name of the VPC CNI Helm release"
  value       = module.eks_essential_addons.vpc_cni_release_name
}

output "coredns_release_name" {
  description = "Name of the CoreDNS Helm release"
  value       = module.eks_essential_addons.coredns_release_name
}

output "aws_lb_controller_iam_role_arn" {
  description = "ARN of the IAM role for AWS Load Balancer Controller"
  value       = module.eks_essential_addons.aws_lb_controller_iam_role_arn
}

output "aws_lb_controller_release_name" {
  description = "Name of the AWS Load Balancer Controller Helm release"
  value       = module.eks_essential_addons.aws_lb_controller_release_name
}

output "metrics_server_release_name" {
  description = "Name of the Metrics Server Helm release"
  value       = module.eks_essential_addons.metrics_server_release_name
}

output "pod_identity_agent_addon_version" {
  description = "Version of the EKS Pod Identity Agent addon"
  value       = module.eks_essential_addons.pod_identity_agent_addon_version
}
