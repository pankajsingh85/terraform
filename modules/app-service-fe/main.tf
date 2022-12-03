//appgateway subnet
data "azurerm_subnet" "subnet" {
  name                 = var.appgtwy_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

//front subnet
data "azurerm_subnet" "subnet2" {
  name                 = var.frontend_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}



resource "azurerm_service_plan" "plan" {
  name                = var.frontend_service_plan
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku_name            = var.sku
  os_type             = var.os_type
}

resource "azurerm_windows_web_app" "front" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    ip_restriction {
      action                    = var.ip_restriction_action
      priority                  = 1
      virtual_network_subnet_id = data.azurerm_subnet.subnet.id
    }
  }
}


resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_windows_web_app.front.id
  subnet_id      = data.azurerm_subnet.subnet2.id

  depends_on = [
    azurerm_windows_web_app.front
  ]
}
