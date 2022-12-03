
//db subnet
data "azurerm_subnet" "db_subnet"{
  name=var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
}


resource "azurerm_network_interface" "interface" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.network_interface_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.db_subnet.id
    private_ip_address_allocation = var.private_ip_allocation_method
    
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  
}


resource "azurerm_network_interface_security_group_association" "nsg_link" {
  network_interface_id      = azurerm_network_interface.interface.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_windows_virtual_machine" "sql_vm" {
  name                = var.vm_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  size                = var.vm-size
  admin_username      = var.vm_admin_name
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer=var.source_image_reference_offer
    publisher=var.source_image_reference_publisher
    sku=var.source_image_reference_sku
    version=var.source_image_reference_version
  }
}