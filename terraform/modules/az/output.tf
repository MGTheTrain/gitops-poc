output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "aks_tls_private_key" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}

output "aks_name_list" {
  value = [for aks in azurerm_kubernetes_cluster.this : aks.name]
}

output "aks_kube_config_list" {
  value     = [for aks in azurerm_kubernetes_cluster.this : aks.kube_config_raw]
  sensitive = true
}