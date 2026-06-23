output "applicationset_name" {
  description = "Name of the ArgoCD ApplicationSet that discovers platform XRD repos"
  value       = module.argocd_configuration.applicationset_name
}
