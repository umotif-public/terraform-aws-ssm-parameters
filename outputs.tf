output "parameter_path" {
  value = var.name_prefix
}

output "parameters" {
  value     = aws_ssm_parameter.parameters
  sensitive = true
}

output "secure_parameters" {
  value     = aws_ssm_parameter.secure_parameters
  sensitive = true
}
