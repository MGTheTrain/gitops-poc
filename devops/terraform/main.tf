resource "azurerm_resource_group" "this" {
  name     = "${var.digital_product_affix}-${var.environment}-rg${var.resource_instance_number}"
  location = var.location

  tags = local.tags
}

resource "azurerm_storage_account" "this" {
  name                     = local.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  count = var.number_of_storage_accounts
  tags = local.tags
}

resource "azurerm_storage_container" "tf_backend" {
  name                  = "${var.digital_product_affix}${var.environment}sac${var.resource_instance_number}"
  storage_account_name  = var.digital_product_affix
  container_access_type = var.sc_container_access_type
}