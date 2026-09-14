provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "ToggleMaster"
      Environment = "production"
      ManagedBy   = "Terraform"
    }
  }
}
