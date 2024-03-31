variable "digital_product_affix" {
  default     = "gitops-ftw"
  description = "The digital product affix."
  type        = string
}

variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string

  validation {
    condition     = can(regex("^(sbx|dev|qas|prd)$", var.environment))
    error_message = "Invalid input, options: \"sbx\", \"dev\", \"qas\", \"prd\"."
  }
}

variable "team" {
  default     = "MG Innovators"
  description = "The team used for tagging resource groups and resources."
  type        = string
}

# K8s
variable "k8s_namespace" {
  default     = "gitops-ftw"
  description = "K8s gitops-ftw namespace."
}

variable "acr_login_server_name" {
  default     = "TBD"
  sensitive = true
  description = "Sets an ACR registry server name."
}

variable "acr_username" {
  default     = "TBD"
  sensitive = true
  description = "Sets an ACR user name."
}

variable "acr_password" {
  default     = "TBD"
  sensitive = true
  description = "Sets an ACR password."
}

variable "install_argocd" {
  description = "Whether to install Argo CD or not"
  type        = bool
  default     = true
}

variable "install_fluxcd" {
  description = "Whether to install Flux CD or not"
  type        = bool
  default     = false
}