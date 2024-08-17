variable "username" {
  description = "Name of the IAM user"
  type        = string
}

variable "description" {
  description = "Description for the IAM user"
  type        = string
}

variable "permissions" {
  description = "List of actions the user is allowed to perform"
  type        = list(string)
}

variable "resources" {
  description = "List of resources the policy applies to"
  type        = list(string)
}
