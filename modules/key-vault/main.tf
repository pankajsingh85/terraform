data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = ["Get"]
    secret_permissions = ["Get","List","Set"]
  }
}



resource "azurerm_key_vault_secret" "kvs" {
  for_each = var.pools
  name=each.value.secret_name
  value=each.value.secret_value
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault.kv
  ]
}


resource "azurerm_key_vault_access_policy" "policy" {
  for_each = var.policies
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = each.value.tenant_id
  object_id    = each.value.object_id

  secret_permissions = [
    "Get","List"
  ]

  depends_on = [
    azurerm_key_vault_secret.kvs
  ]
}

