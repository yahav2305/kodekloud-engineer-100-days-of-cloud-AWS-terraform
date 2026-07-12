resource "aws_security_group" "sg" {
  name = "${lower(var.sg_name_prefix)}-sg"
  description = "Security group for ${title(var.sg_description_prefix)} App Servers"
}

resource "aws_vpc_security_group_ingress_rule" "inbound_http" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "inbound_ssh" {
  security_group_id = aws_security_group.sg.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}