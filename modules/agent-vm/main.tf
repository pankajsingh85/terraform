data "azurerm_subnet" "subnet3"{
  name=var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
}

resource "azurerm_public_ip" "publicIp" {
  name                = var.vm-public-ip
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.public_ip_allocation_method
}

resource "azurerm_network_interface" "example" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.network_interface_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet3.id
    private_ip_address_allocation = var.private_ip_allocation_method
    public_ip_address_id = azurerm_public_ip.publicIp.id
  }
}

resource "azurerm_network_security_group" "example" {
  name                = var.network_security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = var.security_rule_access
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port_range
    destination_port_range     = var.security_rule_destination_port_range
    source_address_prefix      = var.security_rule_source_address_prefix
    destination_address_prefix = var.security_rule_destination_address_prefix
  } 
}


resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  size                = var.vm-size
  admin_username      = var.vm_admin_name
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher= var.source_image_reference_publisher
    offer = var.source_image_reference_offer
    sku = var.source_image_reference_sku
    version =var.source_image_reference_version
  }
}