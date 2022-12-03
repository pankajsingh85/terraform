variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "subnet_name" {
  type        = string
  default = "db"
}

variable "vnet_name" {
  type        = string
  default = "vnet"
}



variable "network_interface_name" {
  type        = string
  default = "sqls-vm-nic"
}


variable "network_interface_ip_configuration_name" {
  type        = string
  default = "internal"
}

variable "private_ip_allocation_method" {
  description = "location of the resource group to be imported."
  type        = string
  default = "Dynamic" 
}


variable "network_security_group_name" {
  default="SecurityGroup1"
}



variable "vm_name" {
  description = "location of the resource group to be imported."
  type        = string
  default = "sqlvm2312"
}

variable "vm-size" {
  default="Standard_B2ms"
}

variable "vm_admin_name" {
  default = "admin123"
}

variable "vm_password" {
  default = "Password1234"
}


variable "source_image_reference_publisher" {
  default="MicrosoftSQLServer"
}

variable "source_image_reference_offer" {
  default="sql2019-ws2022"
}

variable "source_image_reference_sku" {
  default ="web-gen2"
}

variable "source_image_reference_version" {
  default="15.0.221108"
}
