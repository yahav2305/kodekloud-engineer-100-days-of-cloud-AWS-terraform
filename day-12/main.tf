data "aws_instance" "instance" {
  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
}

data "aws_ebs_volume" "volume" {
  filter {
    name   = "tag:Name"
    values = [var.volume_name]
  }
}

resource "aws_volume_attachment" "volume_attachment" {
  instance_id = data.aws_instance.instance.id
  volume_id   = data.aws_ebs_volume.volume.id
  device_name = "/dev/sdb"
}