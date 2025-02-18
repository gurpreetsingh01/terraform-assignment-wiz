variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "subnet_ids" {
  description = "List of subnet IDs to deploy resources into."
  type        = list(string)
  default     = ["subnet-014966a29dd41fc04", "subnet-0e57c9bd2cd892d6e"]
}

variable "node_subnet_ids" {
  description = "List of subnet IDs for the node group."
  type        = list(string)
  default     = ["subnet-014966a29dd41fc04", "subnet-0e57c9bd2cd892d6e"]
}
