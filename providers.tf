provider "azurerm" {

  # Configuration options


  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {

  }
}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate21344"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }


}


