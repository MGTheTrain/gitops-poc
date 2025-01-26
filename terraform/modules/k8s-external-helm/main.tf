# External helm charts

resource "kubernetes_namespace" "external_services" {
  metadata {
    annotations = local.tags
    labels      = local.tags
    name        = "external-services"
  }
}

# ArgoCD or FLuxCD helm charts
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.7.5"
  namespace  = kubernetes_namespace.external_services.metadata.0.name
  count      = var.gitops_tool == "argocd" ? 1 : 0
}

resource "helm_release" "fluxcd" {
  name       = "fluxcd"
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "flux2"
  version    = "2.12.4"
  namespace  = kubernetes_namespace.external_services.metadata.0.name
  count      = var.gitops_tool == "fluxcd" ? 1 : 0
}

# Nginx controller and Ingress
resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"
  namespace  = kubernetes_namespace.external_services.metadata.0.name

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}