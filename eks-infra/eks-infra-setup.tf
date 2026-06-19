module "eks_infra" {
  # checkov:skip=CKV_TF_1:Using version tags instead of commit hashes
  # checkov:skip=CKV_TF_2:Intentional floating major version tag — tracks latest v1.x.x release
  source = "git::https://github.com/urukube/terraform-module-eks.git?ref=v1.0.2"

  # Basic Cluster Info
  friendly_name              = var.friendly_name
  cluster_kubernetes_version = var.cluster_kubernetes_version
  env                        = var.env
  bu_id                      = var.bu_id
  app_id                     = var.app_id

  # Networking (From Networking Module)
  vpc_id                           = module.networking.vpc_id
  cluster_control_plane_subnet_ids = module.networking.eks_node_subnet_ids
  private_subnet_ids               = module.networking.eks_node_subnet_ids
  private_subnet_cidrs             = module.networking.eks_node_subnet_cidrs

  # Security Groups (From Networking Module)
  node_security_group_id          = module.networking.node_security_group_id
  control_plane_security_group_id = module.networking.control_plane_security_group_id

  # Node Config
  ami_type           = var.ami_type
  node_instance_type = var.node_instance_type
  min_size           = var.min_size
  max_size           = var.max_size
  desired_size       = var.desired_size
  max_pods_per_node  = var.max_pods_per_node

  # Access & Auth
  cluster_access_entries               = var.cluster_access_entries
  cluster_endpoint_access_type         = var.cluster_endpoint_access_type
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  iam_role_permissions_boundary        = var.iam_role_permissions_boundary

  # Logging & Monitoring
  cluster_enabled_log_types = var.cluster_enabled_log_types

  # CloudInit
  cloudinit_pre_nodeadm  = var.cloudinit_pre_nodeadm
  cloudinit_post_nodeadm = var.cloudinit_post_nodeadm

  # Tags
  tags = var.tags

  # What type of node group to use
  # True: If you want to use EKS to manage your node group.
  #       Automated Lifecycle: AWS creates and manages the EC2 Auto Scaling Group (ASG) for you.
  #       Easy Upgrades: One-click rolling updates. AWS automatically cordons, drains, and terminates nodes to replace them with new versions.
  # False: If you want to manage your node group yourself.
  #       Manual Lifecycle: You define and manage the ASG yourself using Terraform (like in your current code).
  #       Manual Upgrades: You are responsible for cycling nodes (cordoning, draining, and terminating) during upgrades or utilizing ASG "Instance Refresh" features manually.
  is_eks_managed_node_group = var.is_eks_managed_node_group
}
