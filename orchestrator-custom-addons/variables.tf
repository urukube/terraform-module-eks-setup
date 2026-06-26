################ORG INFO##########################

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string

  validation {
    condition     = can(regex("^(dev|staging|prod|test)$", var.env))
    error_message = "Environment must be dev, staging, or prod"
  }
}

variable "bu_id" {
  description = "Business Unit"
  type        = string
  default     = null
}

variable "app_id" {
  description = "Application Unit"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

##################################################

################PLATFORM CONFIG###################

variable "domain_url" {
  description = "Base domain URL for the platform (e.g. platform.urukube.io)"
  type        = string
  default     = ""
}

##################################################

################ADDON TOGGLES####################

variable "enable_istio" {
  description = "Enable Istio service mesh"
  type        = bool
  default     = false
}

variable "enable_kiali" {
  description = "Enable Kiali Istio dashboard"
  type        = bool
  default     = false
}

variable "enable_argocd" {
  description = "Enable ArgoCD GitOps engine"
  type        = bool
  default     = false
}

variable "enable_prometheus" {
  description = "Enable Prometheus monitoring"
  type        = bool
  default     = false
}

variable "enable_eso" {
  description = "Enable External Secrets Operator"
  type        = bool
  default     = false
}

variable "enable_ecr" {
  description = "Enable ECR cross-account pull role for BU clusters"
  type        = bool
  default     = false
}

variable "enable_crossplane" {
  description = "Enable Crossplane infrastructure provisioning engine"
  type        = bool
  default     = false
}

variable "enable_komoplane" {
  description = "Enable Komoplane UI for browsing Crossplane composite resources"
  type        = bool
  default     = false
}

##################################################

################ADDON VERSIONS####################

variable "istio_version" {
  description = "Version of the Istio Helm chart"
  type        = string
  default     = "1.30.1"
}

variable "kiali_version" {
  description = "Version of the Kiali Helm chart"
  type        = string
  default     = "2.26.0"
}

variable "argocd_version" {
  description = "Version of the ArgoCD Helm chart"
  type        = string
  default     = "9.6.0"
}

variable "prometheus_version" {
  description = "Version of the Prometheus Helm chart"
  type        = string
  default     = "29.13.0"
}

variable "eso_helm_version" {
  description = "Version of the External Secrets Operator Helm chart"
  type        = string
  default     = "2.6.0"
}

variable "crossplane_version" {
  description = "Version of the Crossplane Helm chart"
  type        = string
  default     = "1.19.0"
}

variable "crossplane_provider_aws_version" {
  description = "Version of the upbound/provider-family-aws Crossplane provider"
  type        = string
  default     = "v1.21.0"
}

variable "komoplane_version" {
  description = "Version of the Komoplane Helm chart"
  type        = string
  default     = "0.1.8"
}

##################################################
