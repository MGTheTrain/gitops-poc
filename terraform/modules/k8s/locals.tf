locals {
  tags = {
    env         = "${var.environment}",
    project     = "gitops-ftw",
    Stage       = "${var.environment}"
  }
}