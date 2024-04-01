output "gitops_ftw_namespace" {
  value = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
}