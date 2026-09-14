variable "aws_region" {
  description = "Região AWS onde os recursos serão provisionados"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto, usado como prefixo em recursos e tags"
  type        = string
  default     = "togglemaster"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Zonas de disponibilidade usadas pela VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDRs das subnets públicas (uma por AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs das subnets privadas (uma por AZ)"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "eks_cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "togglemaster-cluster"
}

variable "eks_node_instance_type" {
  description = "Tipo de instância EC2 usada pelos nós do EKS"
  type        = string
  default     = "t3.medium"
}
