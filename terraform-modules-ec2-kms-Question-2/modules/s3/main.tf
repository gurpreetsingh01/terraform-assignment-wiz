provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}