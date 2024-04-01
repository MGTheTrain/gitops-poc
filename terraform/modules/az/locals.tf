locals {
  tags = {
    env         = "${var.environment}",
    team        = "${var.team}",
    owner       = "MGTheTrain",
    project     = "helm-chart-samples-ftw",
    app-purpose = "Deployment of an AKS",
    Stage       = "${var.environment}"
  }
  aks_names                  = [for i in range(var.number_of_aks) : format("%s-%s-aks%03d", var.digital_product_affix, var.environment, i + 1)]
  vm_subnets                 = [for i in range(var.number_of_aks) : format("%s-%s-subnet%03d", var.digital_product_affix, var.environment, i + 1)]
  vm_network_security_groups = [for i in range(var.number_of_aks) : format("%s-%s-nsg%03d", var.digital_product_affix, var.environment, i + 1)]
  vm_disk_names              = [for i in range(var.number_of_aks) : format("%s-%s-os%03d", var.digital_product_affix, var.environment, i + 1)]
}