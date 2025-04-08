output "db_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.mysql.endpoint
}

output "db_port" {
  description = "Porta de conexão do banco de dados"
  value       = aws_db_instance.mysql.port
}