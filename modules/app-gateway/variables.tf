variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "vnet_name"{
  default = "vnet"
}

variable "subnet_name" {
  default = "appgtwy"
}

variable "appgateway_public_ip_name" {
  default = "pip"
}

variable "public_ip_allocation_method" {
 default="Dynamic" 
}

variable "appgateway_name" {
  default = "appgateway121"
}

variable "appgateway_sku_name" {
  default = "Standard_Medium"
}

variable "appgateway_sku_tier" {
  default = "Standard"
}

variable "gateway_ip_configuration_name" {
  default = "gateway-ip-configuration"
}


variable "backend_settings_cookie_based_affinity" {
  default="Disabled"
}


variable "backend_settings_port" {
  default=80
}

variable "backend_settings_protocol" {
  default="Http"
}

variable "backend_settings_request_timeout" {
  default=120
}

variable "frontend_port" {
  default=80
}

variable "http_listener_protocol" {
  default="Http"
}

variable "request_routing_rule_type" {
  default = "Basic"
}


variable "probe_name" {
  default = "hprobe"
}

variable "pick_host_name" {
  default = true
}

variable "probe_interval" {
  default =30
}

variable "probe_timeout" {
  default = 60
}

variable "probe_protocol" {
  default = "Http"
}

variable "probe_path" {
  default="/"
}

variable "unhealthy_threshold_value" {
  default = 1
}