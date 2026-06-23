output "cluster_secret_store_name" {
  description = "Name of the ClusterSecretStore created"
  value       = module.eso_configuration.cluster_secret_store_name
}

output "external_secret_names" {
  description = "Map of ExternalSecret name to namespace"
  value       = module.eso_configuration.external_secret_names
}
