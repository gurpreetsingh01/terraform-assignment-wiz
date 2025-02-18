resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
   key_name      = var.key_name

  root_block_device {
    encrypted   = true
    kms_key_id  = var.kms_key_id
    volume_size = var.volume_size
  }

  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile

  tags = var.tags
}