# ============================================================
# Security Group - libera porta 6379 (Redis)
# ============================================================
resource "aws_security_group" "redis" {
  name        = "${var.project_name}-redis-sg"
  description = "Permite acesso Redis (6379) ao ElastiCache do ToggleMaster"
  vpc_id      = var.vpc_id

  ingress {
    description = "Redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-redis-sg"
  }
}

# ============================================================
# Subnet Group
# ============================================================
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = var.subnet_ids
}

# ============================================================
# Cluster Redis (cluster mode disabled, sem TLS - mesma configuração
# validada na Fase 2, compatível com o cliente Redis simples usado
# pelo evaluation-service)
# ============================================================
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.project_name}-redis"
  engine               = "redis"
  engine_version       = "7.1"
  node_type            = var.node_type
  num_cache_nodes      = 1
  port                 = 6379
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  security_group_ids   = [aws_security_group.redis.id]

  tags = {
    Name = "${var.project_name}-redis"
  }
}
