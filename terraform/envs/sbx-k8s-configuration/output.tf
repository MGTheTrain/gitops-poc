output "external_services_namespace" {
  value = module.k8s_external_helm.external_services_namespace
}

output "internal_apps_namespace" {
  value = module.k8s_internal.internal_apps_namespace
}