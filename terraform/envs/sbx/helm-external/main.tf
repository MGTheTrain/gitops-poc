module "k8s_external_helm" {
  source      = "../../modules/k8s-external-helm"
  environment = var.environment
  gitops_tool = var.gitops_tool
}