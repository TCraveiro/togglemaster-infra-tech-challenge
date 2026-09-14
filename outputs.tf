output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "auth_db_endpoint" {
  value = module.rds.auth_db_endpoint
}

output "flag_db_endpoint" {
  value = module.rds.flag_db_endpoint
}

output "targeting_db_endpoint" {
  value = module.rds.targeting_db_endpoint
}

output "redis_endpoint" {
  value = module.elasticache.redis_endpoint
}
