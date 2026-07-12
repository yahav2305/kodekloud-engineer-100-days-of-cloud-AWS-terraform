data "aws_instance" "instance" {
  filter {
    name = "tag:Name"
    values = [ var.instance_name ]
  }
}

import {
  id = data.aws_instance.instance.id
  to = aws_instance.instance
}

resource "aws_instance" "instance" {
  ami = data.aws_instance.instance.ami
  instance_type = "t2.nano"

  tags = {
    "Name" = "datacenter-ec2"
  }
}