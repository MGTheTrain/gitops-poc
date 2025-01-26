locals {
  tags = {
    env     = "${var.environment}",
    project = "gitops-poc",
    stage   = "${var.environment}"
  }
}