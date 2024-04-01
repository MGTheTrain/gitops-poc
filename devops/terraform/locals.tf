locals {
  tags = {
    env         = "${var.environment}",
    team        = "${var.team}",
    owner       = "MGTheTrain",
    project     = "gitops-ftw",
    app-purpose = "Deployment of an Azure Storage Account Service and container",
    Stage       = "${var.environment}"
  }
  storage_account_names                           = [for i in range(var.number_of_storage_accounts) : format("%s%ssa%03d", var.digital_product_affix, var.environment, i + 1)]
}