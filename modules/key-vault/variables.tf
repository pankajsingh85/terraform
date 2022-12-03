variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}

variable "keyvault_name" {
  default = "keyvault273"
}

variable "pools" {
  description = "Map of pools to configuration."
  type        = map(any)
  # sensitive = true
  default = {
    "secret_1" = {
      secret_name  = "host"
      secret_value = "10.0.3.4"
    },
    "secret_2" = {
      secret_name  = "username"
      secret_value = "pankajsingh"
    },
    "secret_3" = {
      secret_name  = "password"
      secret_value = "abcd"
    }
  }
}

variable "policies" {
  description = "Map of pools to configuration."
  type        = map(any)
  # sensitive = true
  default = {
    "first_policy" = {
      tenant_id = "e14e73eb-5251-4388-8d67-8f9f2e2d5a46"
      object_id = "477cd58a-2a99-4d02-bab6-27c4933d4767"
    },
    "second_policy" = {
      tenant_id = "e14e73eb-5251-4388-8d67-8f9f2e2d5a46"
      object_id = "93c94282-4968-4c9a-beff-8dcdc70ed7cc"
    }
  }
}



