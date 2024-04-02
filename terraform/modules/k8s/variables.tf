variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string

  validation {
    condition     = can(regex("^(sbx|dev|qas|prd)$", var.environment))
    error_message = "Invalid input, options: \"sbx\", \"dev\", \"qas\", \"prd\"."
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

variable "gitops_tool" {
  description = "String determining whether to install Argo CD or FluxCD. Viable options: [ argocd, fluxcd ]"
  type        = string
  default     = "argocd"

  validation {
    condition     = var.gitops_tool == "none" || var.gitops_tool == "argocd" || var.gitops_tool == "fluxcd"
    error_message = "gitops_tool must be either 'none', 'argocd' or 'fluxcd'"
  }
}
