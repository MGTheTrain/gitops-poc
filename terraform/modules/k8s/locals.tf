locals {
  tags = {
    env         = "${var.environment}",
    team        = "${var.team}",
    owner       = "MGTheTrain",
    project     = "gitops-ftw",
    app-purpose = "Installation of helm charts to an AKS",
    Stage       = "${var.environment}"
  }
}