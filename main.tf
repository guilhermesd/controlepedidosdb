provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "mysql" {
  identifier         = "mysql-pedidos"
  allocated_storage  = var.db_allocated_storage
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = var.db_instance_class
  db_name                = var.db_name
  username           = var.db_user
  password           = var.db_password
  port               = var.db_port
  publicly_accessible = true
  skip_final_snapshot = true
}
