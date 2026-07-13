data "aws_instance" "instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

import {
  id = data.aws_instance.instance.id
  to = aws_instance.instance
}

resource "aws_instance" "instance" {
  ami           = data.aws_instance.instance.ami
  instance_type = data.aws_instance.instance.instance_type

  tags = {
    "Name" = var.instance_name
  }
}