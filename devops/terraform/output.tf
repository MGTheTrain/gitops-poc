# Azure Storage Accounts
output "azurerm_storage_account_list" {
    value = [for storage_account in azurerm_storage_account.this : storage_account.name]
}