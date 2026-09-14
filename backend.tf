terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend remoto - o state NÃO fica local, conforme exigido pelo desafio.
  # Bucket criado manualmente via AWS CLI antes do primeiro `terraform init`
  # (recurso "bootstrap" - não dá para gerenciar via Terraform o próprio
  # bucket que guarda o state do Terraform, seria uma referência circular).
  backend "s3" {
    bucket       = "togglemaster-tfstate-221079493511"
    key          = "togglemaster/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # lock nativo do S3 (Terraform >= 1.10), sem precisar de tabela DynamoDB extra
  }
}
