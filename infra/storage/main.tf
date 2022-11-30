provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_ebs_volume" "db_volume" {
  availability_zone = var.availability_zone
  final_snapshot    = true
  size              = 1

  tags = {
    Name = "db_volume"
  }
}

resource "aws_volume_attachment" "db_volume_att" {
  device_name                    = var.volume_device_name
  volume_id                      = aws_ebs_volume.db_volume.id
  instance_id                    = var.db_instance_id
  stop_instance_before_detaching = true
}
