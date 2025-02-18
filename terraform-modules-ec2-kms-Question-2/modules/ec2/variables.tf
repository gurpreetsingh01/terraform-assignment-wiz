variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for encrypting the root volume"
}

variable "volume_size" {
  type        = number
  description = "Size of the root volume in GB"
  default     = 8
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile to attach to the instance"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags for the EC2 instance"
  default     = {}
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the EC2 instance will be launched"
}

variable "key_name" {
  description = "The key pair to use for SSH access"
  type        = string
}