# NOTE: The missing policy ec2:DescribeAvailabilityZones is needed to be added to the execution role if running against real AWS.

variables {
  # Global defaults to prevent null interpolation errors in underlying module
  bu_id  = "testbu"
  app_id = "testapp"
}

mock_provider "aws" {}

override_module {
  target = module.networking
  outputs = {
    vpc_id                          = "vpc-mock-12345"
    private_subnet_ids              = ["subnet-mock-1", "subnet-mock-2", "subnet-mock-3"]
    public_subnet_ids               = ["subnet-mock-public-1", "subnet-mock-public-2"]
    node_security_group_id          = "sg-mock-node"
    control_plane_security_group_id = "sg-mock-control-plane"
  }
}

override_module {
  target = module.eks_infra
  outputs = {
    cluster_name                       = "mock-cluster"
    cluster_endpoint                   = "https://mock.k8s.local"
    cluster_certificate_authority_data = "mock-data"
    cluster_service_cidr               = "10.100.0.0/16"
    cluster_oidc_provider_arn          = "arn:aws:iam::123456789012:oidc-provider/mock"
    cluster_oidc_issuer_url            = "https://oidc.eks.us-east-1.amazonaws.com/id/MOCK"
  }
}


run "default_configuration" {
  command = plan

  variables {
    env = "test"
  }

  assert {
    condition     = var.env == "test"
    error_message = "Environment variable not passed correctly"
  }
}

run "custom_vpc_configuration" {
  command = plan

  variables {
    env                = "staging"
    vpc_cidr           = "10.1.0.0/16"
    single_nat_gateway = true
    enable_nat_gateway = true
  }

  assert {
    condition     = var.vpc_cidr == "10.1.0.0/16"
    error_message = "VPC CIDR did not match custom value"
  }

  assert {
    condition     = var.single_nat_gateway == true
    error_message = "single_nat_gateway should be true"
  }
}

run "load_balancers_enabled" {
  command = plan

  variables {
    env                          = "prod"
    enable_alb                   = true
    enable_network_load_balancer = true
    alb_http_enabled             = true
    alb_https_enabled            = true
    alb_certificate_arn          = "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012"
  }

  assert {
    condition     = var.enable_alb == true
    error_message = "ALB should be enabled"
  }

  assert {
    condition     = var.enable_network_load_balancer == true
    error_message = "NLB should be enabled"
  }
}

run "vpc_endpoints_enabled" {
  command = plan

  variables {
    env                  = "prod"
    enable_vpc_endpoints = true
    vpc_endpoints = {
      ssm   = true
      rsync = false
      s3    = true
      ec2   = true
    }
  }

  assert {
    condition     = var.enable_vpc_endpoints == true
    error_message = "VPC Endpoints should be enabled"
  }
}

run "naming_and_tagging" {
  command = plan

  variables {
    env    = "prod"
    bu_id  = "finance"
    app_id = "payment-gateway"
  }

  assert {
    condition     = var.env == "prod"
    error_message = "Environment mismatch"
  }

  assert {
    condition     = var.bu_id == "finance"
    error_message = "Business Unit ID mismatch"
  }

  assert {
    condition     = var.app_id == "payment-gateway"
    error_message = "Application ID mismatch"
  }
}
