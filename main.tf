terraform {
  backend "azurerm" {
    resource_group_name  = "DSO_RG_UAT"
    storage_account_name = "dsostorageacc"
    container_name       = "tfstate"
    key                  = "main.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}
