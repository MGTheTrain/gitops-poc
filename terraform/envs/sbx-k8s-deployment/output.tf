output "resource_group_name" {
  value = module.az.name
}

output "aks_tls_private_key" {
  value     =  module.az.private_key_pem
  sensitive = true
}

output "aks_name_list" {
  value     = module.az.aks_name_list
}

output "aks_kube_config_list" {
  value     = module.az.aks_kube_config_list
  sensitive = true
}