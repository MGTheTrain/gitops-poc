# Azure Rg
variable "digital_product_affix" {
  default     = "dfgaws"
  description = "The digital product affix."
  type        = string
}

variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string

  validation {
    condition     = can(regex("^(sbx|dev|qas|prd)$", var.environment))
    error_message = "Invalid input, options: \"sbx\", \"dev\", \"qas\", \"prd\"."
  }
}

variable "resource_instance_number" {
  default     = "001"
  description = "The resource instance number."
  type        = string

  validation {
    condition     = length(var.resource_instance_number) == 3
    error_message = "Must be a 3 character long resource_instance_number, e.g. 001."
  }

  validation {
    condition     = can(regex("^[0-9.]*$", var.resource_instance_number))
    error_message = "The 'resource_instance_number' value must be a valid and can only contain number characters from 0 to 9."
  }
}

variable "location" {
  default     = "West Europe"
  description = "The geographic location in which to deploy."
  type        = string
}

variable "team" {
  default     = "Digital Foundation"
  description = "The team used for tagging resource groups and resources."
  type        = string
}

variable "virtual_network_address_space" {
  type        = list(string)
  default     = ["10.1.0.0/16"] 
  description = "The virtual network address space. E.g. 2^(32-16)=65536 private ips in Vnet."
}

variable "number_of_aks" {
  default     = 1
  description = "The total number of AKses to deploy."
  type        = number
}

variable "aks_admin_username" {
  type        = string
  default     = "azureuser"
  description = "The AKS admin username"
}

variable "aks_enable_auto_scaling" {
  type        = bool
  default     = true
  description = "Whether to allow the AKS cluster to automatically adjust the number of nodes in a node pool"
}

variable "aks_node_count" {
  type        = number
  default     = 1
  description = "The AKS node count"
}

variable "aks_max_node_count" {
  type        = number
  default     = 2
  description = "The AKS max node count"
}

variable "aks_vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "The AKS vm size. Other option is Standard_B2s. See https://learn.microsoft.com/en-us/azure/virtual-machines/sizes, https://azureprice.net/"
}

variable "aks_os_disk_size_gb" {
  type        = string
  default     = "128"
  description = "The AKS Agent Operating System disk size in GB"
}