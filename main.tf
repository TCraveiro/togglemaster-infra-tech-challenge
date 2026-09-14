module "networking" {
  source = "./modules/networking"

  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  eks_cluster_name      = var.eks_cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name        = var.eks_cluster_name
  vpc_id              = module.networking.vpc_id
  public_subnet_ids   = module.networking.public_subnet_ids
  private_subnet_ids  = module.networking.private_subnet_ids
  lab_role_arn        = data.aws_iam_role.lab_role.arn
  node_instance_type  = var.eks_node_instance_type
}

module "rds" {
  source = "./modules/rds"

  project_name    = var.project_name
  vpc_id          = module.networking.vpc_id
  subnet_ids      = module.networking.public_subnet_ids
  master_password = var.master_password
}

module "elasticache" {
  source = "./modules/elasticache"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
  subnet_ids   = module.networking.public_subnet_ids
}

module "dynamodb" {
  source = "./modules/dynamodb"

  project_name = var.project_name
}

module "sqs" {
  source = "./modules/sqs"

  project_name = var.project_name
}

module "ecr" {
  source = "./modules/ecr"
}
