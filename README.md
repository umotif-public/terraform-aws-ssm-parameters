# terraform-aws-ssm-parameters
Terraform module creating encrypted and non-encrypted AWS SSM parameters

## Terraform versions

Terraform 0.12. Pin module version to `~> v1.0`. Submit pull-requests to `master` branch.

## Usage

```hcl
module "ssm-parameters" {
  source = "umotif-public/ssm-parameters/aws"
  version = "~> 1.0.0"

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

Module is to be used with Terraform > 0.12.

## Examples

* [SSM Parameters](https://github.com/umotif-public/terraform-aws-ssm-parameters/tree/master/examples/core)

## Authors

Module managed by [Marcin Cuber](https://github.com/marcincuber) [LinkedIn](https://www.linkedin.com/in/marcincuber/).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6, < 0.14 |
| aws | >= 2.41, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.41, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| advanced\_tier | List of parameter names that should have tier set to Advanced | `list(string)` | `[]` | no |
| kms\_key\_id | The KMS key to use for encryption | `string` | `""` | no |
| name\_prefix | Path used for each SSM parameter created by the module | `any` | n/a | yes |
| parameters | Non-encrypted parameters | `map(any)` | `{}` | no |
| prevent\_overwrite | List of parameter names to prevent overwrite for | `list(string)` | `[]` | no |
| secure\_parameters | Secure parameters | `map(any)` | `{}` | no |
| tags | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| parameter\_path | n/a |
| parameters | n/a |
| secure\_parameters | n/a |

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