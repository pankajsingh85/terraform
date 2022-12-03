resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  address_space       = [var.address_space]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}


resource "azurerm_subnet" "subnet" {
  for_each=var.pools
  name=each.value.subnet_name
  resource_group_name=var.resource_group_name
  virtual_network_name=azurerm_virtual_network.vnet.name
  address_prefixes = each.value.address_prefixes

    delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}


resource "azurerm_subnet" "subnet2" {
  for_each=var.subnets
  name=each.value.subnet_name
  resource_group_name=var.resource_group_name
  virtual_network_name=azurerm_virtual_network.vnet.name
  address_prefixes=each.value.address_prefixes


  depends_on = [
    azurerm_virtual_network.vnet
  ]

}



