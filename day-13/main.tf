data "aws_instance" "instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

resource "aws_ami_from_instance" "ami" {
  name = var.ami_name
  source_instance_id = data.aws_instance.instance.id
}