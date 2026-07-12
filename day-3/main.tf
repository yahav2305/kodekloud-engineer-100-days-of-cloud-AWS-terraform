resource "aws_default_vpc" "default_vpc" {}

resource "aws_subnet" "main" {
  vpc_id = aws_default_vpc.default_vpc.id
  cidr_block = "172.31.96.0/20"
  tags = {
    Name = "${var.subnet_name_prefix}-subnet"
  }
}