variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "subnet_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "agent-vm"
}

variable "vnet_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "vnet"
}

variable "vm-public-ip" {
  description = "location of the resource group to be imported."
  type        = string
  default = "agent-vm-pip"
}


variable "public_ip_allocation_method" {
  description = "location of the resource group to be imported."
  type        = string
  default = "Dynamic" 
}

variable "network_interface_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "agent-vm-nic"
}


variable "network_interface_ip_configuration_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "internal"
}

variable "private_ip_allocation_method" {
  description = "location of the resource group to be imported."
  type        = string
  default = "Dynamic" 
}


variable "security_rule_name" {
  default = "rule1"
}

variable "security_rule_priority" {
  default = 100
}

variable "security_rule_direction" {
  default = "Inbound"
}

variable "security_rule_access" {
  default = "Allow"
}

variable "security_rule_protocol" {
  default="Tcp"
}


variable "security_rule_source_port_range"{
  default="*"
}

variable "security_rule_destination_port_range" {
  default="3389"
}

variable "security_rule_source_address_prefix"{
  default="*"
}

variable "security_rule_destination_address_prefix"{
  default="*"
}

variable "network_security_group_name" {
  default="SecurityGroup2"
}



variable "vm_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "agent-vm"
}

variable "vm-size" {
  default="Standard_B2ms"
}

variable "vm_admin_name" {
  default = "admin123"
  sensitive = true
}

variable "vm_password" {
  default = "Password1234"
  sensitive = true
}


variable "source_image_reference_publisher" {
  default="microsoftwindowsserver" 
}

variable "source_image_reference_offer" {
  default="windowsserver"
}

variable "source_image_reference_sku" {
  default ="2019-datacenter"
}

variable "source_image_reference_version" {
  default="latest"
}

