module "k8s_external" {
  source      = "../../modules/k8s-external"
  environment = var.environment
  gitops_tool = var.gitops_tool
  count       = var.selected_configuration == "external-helm" ? 1 : 0
}

module "k8s_internal" {
  source                = "../../modules/k8s-internal"
  environment           = var.environment
  acr_login_server_name = var.acr_login_server_name
  acr_username          = var.acr_username
  acr_password          = var.acr_password
  count                 = var.selected_configuration == "internal" ? 1 : 0
}