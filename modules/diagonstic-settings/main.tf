data "azurerm_windows_web_app" "example"{
  name                = var.frontend_app_service_name
  resource_group_name = var.resource_group_name
}

data "azurerm_linux_web_app" "example" {
  name                = var.backend_app_service_name
  resource_group_name = var.resource_group_name
}
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  retention_in_days   = var.retention_days
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.diagnostics_settings_name
  target_resource_id         = data.azurerm_linux_web_app.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  storage_account_id = azurerm_storage_account.example.id

  log {
    category_group = var.log_category_grp
  }

  metric {
    category = var.metric_category

    retention_policy {
      enabled = false
    }
  }

  depends_on = [
    azurerm_storage_account.example
  ]
}

resource "azurerm_monitor_diagnostic_setting" "this2" {
  name                       = var.diagnostics_settings_name
  target_resource_id         = data.azurerm_windows_web_app.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  storage_account_id = azurerm_storage_account.example.id

  log {
    category_group = var.log_category_grp
  }

  metric {
    category = var.metric_category

    retention_policy {
      enabled = false
    }
  }

  depends_on = [
    azurerm_storage_account.example
  ]
}