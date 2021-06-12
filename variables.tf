variable "name" {
  type        = string
  description = "Name"
}

variable "scope" {
  type        = string
  description = "Scope"
  validation {
    condition     = contains(["REGIONAL", "CLOUDFORMATION"], var.scope)
    error_message = "Allowed values for scope are \"REGIONAL\", \"CLOUDFORMATION\"."
  }  
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}
