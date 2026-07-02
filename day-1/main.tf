resource "tls_private_key" "datacenter_kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "devops-kp" {
  key_name = "devops-kp"
  public_key = tls_private_key.datacenter_kp.public_key_openssh
}

output "private_key" {
  value = tls_private_key.datacenter_kp.public_key_pem
}