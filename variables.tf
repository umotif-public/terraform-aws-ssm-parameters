variable "name_prefix" {
  description = "Path used for each SSM parameter created by the module"
  type        = string
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "parameters" {
  description = "Non-encrypted parameters"
  type        = map(any)
  default     = {}
}

variable "secure_parameters" {
  description = "Secure parameters"
  type        = map(any)
  default     = {}
}

variable "kms_key_id" {
  type        = string
  description = "The KMS key to use for encryption"
  default     = ""
}

variable "advanced_tier" {
  description = "List of parameter names that should have tier set to Advanced"
  type        = list(string)
  default     = []
}

variable "prevent_overwrite" {
  description = "[Deprecated - will be removed properly in 6.x] List of parameter names to prevent overwrite for"
  type        = list(string)
  default     = []
}