resource "aws_ssm_parameter" "parameters" {
  for_each = var.parameters

  name  = "/${var.name_prefix}/${each.key}"
  type  = "String"
  value = each.value

  overwrite = contains(var.prevent_overwrite, each.key) ? false : true

  tags = var.tags
}

resource "aws_ssm_parameter" "secure_parameters" {
  for_each = var.secure_parameters

  name   = "/${var.name_prefix}/${each.key}"
  type   = "SecureString"
  value  = each.value
  key_id = var.kms_key_id != "" ? var.kms_key_id : null

  overwrite = contains(var.prevent_overwrite, each.key) ? false : true

  tags = var.tags
}
