# AWS Academy: não é permitido criar Roles/Policies de IAM via Terraform.
# Em vez de criar, importamos a LabRole já existente na conta via data source,
# e associamos ela ao cluster EKS e aos Node Groups nos módulos correspondentes.
data "aws_iam_role" "lab_role" {
  name = "LabRole"
}
