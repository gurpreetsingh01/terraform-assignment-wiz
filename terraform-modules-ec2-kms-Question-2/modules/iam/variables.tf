variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "policy_name" {
  type        = string
  description = "Name of the IAM policy"
}

variable "policy_description" {
  type        = string
  description = "Description of the IAM policy"
  default     = "Policy for EC2 service account"
}

variable "policy_statements" {
  type = list(object({
    Effect   = string
    Action   = string
    Resource = list(string)
  }))
  description = "List of IAM policy statements"
}

variable "instance_profile_name" {
  type        = string
  description = "Name of the IAM instance profile"
}