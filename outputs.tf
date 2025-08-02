#Getting the outputs from the modules of main.tf

output "load_balancer_dns" {
  value = module.compute.load_balancer_dns
}

output "db_endpoint" {
  value       = module.database.db_endpoint
  description = "Database endpoint (if created)"
  condition   = var.create_db
}
