variable "db_name" {
  default = "pedidos_db"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  description = "SuaSenhaAqui"
  sensitive   = true
  default = "Teste#Teste"
}

variable "db_port" {
  default = 3306
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  default = 5
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster será criado"
  type        = string
  default     = "vpc-055af9f7673117005"
}