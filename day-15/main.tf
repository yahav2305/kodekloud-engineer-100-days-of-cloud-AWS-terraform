data "aws_ebs_volume" "volume" {
  filter {
    name   = "tag:Name"
    values = [var.volume_name]
  }
}

resource "aws_ebs_snapshot" "snapshot" {
  volume_id   = data.aws_ebs_volume.volume.id
  description = var.snapshot_description

  tags = {
    "Name" = var.snapshot_name
  }
}