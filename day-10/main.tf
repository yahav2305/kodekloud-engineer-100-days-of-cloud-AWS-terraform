data "aws_instance" "instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

data "aws_eip" "eip" {
  filter {
    name   = "tag:Name"
    values = [var.elastic_ip_name]
  }
}

resource "aws_eip_association" "eip_association" {
  instance_id   = data.aws_instance.instance.id
  allocation_id = data.aws_eip.eip.id
}