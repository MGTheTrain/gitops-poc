variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string
}

variable "gitops_tool" {
  description = "String determining whether to install Argo CD or FluxCD. Viable options: [ argocd, fluxcd ]"
  type        = string
  default     = "argocd"
}