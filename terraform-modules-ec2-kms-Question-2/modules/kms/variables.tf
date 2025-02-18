variable "description" {
  type        = string
  description = "Description of the KMS key"
  default     = "CMK for encrypting resources"
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days before the key is deleted"
  default     = 10
}

variable "enable_key_rotation" {
  type        = bool
  description = "Enable automatic key rotation"
  default     = true
}

variable "alias" {
  type        = string
  description = "Alias for the KMS key"
  default     = "vizh-key"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the KMS key"
  default     = {}
}