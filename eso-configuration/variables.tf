variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string

  validation {
    condition     = can(regex("^(dev|staging|prod|test)$", var.env))
    error_message = "Environment must be dev, staging, prod, or test"
  }
}

variable "region" {
  description = "AWS region where Secrets Manager secrets are stored"
  type        = string
}

variable "eso_namespace" {
  description = "Kubernetes namespace where ESO is installed"
  type        = string
  default     = "external-secrets"
}

variable "eso_service_account_name" {
  description = "Name of the ESO Kubernetes service account with IRSA annotation for Secrets Manager"
  type        = string
  default     = "eso-service-account"
}

variable "refresh_interval" {
  description = "How often ESO polls Secrets Manager for changes"
  type        = string
  default     = "1h"
}

variable "external_secrets" {
  description = <<-EOT
    Map of ExternalSecret resources to create. Key is the ExternalSecret name.
    Each entry defines the namespace, target K8s secret, creation policy, and
    the list of SM path → K8s key mappings.
  EOT

  type = map(object({
    namespace          = string
    target_secret_name = string
    creation_policy    = optional(string, "Owner")
    mappings = list(object({
      secret_key = string
      remote_key = string
    }))
  }))
  default = {}
}
