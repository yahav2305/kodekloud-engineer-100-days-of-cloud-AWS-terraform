variable "access_key" {
  type        = string
  sensitive   = true
  description = "Access key of AWS IAM user"
}

variable "secret_key" {
  type        = string
  sensitive   = true
  description = "Secret key of AWS IAM user"
}

variable "iam_role_name" {
  type = string
}

variable "iam_policy_name" {
  type = string
}