output "secret_arns" {
  description = "Map of logical key to Secret Manager ARN"
  value       = module.orchestrator_secret_management.secret_arns
}

output "secret_names" {
  description = "Map of logical key to Secret Manager secret name"
  value       = module.orchestrator_secret_management.secret_names
}
