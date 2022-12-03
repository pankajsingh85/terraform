# variable "subscription_id" {
  
# }

# variable "client_id" {
  
# }

# variable "client_secret" {
  
# }

# variable "tenant_id" {
  
# }

variable "resource_grp_name" {
  description = "Name of the resource group to be imported."
  type        = string  
  default="my-resources"
}

variable "resource_grp_location" {
    description = "Location of the resource group to be imported."
    type        = string
    default = "west europe"
}