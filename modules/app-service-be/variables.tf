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

variable "backend_subnet_name" {
  default = "back"
}

variable "vnet_name" {
  default="vnet"
}

variable "backend_service_plan" {
  default="be-plan"
}

variable "os_type" {
  default = "Linux"
}

variable "sku" {
  default = "B2"
}

variable "web_app_name" {
  default="be532"
}

variable "ip_restriction_action" {
  default="Allow"
}