variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string
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
}

variable "selected_configuration" {
  description = "String that specifies whether to deploy external Helm charts or internal resources, such as Kubernetes secrets or a reverse proxy ingress required for applications in the k8s cluster. Viable options: [ internal, external-helm ]"
  type        = string
  default     = "external-helm"

  validation {
    condition     = var.selected_configuration == "internal" || var.selected_configuration == "external-helm"
    error_message = "selected_configuration must be either 'internal' or 'external-helm'"
  }
}