output "db_endpoint" {
  value = aws_db_instance.db_wordpress.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.db_wordpress.db_name
}

output "db_identifier" {
  value = aws_db_instance.db_wordpress.identifier
}
