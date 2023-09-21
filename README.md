![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/umotif-public/terraform-aws-ssm-parameters?style=social)

# terraform-aws-ssm-parameters
Terraform module creating encrypted and non-encrypted AWS SSM parameters

## Terraform versions

Terraform 0.14.5. Pin module version to `~> v2.0`.
Terraform 0.12 - 0.14.4. Pin module version to `~> v1.0`.
Submit pull-requests to `master` branch.

## Usage

```hcl
module "ssm-parameters" {
  source = "umotif-public/ssm-parameters/aws"
  version = "~> 3.0.0"

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

  prevent_overwrite = [
    "audit"
  ]

  kms_key_id = module.kms.key_id

  tags = {
    "Environment" = "test"
  }
}
```

## Assumptions

Module v1.0 is to be used with Terraform > 0.12.
Module v2.0 is to be used with Terraform > 0.14.5.
Module v3.0+ is to be used with Terraform > 1.0.11.

## Examples

* [SSM Parameters](https://github.com/umotif-public/terraform-aws-ssm-parameters/tree/master/examples/core)

## Authors

- [uMotif](https://github.com/umotif-public)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.53 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.secure_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_tier"></a> [advanced\_tier](#input\_advanced\_tier) | List of parameter names that should have tier set to Advanced | `list(string)` | `[]` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The KMS key to use for encryption | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Path used for each SSM parameter created by the module | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Non-encrypted parameters | `map(any)` | `{}` | no |
| <a name="input_prevent_overwrite"></a> [prevent\_overwrite](#input\_prevent\_overwrite) | [Deprecated - will be removed properly in 6.x] List of parameter names to prevent overwrite for | `list(string)` | `[]` | no |
| <a name="input_secure_parameters"></a> [secure\_parameters](#input\_secure\_parameters) | Secure parameters | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_path"></a> [parameter\_path](#output\_parameter\_path) | n/a |
| <a name="output_parameters"></a> [parameters](#output\_parameters) | n/a |
| <a name="output_secure_parameters"></a> [secure\_parameters](#output\_secure\_parameters) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```
