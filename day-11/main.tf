data "aws_instance" "instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

data "aws_network_interface" "eni" {
  filter {
    name   = "tag:Name"
    values = [var.eni_name]
  }
}

resource "aws_network_interface_attachment" "eip_association" {
  instance_id          = data.aws_instance.instance.id
  network_interface_id = data.aws_network_interface.eni.id
  device_index         = 1
}