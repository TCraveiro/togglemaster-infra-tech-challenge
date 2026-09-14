variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

# Usamos subnets PÚBLICAS aqui de propósito, replicando a decisão da Fase 2
# (RDS com Public access = Yes, para simplificar o teste/demo do desafio).
# Em um ambiente de produção real, o ideal seria usar subnets privadas.
variable "subnet_ids" {
  type = list(string)
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_engine_version" {
  type    = string
  default = "16"
}

variable "master_username" {
  type    = string
  default = "postgres"
}

variable "master_password" {
  description = "Senha mestra para as 3 instâncias RDS. Passe via variável de ambiente TF_VAR_master_password, nunca hardcoded."
  type        = string
  sensitive   = true
}
