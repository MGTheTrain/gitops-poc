# Azure Rg
variable "digital_product_affix" {
  default     = "gopoctb"
  description = "The digital product affix."
  type        = string
}

variable "environment" {
  default     = "sbx"
  description = "The environment."
  type        = string

  validation {
    condition     = can(regex("^(sbx|dev|qas|staging|prd)$", var.environment))
    error_message = "Invalid input, options: \"sbx\", \"dev\", \"qas\", \"staging\", \"prd\"."
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
  default     = "MG Innovators"
  description = "The team used for tagging resource groups and resources."
  type        = string
}

# Azure Container Registry
variable "number_of_storage_accounts" {
  default     = 1
  description = "The total number of Azure Storage Accounts to deploy."
  type        = number
}

variable "sa_account_tier" {
  description = "Account tier for the Azure Storage Account"
  type        = string
  default     = "Standard"
}

variable "sa_account_replication_type" {
  description = "Account replication type for the Azure Storage Account"
  type        = string
  default     = "LRS"
}

variable "sc_container_access_type" {
  default     = "private"
  description = "Container access type of the Storage Account Container"
  type        = string
}