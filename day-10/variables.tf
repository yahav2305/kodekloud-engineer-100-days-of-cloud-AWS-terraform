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

variable "instance_name" {
  type = string
}

variable "elastic_ip_name" {
  type = string
}