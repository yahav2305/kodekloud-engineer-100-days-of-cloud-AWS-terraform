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

variable "ssh_pub_key" {
  type = string
}

variable "lab_host_ip" {
  type = string
}