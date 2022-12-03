provider "azurerm" {

  # Configuration options
  subscription_id = "03e358a9-ffed-4ad1-8eca-44a40446a295"
  client_id       = "7a0746b4-34c3-47c2-bb39-d68f6f5882fa"
  client_secret   = "b298Q~Mx3sgaML64PPwY2cEdiWSrPw0BXCNgqcdq"
  tenant_id       = "e14e73eb-5251-4388-8d67-8f9f2e2d5a46"

  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id

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


