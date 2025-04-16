resource "aws_security_group" "rds_sg" {
  name        = "rds-mysql-sg"
  description = "Security group for MySQL RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Evite isso em produção! Ideal é limitar IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "mysql" {
  identifier         = "mysql-pedidos"
  allocated_storage  = var.db_allocated_storage
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = var.db_instance_class
  db_name            = var.db_name
  username           = var.db_user
  password           = var.db_password
  port               = var.db_port
  publicly_accessible = true
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}