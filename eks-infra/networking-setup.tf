module "networking" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/terraform-module-networking.git?ref=v1.1.1"

  # Basic VPC Info
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  eks_node_subnets     = var.eks_node_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  enable_vpn_gateway   = var.enable_vpn_gateway

  # Networking & Logs
  enable_flow_logs         = var.enable_flow_logs
  flow_logs_retention_days = var.flow_logs_retention_days

  # VPC Endpoints
  enable_vpc_endpoints = var.enable_vpc_endpoints
  vpc_endpoints        = var.vpc_endpoints

  # Load Balancers
  enable_network_load_balancer = var.enable_network_load_balancer
  nlb_subnet_ids               = var.nlb_subnet_ids
  nlb_deletion_protection      = var.nlb_deletion_protection
  nlb_access_logs_bucket_name  = var.nlb_access_logs_bucket_name
  nlb_access_logs_prefix       = var.nlb_access_logs_prefix

  enable_alb                  = var.enable_alb
  alb_subnet_ids              = var.alb_subnet_ids
  alb_deletion_protection     = var.alb_deletion_protection
  alb_access_logs_bucket_name = var.alb_access_logs_bucket_name
  alb_access_logs_prefix      = var.alb_access_logs_prefix
  alb_http_enabled            = var.alb_http_enabled
  alb_https_enabled           = var.alb_https_enabled
  alb_certificate_arn         = var.alb_certificate_arn
  alb_ingress_cidr_blocks     = var.alb_ingress_cidr_blocks

  # Istio
  enable_istio_support = var.enable_istio_support

  # Common Tags & Info
  friendly_name = var.friendly_name
  env           = var.env
  bu_id         = var.bu_id
  app_id        = var.app_id
}
