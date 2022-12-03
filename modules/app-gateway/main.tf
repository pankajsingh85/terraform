data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

resource "azurerm_public_ip" "example" {
  name                = var.appgateway_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.public_ip_allocation_method
}

locals {
  backend_address_pool_name      = "beap"
  frontend_port_name             = "feport"
  frontend_ip_configuration_name = "feip"
  http_setting_name              = "appgtwy-setting"
  listener_name                  = "httplstn"
  request_routing_rule_name      = "routing-rule"
  redirect_configuration_name    = "rdirect-cfg-name"
}

resource "azurerm_application_gateway" "network" {
  name                = var.appgateway_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  sku {
    name     = var.appgateway_sku_name
    tier     = var.appgateway_sku_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example.id
  }

  backend_address_pool {
    name  = local.backend_address_pool_name
    fqdns = ["fe324.azurewebsites.net"]
  }


  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = var.backend_settings_cookie_based_affinity
    port                  = var.backend_settings_port
    protocol              = var.backend_settings_protocol
    request_timeout       = var.backend_settings_request_timeout
    probe_name            = var.probe_name
    pick_host_name_from_backend_address = true
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = var.http_listener_protocol
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = var.request_routing_rule_type
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  probe {
    name                                      = var.probe_name
    pick_host_name_from_backend_http_settings = var.pick_host_name
    interval                                  = var.probe_interval
    protocol                                  = var.probe_protocol
    path                                      = var.probe_path
    timeout                                   = var.probe_timeout
    unhealthy_threshold                       = var.unhealthy_threshold_value
  }
}


