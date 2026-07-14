data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "kp" {
  public_key = var.ssh_pub_key
}

resource "aws_security_group" "security_group" {
  name        = "SSH Access from bastion"
  description = "Allow SSH access from bastion host"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "${var.lab_host_ip}/32"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = aws_key_pair.kp.key_name

  user_data = <<-EOF
    #!/bin/bash

    echo "${var.ssh_pub_key}" > /root/.ssh/authorized_keys

    sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

    systemctl restart sshd
  EOF

  tags = {
    Name = var.instance_name
  }
}

output "instance_ip" {
  value = aws_instance.instance.public_ip
}