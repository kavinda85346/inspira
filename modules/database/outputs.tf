

output "db_endpoint" {
  value = aws_db_instance.app_db[0].endpoint
  condition = var.create_db
}