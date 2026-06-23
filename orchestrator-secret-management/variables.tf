variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string

  validation {
    condition     = can(regex("^(dev|staging|prod|test)$", var.env))
    error_message = "Environment must be dev, staging, prod, or test"
  }
}

variable "secretlist" {
  description = "Map of secrets to create in AWS Secrets Manager (names and descriptions). Loaded from secrets.auto.tfvars.json."
  type = map(object({
    name        = string
    description = optional(string, "")
  }))
  default = {}
}

variable "secret_values" {
  description = "Map of logical key to secret value. Injected as TF_VAR_secret_values from GitHub org secrets — never stored in tfvars files."
  type        = map(string)
  sensitive   = true
  default     = {}
}

variable "tags" {
  description = "Tags applied to every secret"
  type        = map(string)
  default     = {}
}
