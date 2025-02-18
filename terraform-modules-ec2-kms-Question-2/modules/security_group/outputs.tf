variable "name" {
  type        = string
  description = "Name of the security group"
}

variable "description" {
  type        = string
  description = "Description of the security group"
  default     = "Security group for EC2 instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
  default     = null
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of ingress rules"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for the security group"
  default     = {}
}