module "orchestrator_secret_management" {
  source = "git::https://github.com/urukube/orchestrator-secret-management.git?ref=v1.2.0"

  secretlist    = var.secretlist
  secret_values = var.secret_values
  tags          = merge(var.tags, { env = var.env })
}
