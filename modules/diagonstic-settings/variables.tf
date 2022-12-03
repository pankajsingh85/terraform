variable "diagnostics_settings_name" {
    type = string
    description = "diagnostics setting name"
    default = "diag"
}

variable "frontend_app_service_name" {
  default = "fe324"
}

variable "backend_app_service_name" {
  default = "be532"
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "log analytics workspace name"
  type=string
  default = "acctest101" 
}


variable "storage_account_name"{
  description = "storage account name"
  type=string
  default = "diagonsticsettings121"
}

variable "storage_account_tier" {
  description = "storage account tier"
  type=string
  default = "Standard"
}

variable "storage_account_replication_type" {
  description = "storage account replication type"
  type=string
  default="GRS"  
}



variable "retention_days" {
  description = "retention days of log analytics workspace"
  type=string
  default = 30
}

variable "log_category_grp" {
  description = "metric cateogory"
  type=string
  default = "allLogs"  
}

variable "metric_category" {
  description = "metric cateogory"
  type=string
  default = "AllMetrics"
  
}