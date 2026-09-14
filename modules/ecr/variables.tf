variable "repository_names" {
  description = "Lista de nomes dos repositórios ECR a criar"
  type        = list(string)
  default = [
    "auth-service",
    "flag-service",
    "targeting-service",
    "evaluation-service",
    "analytics-service",
  ]
}
