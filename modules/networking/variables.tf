variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "eks_cluster_name" {
  description = "Usado para tagging das subnets (kubernetes.io/cluster/<nome>), necessário para o EKS descobrir as subnets automaticamente"
  type        = string
}
