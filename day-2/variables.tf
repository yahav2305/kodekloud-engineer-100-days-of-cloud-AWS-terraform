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

variable "sg_name_prefix" {
  type        = string
}

variable "sg_description_prefix" {
  type        = string
}