variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "frontend_subnet_name" {
  default = "front"
}

variable "appgtwy_subnet_name" {
  default = "appgtwy"
}

variable "vnet_name" {
  default="vnet"
}

variable "frontend_service_plan" {
  default="fe-plan"
}

variable "os_type" {
  default = "Windows"
}

variable "sku" {
  default = "B2"
}

variable "web_app_name" {
  default="fe324"
}

variable "ip_restriction_action" {
  default="Allow"
}