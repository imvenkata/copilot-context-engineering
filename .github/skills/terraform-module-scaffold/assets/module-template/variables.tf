variable "name" {
  type        = string
  description = "Name used for resources created by this module."
}

variable "tags" {
  type        = map(string)
  description = "Extra tags to apply."
  default     = {}
}

variable "enabled" {
  type        = bool
  description = "Whether to enable resources in this module."
  default     = true
}
