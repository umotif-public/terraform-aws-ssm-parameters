module "kms" {
  source  = "umotif-public/kms/aws"
  version = "2.0.0"

  alias_name = "test-key"
}

module "parameters" {
  source = "../.."

  name_prefix = "test/example-path"

  parameters = {
    "audit" = "cloudwatch"
  }

  secure_parameters = {
    "secure-audit" = "cloudwatch"
  }

  advanced_tier = [
    "secure-audit"
  ]

  kms_key_id = module.kms.key_id

  tags = {
    "Environment" = "test"
  }
}
