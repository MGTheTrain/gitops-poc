resource "kubernetes_namespace" "gitops_ftw_namespace" {
  metadata {
    annotations = local.tags
    labels = local.tags
    name = var.k8s_namespace
  }
}

resource "kubernetes_secret" "acr_secret" {
  metadata {
    name = "acr-secret"
    namespace = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
    annotations = local.tags
    labels = local.tags
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.acr_login_server_name}" = {
          "username" = var.acr_username
          "password" = var.acr_password
          "auth"     = base64encode("${var.acr_username}:${var.acr_password}")
        }
      }
    })
  }
}

# ArgoCD or FLuxCD helm charts
resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd" 
  version    = "5.34.5"
  namespace  = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
  count      = var.install_argocd ? 1 : 0
}

resource "helm_release" "fluxcd" {
  name       = "fluxcd"
  repository = "https://fluxcd-community.github.io/helm-charts"
  chart      = "fluxcd-community"
  version    = "2.12.4"
  namespace  = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
  count      = var.install_fluxcd ? 1 : 0
}

# Nginx controller and Ingress
resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"
  namespace  = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
  
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

resource "kubernetes_ingress_v1" "gitops_ftw_ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "${var.k8s_namespace}-ingress"
    namespace = kubernetes_namespace.gitops_ftw_namespace.metadata.0.name
    annotations = local.tags
    labels = local.tags
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          backend {
            service {
              name = "hello-world-service"
              port {
                number = 80
              }
            }
          }
          path = "/api/v1/hws"
        }
        # path {
        #   backend {
        #     service {
        #       name = "some-other-service-service"
        #       port {
        #         number = 80
        #       }
        #     }
        #   }
        #   path = "/"
        # }
      }
    }
  }
}