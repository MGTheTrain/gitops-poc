variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string

  validation {
    condition     = can(regex("^(sbx|dev|qas|staging|prd)$", var.environment))
    error_message = "Invalid input, options: \"sbx\", \"dev\", \"qas\", \"staging\", \"prd\"."
  }
}

# K8s
variable "acr_login_server_name" {
  default     = "TBD"
  sensitive   = true
  description = "Sets an ACR registry server name."
}

variable "acr_username" {
  default     = "TBD"
  sensitive   = true
  description = "Sets an ACR user name."
}

variable "acr_password" {
  default     = "TBD"
  sensitive   = true
  description = "Sets an ACR password."
}
