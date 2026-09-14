# ============================================================
# Security Group compartilhado pelas 3 instâncias
# Libera a porta 5432 de dentro da VPC inteira (nós do EKS incluídos)
# e também de fora, replicando o acesso público usado na Fase 2 para
# simplificar testes/demonstração.
# ============================================================
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg"
  description = "Permite acesso PostgreSQL (5432) aos bancos RDS do ToggleMaster"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
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
    Name = "${var.project_name}-rds-sg"
  }
}

# ============================================================
# DB Subnet Group
# ============================================================
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-rds-subnet-group"
  }
}

# ============================================================
# RDS 1: auth-service
# ============================================================
resource "aws_db_instance" "auth" {
  identifier             = "${var.project_name}-auth-db"
  engine                 = "postgres"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  db_name                = "auth_db"
  username               = var.master_username
  password               = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = true
  skip_final_snapshot    = true

  tags = {
    Name = "${var.project_name}-auth-db"
  }
}

# ============================================================
# RDS 2: flag-service
# ============================================================
resource "aws_db_instance" "flag" {
  identifier             = "${var.project_name}-flag-db"
  engine                 = "postgres"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  db_name                = "flags_db"
  username               = var.master_username
  password               = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = true
  skip_final_snapshot    = true

  tags = {
    Name = "${var.project_name}-flag-db"
  }
}

# ============================================================
# RDS 3: targeting-service
# ============================================================
resource "aws_db_instance" "targeting" {
  identifier             = "${var.project_name}-targeting-db"
  engine                 = "postgres"
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  db_name                = "targeting_db"
  username               = var.master_username
  password               = var.master_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = true
  skip_final_snapshot    = true

  tags = {
    Name = "${var.project_name}-targeting-db"
  }
}
