resource "aws_ebs_volume" "volume" {
  type              = "gp3"
  size              = 2
  availability_zone = "us-east-1a"

  tags = {
    "Name" = var.volume_name
  }
}