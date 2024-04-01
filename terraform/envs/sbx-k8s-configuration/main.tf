module "k8s" {
  source                = "../../modules/k8s"
  environment           = var.environment
  k8s_namespace         = var.k8s_namespace
  acr_login_server_name = var.acr_login_server_name
  acr_username          = var.acr_username
  acr_password          = var.acr_password
  gitops_tool           = var.gitops_tool
}