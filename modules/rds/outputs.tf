output "auth_db_endpoint" {
  value = aws_db_instance.auth.endpoint
}

output "flag_db_endpoint" {
  value = aws_db_instance.flag.endpoint
}

output "targeting_db_endpoint" {
  value = aws_db_instance.targeting.endpoint
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}
