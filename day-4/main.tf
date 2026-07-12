import {
  to = aws_s3_bucket.bucket
  id = var.bucket_name
}

resource "aws_s3_bucket" "bucket" {
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}